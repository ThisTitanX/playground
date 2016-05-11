// Copyright 2016 Las Venturas Playground. All rights reserved.
// Use of this source code is governed by the MIT license, a copy of which can
// be found in the LICENSE file.

const PriorityQueue = require('base/priority_queue.js');
const VehicleGrid = require('features/vehicles/vehicle_grid.js');

// An empty set that may be used to prevent repeated allocations. Should not be modified.
const EMPTY_SET = new Set();

// The default streaming distance for vehicles.
const DefaultStreamDistance = 300;

// The maximum number of vehicles that the streamer will create at any one time.
const DefaultVehicleLimit = 800;

// The number of closest vehicle to each player that should be attempted to be spawned.
const DefaultVehiclesPerPlayer = 20;

// The vehicle streamer is responsible for making sure that sufficient vehicles have been created
// around players to give everyone the feeling that there are plenty of them available. It does
// this by maintaining a grid of the original vehicle locations, so that the nearest vehicles to
// each players can quickly and accurately be determined.
class VehicleStreamer {
    constructor(vehicleLimit = DefaultVehicleLimit, vehicleConstructor = Vehicle) {
        this.grid_ = new VehicleGrid(DefaultStreamDistance);
        this.initialized_ = false;

        this.vehicleLimit_ = vehicleLimit;
        this.liveVehicleCount_ = 0;

        // The constructor that will be used for creating vehicles.
        this.vehicleConstructor_ = vehicleConstructor;

        // Persistent vehicles will always exist and bypass the grid streamer.
        this.persistentVehicles_ = new Set();

        // Mapping of players to the set of vehicles that are referenced by them.
        this.playerReferences_ = new Map();

        // A prioritized queue containing the streamable vehicles that aren't being kept alive for
        // any of the players, but are being kept alive to reduce vehicle churn.
        this.disposableVehicles_ = new PriorityQueue(VehicleStreamer.totalRefCountComparator);
    }

    // Gets the number of vehicles that are on the disposable vehicle list.
    get disposableVehicleCount() { return this.disposableVehicles_.size(); }

    // Gets the number of vehicles that are live right now.
    get liveVehicleCount() { return this.liveVehicleCount_; }

    // Gets the number of persistent vehicles in the game.
    get persistentVehicleCount() { return this.persistentVehicles_.size; }

    // Gets the number of streamed vehicles in the game.
    get streamedVehicleCount() { return this.grid_.size; }

    // Returns whether the streamer has been initialized for streaming use.
    isInitialized() { return this.initialized_; }

    // Adds the |storedVehicle| to the vehicle streamer. The state for players will only be
    // recomputed if the streamer has been initialized already.
    addVehicle(storedVehicle) {
        if (storedVehicle.vehicle)
            throw new Error('Vehicles must not have been created when being added to the streamer');

        if (!storedVehicle.isPersistent()) {
            this.grid_.addVehicle(storedVehicle);
            return;
        }

        if (this.initialized_) {
            if (!this.allocateVehicleSlot(storedVehicle, true /* forceAllocate */))
                throw new Error('Too many persistent vehicles have been created for the streamer.');

            this.internalCreateVehicle(storedVehicle);
        }

        this.persistentVehicles_.add(storedVehicle);
    }

    // Removes the |storedVehicle| from the vehicle streamer.
    removeVehicle(storedVehicle) {
        if (!this.initialized_)
            throw new Error('Vehicles may not be removed before the initial initialization.');

        if (storedVehicle.isPersistent()) {
            if (this.persistentVehicles_.delete(storedVehicle))
                this.internalDestroyVehicle(storedVehicle);

            return;
        }

        this.grid_.removeVehicle(storedVehicle);

        if (!storedVehicle.vehicle)
            return;  // the vehicle has not been streamed in by any player

        this.internalDestroyVehicle(storedVehicle);

        for (let [player, references] of this.playerReferences_) {
            if (references.delete(storedVehicle))
                storedVehicle.decreaseRefCount();
        }

        if (storedVehicle.refCount != 0)
            throw new Error('The vehicle has stray references after processing all players.');
    }

    // Initializes the streamer. This must be called after the initial vehicle import to make sure
    // that the right vehicles have been created, and have been associated with the right players.
    initialize() {
        if (this.initialized_)
            throw new Error('The vehicle streamer cannot be initialized multiple times.');

        for (let storedVehicle of this.persistentVehicles_) {
            if (this.liveVehicleCount_ >= this.vehicleLimit_)
                throw new Error('Too many persistent vehicles have been created for the streamer.');

            this.internalCreateVehicle(storedVehicle);
        }

        // Synchronously initialize vehicles for all in-game players.
        server.playerManager.forEach(player => this.streamForPlayer(player));

        this.initialized_ = true;
    }

    // Synchronously streams the vehicles for |player|.
    streamForPlayer(player) {
        const vehicleLimit = DefaultVehicleLimit - this.persistentVehicles_.size;
        const maximumVehiclesPerPlayer =
            Math.min(DefaultVehiclesPerPlayer, vehicleLimit / server.playerManager.count);

        const currentVehicles = this.playerReferences_.get(player) || EMPTY_SET;

        const updatedVehicles = this.grid_.closest(player, maximumVehiclesPerPlayer);
        const updatedVehicleSet = new Set(updatedVehicles);

        currentVehicles.forEach(storedVehicle => {
            if (updatedVehicleSet.has(storedVehicle))
                return;  // the vehicle has remained unchanged for the player

            // Dereference the vehicle for the |player|.
            storedVehicle.decreaseRefCount();

            // The vehicle may have to be destroyed if it has no further references.
            if (!storedVehicle.refCount)
                this.deallocateVehicleSlot(storedVehicle);
        });

        updatedVehicles.forEach((storedVehicle, index) => {
            if (currentVehicles.has(storedVehicle))
                return;  // the vehicle has already been streamed for the player

            // The vehicle has to be created if the |player| is the first to reference it. If no
            // slot could be allocated for the vehicle, bail out.
            if (!storedVehicle.refCount) {
                if (!this.allocateVehicleSlot(storedVehicle, !index /* forceAllocate */)) {
                    updatedVehicleSet.delete(storedVehicle);
                    return;
                }

                this.internalCreateVehicle(storedVehicle);
            }

            // Reference the vehicle for the |player|.
            storedVehicle.increaseRefCount();
        });

        this.playerReferences_.set(player, updatedVehicleSet);
    }

    // To be called when |player| disconnects from the server. Their vehicle references will be
    // released, and vehicles will be moved to the disposable vehicle list where possible.
    onPlayerDisconnect(player) {
        const references = this.playerReferences_.get(player);
        if (!references)
            return;

        references.forEach(storedVehicle => {
            // Dereference the vehicle for the |player|.
            storedVehicle.decreaseRefCount();

            // The vehicle may have to be destroyed if it has no further references.
            if (!storedVehicle.refCount)
                this.deallocateVehicleSlot(storedVehicle);
        });

        this.playerReferences_.delete(player);
    }

    // Returns whether a slot can be allocated for |storedVehicle|. Will return false in case the
    // streaming limit has been reached and no slot could be freed up elsewhere. The |forceAllocate|
    // flag may be used to enable exceeding the limits if all else fails.
    allocateVehicleSlot(storedVehicle, forceAllocate = false) {
        if (this.liveVehicleCount_ < this.vehicleLimit_)
            return true;  // we've got space to grow

        if (this.disposableVehicles_.size() > 0) {
            this.internalDestroyVehicle(this.disposableVehicles_.pop());
            return true;  // a disposable vehicle has been destroyed
        }

        // The limit may temporarily be exceeded if the |forceAllocate| flag has been set. A warning
        // will be displayed to the console, however.
        if (forceAllocate && this.liveVehicleCount_ < (1.2 * this.vehicleLimit_)) {
            if (!server.isTest()) {
                console.log('[VehicleStreamer] Exceeding the vehicle limit to spawn vehicle #' +
                            storedVehicle.databaseId + '.');
            }

            return true;
        }

        return false;
    }

    // Deallocated the |storedVehicle|, which means that it is ready to be destroyed. In practice
    // this means that it will be added to the disposable vehicle list instead.
    deallocateVehicleSlot(storedVehicle) {
        this.disposableVehicles_.push(storedVehicle);
    }

    // Clears all disposable vehicles that are currently alive in the streamer. In practice this
    // should never be necessary, except for testing purposes.
    clearDisposableVehicles() {
        while (this.disposableVehicles_.size())
            this.internalDestroyVehicle(this.disposableVehicles_.pop());
    }

    // Actually creates the vehicle associated with |storedVehicle| and returns the |vehicle|
    // instance it's now associated with. The instance will be set on the |storedVehicle| as well.
    internalCreateVehicle(storedVehicle) {
        if (!storedVehicle.vehicle) {
            storedVehicle.vehicle = new this.vehicleConstructor_({
                modelId: storedVehicle.modelId,
                position: storedVehicle.position,
                rotation: storedVehicle.rotation,
                colors: [ storedVehicle.primaryColor, storedVehicle.secondaryColor ],
                paintjob: storedVehicle.paintjob,
                interiorId: storedVehicle.interiorId
            });

            this.liveVehicleCount_++;
        } else {
            if (!this.disposableVehicles_.delete(storedVehicle))
                console.log('[VehicleStreamer] A stored vehicle was found to be in invalid state.');
        }

        return storedVehicle.vehicle;
    }

    // Removes the vehicle associated with the |storedVehicle| from the server.
    internalDestroyVehicle(storedVehicle) {
        if (!storedVehicle.vehicle)
            return;  // the vehicle does not exist on the server anymore

        this.liveVehicleCount_--;

        storedVehicle.vehicle.dispose();
        storedVehicle.vehicle = null;
    }

    dispose() {
        this.grid_.dispose();

        this.disposableVehicles_ = null;
        this.playerReferences_ = null;
        this.persistentVehicles_ = null;
        this.grid_ = null;
    }

    // Comparator for ordering the list of disposable vehicles by total number of references in
    // ascending order. The top of the list contains vehicles most appropriate to remove.
    static totalRefCountComparator(lhs, rhs) {
        if (lhs.totalRefCount === rhs.totalRefCount)
            return 0;

        return lhs.totalRefCount > rhs.totalRefCount ? 1 : -1;
    }
}

exports = VehicleStreamer;

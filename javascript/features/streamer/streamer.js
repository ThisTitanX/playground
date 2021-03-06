// Copyright 2016 Las Venturas Playground. All rights reserved.
// Use of this source code is governed by the MIT license, a copy of which can
// be found in the LICENSE file.

const Feature = require('components/feature_manager/feature.js');
const PickupStreamer = require('features/streamer/pickup_streamer.js');
const Scheduler = require('features/streamer/scheduler.js');
const VehicleStreamer = require('features/streamer/vehicle_streamer.js');

// There are various limits in both GTA: San Andreas and San Andreas: Multiplayer that limit the
// amount of things we can do in Las Venturas Playground. We implement our own set of streamers for
// that reason, enabling features to go beyond these limits if they must.
class Streamer extends Feature {
    constructor() {
        super();

        // The streaming distance that will apply to all streamers on LVP.
        const streamingDistance = 300 /* units */;

        this.vehicleStreamer_ = new VehicleStreamer({
            maxVisible: 1000 /* max vehicles */,
            streamingDistance
        });

        this.pickupStreamer_ = new PickupStreamer({
            maxVisible: 500 /* max pickups */,
            streamingDistance: 150
        });

        this.scheduler_ = new Scheduler(this.vehicleStreamer_);
        this.scheduler_.addStreamer(this.vehicleStreamer_);
        this.scheduler_.addStreamer(this.pickupStreamer_);

        // Starts running the scheduler until this feature gets disposed of.
        this.scheduler_.start();
    }

    // ---------------------------------------------------------------------------------------------
    // Public API of the Streamer feature.
    // ---------------------------------------------------------------------------------------------

    // Returns the vehicle streamer for Las Venturas Playground. Note that the vehicle streamer is
    // only responsible for vehicles created in the main virtual world, in the main interior.
    getVehicleStreamer() {
        return this.vehicleStreamer_;
    }

    // Returns the pickup streamer for Las Venturas Playground.
    getPickupStreamer() {
        return this.pickupStreamer_;
    }

    // ---------------------------------------------------------------------------------------------

    dispose() {
        this.scheduler_.dispose();
        this.scheduler_ = null;

        this.pickupStreamer_.dispose();
        this.pickupStreamer_ = null;

        this.vehicleStreamer_.dispose();
        this.vehicleStreamer_ = null;
    }
}

exports = Streamer;

// Copyright 2016 Las Venturas Playground. All rights reserved.
// Use of this source code is governed by the MIT license, a copy of which can
// be found in the LICENSE file.

const Dialog = require('components/dialogs/dialog.js');
const Vector = require('base/vector.js');

// Maximum number of milliseconds during which the identity beam should be displayed.
const IDENTITY_BEAM_DISPLAY_TIME_MS = 5000;

// This class provides the `/house` command available to administrators to manage parts of the
// Houses feature on Las Venturas Playground. Most interaction occurs through dialogs.
class HouseCommands {
    constructor(manager, announce, economy) {
        this.manager_ = manager;

        this.announce_ = announce;
        this.economy_ = economy;

        // Command: /house [create/modify]
        server.commandManager.buildCommand('house')
            .restrict(Player.LEVEL_MANAGEMENT)
            .sub('create')
                .build(HouseCommands.prototype.onHouseCreateCommand.bind(this))
            .sub('modify')
                .build(HouseCommands.prototype.onHouseModifyCommand.bind(this))
            .build(HouseCommands.prototype.onHouseCommand.bind(this));
    }

    // Called when an administrator types `/house create`. It will confirm with them whether they
    // do want to create a house at their current location, together with the price range for which
    // the house will be on offer to players.
    async onHouseCreateCommand(player) {
        const position = player.position;

        const minimumPrice = this.economy_.calculateHousePrice(position, 0 /* interiorValue */);
        const maximumPrice = this.economy_.calculateHousePrice(position, 9 /* interiorValue */);

        const confirmation =
            await Dialog.displayMessage(player, 'Create a new house location',
                                        Message.format(Message.HOUSE_CREATE_CONFIRM, minimumPrice,
                                                                                     maximumPrice),
                                        'Yes' /* leftButton */, 'No' /* rightButton */);

        if (!confirmation.response)
            return;

        await this.manager_.createLocation(player, position);

        // Announce creation of the location to other administrators.
        this.announce_.announceToAdministrators(
            Message.HOUSE_ANNOUNCE_CREATED, player.name, player.id);

        // Display a confirmation dialog to the player to inform them of their action.
        Dialog.displayMessage(player, 'Create a new house location',
                              Message.format(Message.HOUSE_CREATE_CONFIRMED),
                              'Close' /* leftButton */, '' /* rightButton */);
    }

    // Called when an administrator types the `/house modify` command to change settings for the
    // house closest to their location, allowing them to, for example, add or remove parking lots.
    async onHouseModifyCommand(player) {
        const closestLocation =
            await this.manager_.findClosestLocation(player, 15 /* maximumDistance */);

        if (!closestLocation) {
            player.sendMessage(Message.HOUSE_MODIFY_NONE_NEAR);
            return;
        }

        // Create a beam at the house's entrance to clarify what's being edited.
        const identityBeamObject = server.objectManager.createObject({
            modelId: 11753 /* narrow red beam */,
            position: closestLocation.position,
            rotation: new Vector(0, 0, 0)
        });

        // Automatically remove the beam after the given number of milliseconds.
        wait(IDENTITY_BEAM_DISPLAY_TIME_MS).then(() => {
            if (identityBeamObject.isConnected())
                identityBeamObject.dispose();
        });

        // ...
    }

    // Called when an administrator types the `/house` command. Gives an overview of the available
    // options, with information on how to use the command.
    onHouseCommand(player) {
        player.sendMessage(Message.HOUSE_HEADER);
        player.sendMessage(Message.HOUSE_INFO_1);
        player.sendMessage(Message.HOUSE_INFO_2);
        player.sendMessage(Message.COMMAND_USAGE, '/house [create/modify]');
    }

    dispose() {
        server.commandManager.removeCommand('house');

        this.economy_ = null;
        this.announce_ = null;

        this.manager_ = null;
    }
}

exports = HouseCommands;

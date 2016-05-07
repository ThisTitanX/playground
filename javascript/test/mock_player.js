// Copyright 2016 Las Venturas Playground. All rights reserved.
// Use of this source code is governed by the MIT license, a copy of which can
// be found in the LICENSE file.

// Mocked player. Has the same interface and abilities as a real Player object, except that it does
// not rely on the SA-MP server to be available, nor communicates with Pawn.
class MockPlayer {
    constructor(playerId, event) {
        this.id_ = playerId;

        this.name_ = event.name || 'Player' + playerId;
        this.level_ = event.level || Player.LEVEL_PLAYER;
        this.userId_ = null;
        this.ipAddress_ = event.ipAddress || '127.0.0.1';

        this.dialogPromiseResolve_ = null;
        this.dialogPromise_ = new Promise(resolve => {
            this.dialogPromiseResolve_ = resolve;
        });

        this.lastDialogMessage_ = null;
        this.lastDialogId_ = null;
        this.lastPlayedSound_ = null;

        this.messages_ = [];

        this.messageLevel_ = 0;

        this.connected_ = true;
        this.disconnecting_ = false;
    }

    get id() { return this.id_; }

    isConnected() { return this.connected_; }

    isDisconnecting() { return this.disconnecting_; }

    notifyDisconnecting() {
        this.disconnecting_ = true;
    }

    notifyDisconnected() {
        this.connected_ = false;
        this.disconnecting_ = false;
    }

    get name() { return this.name_; }
    set name(value) { this.name_ = value; }

    get ipAddress() { return this.ipAddress_; }

    get level() { return this.level_; }
    set level(value) { this.level_ = value; }

    isAdministrator() {
        return this.level_ == Player.LEVEL_ADMINISTRATOR ||
               this.level_ == Player.LEVEL_MANAGEMENT;
    }

    isManagement() { return this.level_ == Player.LEVEL_MANAGEMENT; }

    isRegistered() { return this.userId_ != null; }

    get userId() { return this.userId_; }

    // Fake implementation of the ShowPlayerDialog() native. Used to be able to mock responses to
    // dialogs and make that entire sub-system testable as well.
    showDialog(dialogId, style, caption, message, leftButton, rightButton) {
        this.lastDialogId_ = dialogId;
        this.lastDialogMessage_ = message;

        this.dialogPromiseResolve_();
    }

    // Gets the most recent message that has been displayed in a dialog to the player.
    get lastDialog() { return this.lastDialogMessage_; }

    // Sends |message| to the player. It will be stored in the local messages array and can be
    // retrieved through the |messages| getter.
    sendMessage(message, ...args) {
        if (message instanceof Message)
            message = Message.format(message, ...args);

        this.messages_.push(message.toString());
    }

    // Clears the messages that have been sent to this player.
    clearMessages() { this.messages_ = []; }

    // Gets the messages that have been sent to this player.
    get messages() { return this.messages_; }

    // Sets whether the player should be in spectator mode. Disabling spectator mode will force them
    // to respawn immediately after, which may be an unintended side-effect.
    setSpectating(spectating) {}

    // Sets the player's camera to |position| and |target|, both of which must be vectors.
    setCamera(position, target) {}

    // Interpolates the player's camera from |positionFrom|, |targetFrom| to |positionTo|, |targetTo|,
    // which must be vectors, in |duration| milliseconds.
    interpolateCamera(positionFrom, positionTo, targetFrom, targetTo, duration) {}

    // Fake playing a sound for this player. Stores the soundId in |lastPlayedSound_|.
    playSound(soundId) {
        this.lastPlayedSound_ = soundId;
    }

    // Gets the most recently played sound for this player.
    get lastPlayedSound() { return this.lastPlayedSound_; }

    // Gets or sets the message level at which this player would like to receive messages.
    get messageLevel() { return this.messageLevel_; }
    set messageLevel(value) { this.messageLevel_ = value; }

    // Identifies the player to a fake account. The options can be specified optionally.
    identify({ userId = 42, gangId = 0 } = {}) {
        server.playerManager.onPlayerLogin({
            playerid: this.id_,
            userid: userId,
            gangid: gangId
        });
    }

    // Issues |message| as if it has been said by this user. Returns whether the event with which
    // the chat message had been issues was prevented.
    issueMessage(message) {
        let defaultPrevented = false;

        // TODO(Russell): Should this talk directly to the CommunicationManager?
        self.dispatchEvent('playertext', {
            preventDefault: () => defaultPrevented = true,

            playerid: this.id_,
            text: message
        });

        return defaultPrevented;
    }

    // Issues |commandText| as if it had been send by this player. Returns whether the event with
    // which the command had been issued was prevented.
    issueCommand(commandText) {
        let defaultPrevented = false;

        server.commandManager.onPlayerCommandText({
            preventDefault: () => defaultPrevented = true,

            playerid: this.id_,
            cmdtext: commandText
        });

        return defaultPrevented;
    }

    // Responds to an upcoming dialog with the given values. The dialog Id that has been shown
    // for the player will be inserted automatically. Responses are forcefully asynchronous.
    respondToDialog({ response = 1 /* left button */, listitem = 0, inputtext = '' } = {}) {
        return this.dialogPromise_.then(() => {
            global.dispatchEvent('dialogresponse', {
                playerid: this.id_,
                dialogid: this.lastDialogId_,
                response: response,
                listitem: listitem,
                inputtext: inputtext
            });

            return this.dialogPromise_ = new Promise(resolve => {
                this.dialogPromiseResolve_ = resolve;
            });
        });
    }

    // Disconnects the player from the server. They will be removed from the PlayerManager too.
    disconnect(reason = 0) {
        server.playerManager.onPlayerDisconnect({
            playerid: this.id_,
            reason: reason
        });
    }

    // TODO: Add new getters and setters as required.
}

exports = MockPlayer;

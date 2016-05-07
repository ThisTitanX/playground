// Copyright 2015 Las Venturas Playground. All rights reserved.
// Use of this source code is governed by the MIT license, a copy of which can
// be found in the LICENSE file.

const CommandBuilder = require('components/command_manager/command_builder.js');
const DefaultInteriorList = require('components/interior_selector/default_interior_list.js');
const Feature = require('components/feature_manager/feature.js');
const InteriorSelector = require('components/interior_selector/interior_selector.js');
const Vector = require('base/vector.js');

// Utility function to return |value| in |len| digits, left-padded with zeros when necessary.
function leftPad(value, len = 2) {
  return ('0' + value).slice(-2);
}

// The debug feature offers useful tools for administrators to debug the server or the Las Venturas
// Playground gamemode itself. It's driven by a number of in-game comments.
class DebugFeature extends Feature {
  constructor(playground) {
    super(playground);

    // /serverfps
    server.commandManager.buildCommand('serverfps')
        .restrict(Player.LEVEL_ADMINISTRATOR)
        .build(this.__proto__.serverFrameCounter.bind(this));

    // /trace [seconds]
    server.commandManager.buildCommand('trace')
        .restrict(Player.LEVEL_MANAGEMENT)
        .parameters([{ name: 'seconds', type: CommandBuilder.NUMBER_PARAMETER }])
        .build(this.__proto__.captureTrace.bind(this));

    // /sound [id]
    server.commandManager.buildCommand('sound')
        .restrict(Player.LEVEL_MANAGEMENT)
        .parameters([{ name: 'sound', type: CommandBuilder.NUMBER_PARAMETER }])
        .build(this.__proto__.playSound.bind(this));

    // intsel
    server.commandManager.buildCommand('intsel')
        .restrict(Player.LEVEL_ADMINISTRATOR)
        .build(this.__proto__.intsel.bind(this));

    // /pos [x] [y] [z]
    server.commandManager.buildCommand('pos')
        .restrict(Player.LEVEL_ADMINISTRATOR)
        .parameters([ { name: 'x', type: CommandBuilder.NUMBER_PARAMETER },
                      { name: 'y', type: CommandBuilder.NUMBER_PARAMETER },
                      { name: 'z', type: CommandBuilder.NUMBER_PARAMETER } ])
        .build(this.__proto__.pos.bind(this));

    // /int [id]
    server.commandManager.buildCommand('int')
        .restrict(Player.LEVEL_ADMINISTRATOR)
        .parameters([ { name: 'id', type: CommandBuilder.NUMBER_PARAMETER } ])
        .build(this.__proto__.int.bind(this));

    // /cam
    server.commandManager.buildCommand('cam')
        .restrict(Player.LEVEL_ADMINISTRATOR)
        .build(this.__proto__.cam.bind(this));
  }

  // Displays the number of FPS the server was able to handle since the last call to this command.
  serverFrameCounter(player) {
    let stats = global.frameCounter(),
        message = Message.format(Message.DEBUG_FRAME_COUNTER, stats.fps, stats.duration / 1000);

    player.sendMessage(message)
  }

  // Captures a trace for |seconds| (which must be in range of [0, 300]) and stores it to the
  // trace.log.[DMYHIS] file in the server's root directory.
  captureTrace(player, seconds) {
    if (typeof seconds !== 'number' || seconds < 0 || seconds > 300) {
      player.sendMessage(Message.DEBUG_TRACE_INVALID_TIME);
      return;
    }

    let date = new Date(),
        filename = 'trace.log.';

    filename += date.getUTCFullYear() + leftPad(date.getUTCMonth() + 1) + leftPad(date.getUTCDate());
    filename += leftPad(date.getUTCHours()) + leftPad(date.getUTCMinutes()) +
                leftPad(date.getUTCSeconds());

    global.startTrace();
    wait(seconds * 1000).then(() => {
      global.stopTrace(filename);

      if (player.isConnected())
        player.sendMessage(Message.DEBUG_TRACE_FINISHED);
    });

    player.sendMessage(Message.DEBUG_TRACE_STARTED);
  }

  // Plays |soundId| for all in-game players.
  playSound(player, soundId) {
    server.playerManager.forEach(p => p.playSound(soundId));
  }

  // Starts the interior selector for the |player|.
  intsel(player) {
    InteriorSelector.select(player, DefaultInteriorList).then(interior => {
      if (interior)
        player.sendMessage('You selected: ' + interior.name);
      else
        player.sendMessage('You did not select an interior');
    });
  }

  // Changes the position of |player| to the vector of [x, y, z].
  pos(player, x, y, z) {
    player.position = new Vector(x, y, z);
  }

  // Changes the interior of |player| to |id|.
  int(player, id) {
    player.interior = id;
  }

  // Has the player spectate their current position.
  cam(player) {
    player.setSpectating(true);

    const position = player.position;
    const camera = new Vector(position.x, position.y, position.z + 10);

    player.setCamera(camera, position);

    wait(5000).then(() => player.setSpectating(false));
  }
}

exports = DebugFeature;

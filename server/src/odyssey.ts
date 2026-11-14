#!/usr/bin/env node

import * as fs from "fs";
import { Command } from "commander";
import * as path from 'path';
import { GameServer } from "./server/game/server";
import { AdminServer } from './server/admin/admin-server';
import { GameState } from './game/game-state';

const program = new Command();
program
  .option('-c, --config [config]', 'Configuration File')
  .parse(process.argv);

let configFile = program.opts().config || 'config/odyssey.config.json';

let config: Server.Config;
try {
  config = JSON.parse(fs.readFileSync(configFile, 'utf-8'));
} catch (ex) {
  console.error(`Unable to read ${configFile}`);
  console.error(ex);
  process.exit(-1);
}

//Write the absolute path back to config
config.scripts.directory = path.resolve(__dirname, '..', config.scripts.directory);
fs.mkdirSync(config.server.dataFolder, {recursive: true});
const release = require('../../tools/server-data-lock.cjs').lockData(config.server.dataFolder);
process.on('exit', release);

let gameState = new GameState(config);
let server = new GameServer(gameState);
let adminServer = config.server.adminEnabled === false ? null : new AdminServer(gameState);
// Mobile/browser client uses its own public game endpoint, never the admin API.
let mobileServer = config.server.webEnabled === false ? null : new (require('../../tools/mobile-server.cjs').MobileServer)(gameState);
let stopping = false;
function shutdown() {
  if (stopping) return;
  stopping = true;
  gameState.stop();
  for (const session of gameState.world.sessions.values()) session.save();
  process.exit(0);
}
process.on('message', message => { if (message === 'shutdown') shutdown(); });
process.on('SIGINT', shutdown);
process.on('SIGTERM', shutdown);
// Managed offline/host servers must not outlive a crashed launcher.
if (process.send) process.on('disconnect', shutdown);

#!/usr/bin/env node
"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
const fs = __importStar(require("fs"));
const commander_1 = require("commander");
const path = __importStar(require("path"));
const server_1 = require("./server/game/server");
const admin_server_1 = require("./server/admin/admin-server");
const game_state_1 = require("./game/game-state");
const program = new commander_1.Command();
program
    .option('-c, --config [config]', 'Configuration File')
    .parse(process.argv);
let configFile = program.opts().config || 'config/odyssey.config.json';
let config;
try {
    config = JSON.parse(fs.readFileSync(configFile, 'utf-8'));
}
catch (ex) {
    console.error(`Unable to read ${configFile}`);
    console.error(ex);
    process.exit(-1);
}
//Write the absolute path back to config
config.scripts.directory = path.resolve(__dirname, '..', config.scripts.directory);
fs.mkdirSync(config.server.dataFolder, { recursive: true });
const release = require('../../tools/server-data-lock.cjs').lockData(config.server.dataFolder);
process.on('exit', release);
let gameState = new game_state_1.GameState(config);
let server = new server_1.GameServer(gameState);
let adminServer = config.server.adminEnabled === false ? null : new admin_server_1.AdminServer(gameState);
// Mobile/browser client uses its own public game endpoint, never the admin API.
let mobileServer = config.server.webEnabled === false ? null : new (require('../../tools/mobile-server.cjs').MobileServer)(gameState);
let stopping = false;
function shutdown() {
    if (stopping)
        return;
    stopping = true;
    gameState.stop();
    for (const session of gameState.world.sessions.values())
        session.save();
    process.exit(0);
}
process.on('message', message => { if (message === 'shutdown')
    shutdown(); });
process.on('SIGINT', shutdown);
process.on('SIGTERM', shutdown);
// Managed offline/host servers must not outlive a crashed launcher.
if (process.send)
    process.on('disconnect', shutdown);
//# sourceMappingURL=odyssey.js.map
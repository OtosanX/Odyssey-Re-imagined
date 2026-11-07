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
exports.GameServer = void 0;
const net = __importStar(require("net"));
const client_1 = require("../client");
/**
 * Plain TCP server speaking the documented odyssey-2 protocol
 * (see odyssey-2-shared/docs/network.md). Replaces the former
 * ClassicServer/ClassicClient, which targeted VB6 client
 * compatibility — a goal this project has dropped in favor of a
 * modern client speaking this same protocol directly.
 */
class GameServer {
    constructor(gameState) {
        this.gameState = gameState;
        this.server = net.createServer((socket) => { this.onConnection(socket); });
        this.start();
    }
    start() {
        console.log(`Listening on ${this.gameState.config.server.port}`);
        this.server.on('error', error => { console.error(error); process.exit(1); });
        this.server.listen(this.gameState.config.server.port, this.gameState.config.server.host || '0.0.0.0', () => {
            const address = this.server.address();
            if (process.send)
                process.send({ type: 'ready', port: address.port, host: address.address });
        });
    }
    onConnection(socket) {
        console.log(`Connection from ${socket.remoteAddress}:${socket.remotePort}`);
        let client = new client_1.SocketClient(socket);
        this.gameState.clients.registerClient(client);
    }
}
exports.GameServer = GameServer;
//# sourceMappingURL=server.js.map
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
exports.Network = void 0;
const net = __importStar(require("net"));
const events_1 = require("events");
const shared_1 = require("./shared");
/**
 * Wire shape, per odyssey-2-shared/docs/network.md:
 *   [0]     UInt8    system
 *   [1]     UInt8    id
 *   [2..3]  UInt16BE length
 *   [4..]   payload
 *
 * (Earlier draft of this file used a different, undocumented framing
 * with a checksum/packetOrder header and no system byte — that never
 * matched the server and has been replaced to match the actual spec.)
 */
class Network extends events_1.EventEmitter {
    constructor(host, port) {
        super();
        this.host = host;
        this.port = port;
        this.cache = Buffer.allocUnsafe(0);
        this.socket = new net.Socket();
        this.socket.on('data', (chunk) => { this.onData(chunk); });
        this.socket.on('error', err => this.emit('status', err.message));
        this.socket.on('close', () => this.emit('status', 'Disconnected. Restart the client to reconnect.'));
    }
    async connect() {
        return new Promise((resolve, reject) => {
            this.socket.once('error', reject);
            this.socket.connect(this.port, this.host, () => {
                this.socket.removeListener('error', reject);
                resolve();
            });
        });
    }
    /**
     * Sends a message to the server
     *
     * @param message
     */
    sendMessage(message) {
        this.send(message.system, message.id, message.data);
    }
    /**
     * Sends a message to the server
     *
     * @param system
     * @param id
     * @param data
     */
    send(system, id, data) {
        const length = data.length;
        const buffer = Buffer.allocUnsafe(length + 4);
        buffer.writeUInt8(system, 0);
        buffer.writeUInt8(id, 1);
        buffer.writeUInt16BE(length, 2);
        data.copy(buffer, 4, 0);
        this.socket.write(buffer);
    }
    /**
     * Data event handler for the client Socket
     *
     * @param data
     */
    onData(data) {
        do {
            if (!this.msg) {
                data = Buffer.concat([this.cache, data], this.cache.length + data.length);
                if (data.length < 4) {
                    this.cache = data;
                    return;
                }
                this.cache = Buffer.allocUnsafe(0);
                const system = data.readUInt8(0);
                const id = data.readUInt8(1);
                const length = data.readUInt16BE(2);
                this.msg = new shared_1.Message(system, id, length);
                data = this.msg.append(data.slice(4));
            }
            else {
                data = this.msg.append(data);
            }
            if (this.msg.complete) {
                this.emit('message', this.msg);
                this.msg = null;
            }
        } while (data.length > 0);
    }
}
exports.Network = Network;
//# sourceMappingURL=network.js.map
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SocketClient = exports.Client = void 0;
const shared_1 = require("../shared");
const events_1 = require("events");
/**
 * Base client class
 */
class Client extends events_1.EventEmitter {
    constructor() {
        super(...arguments);
        this.playing = false;
    }
}
exports.Client = Client;
/**
 * Clients that communicate over traditional TCP Sockets
 */
class SocketClient extends Client {
    constructor(socket) {
        super();
        this.socket = socket;
        this.cache = Buffer.alloc(0);
        socket.setTimeout(15000,()=>{if(!this.account)socket.destroy();});
    socket.on('data', this.onData.bind(this));
        socket.on('close', this.onEnd.bind(this));
        socket.on('error', this.onError.bind(this));
    }
    get address() {
        // socket.address() describes the LOCAL end of the connection and can
        // be `{}` if the socket isn't connected yet in newer @types/node.
        // remoteAddress is what we actually want here: the connecting client's IP.
        return this.socket.remoteAddress || '';
    }
    sendMessage(msg) {
        return this.send(msg.system, msg.id, msg.data);
    }
    send(system, id, data) {
        let length = data.length;
        let buffer = Buffer.allocUnsafe(length + 4);
        // Wire order per odyssey-2-shared/docs/network.md:
        // [system:1][id:1][length:2][payload]
        buffer.writeUInt8(system, 0);
        buffer.writeUInt8(id, 1);
        buffer.writeUInt16BE(length, 2);
        data.copy(buffer, 4, 0);
        this.socket.write(buffer);
    }
    onData(data) {
        if (!this.msg) {
            data = Buffer.concat([this.cache, data]);
            this.cache = Buffer.alloc(0);
            if (data.length < 4) {
                this.cache = data;
                return;
            }
        }
        let remainingData;
        if (!this.msg) {
            if (data.length < 4) {
                // TODO: doesn't buffer partial headers smaller than 4 bytes —
                // fine under normal TCP conditions, worth hardening later.
                console.log('Need to cache not enough data');
                return;
            }
            let system = data.readUInt8(0);
            let msgId = data.readUInt8(1);
            let length = data.readUInt16BE(2);
      if (![1,4].includes(system) || length > (system === 1 ? 200 : 16384)) { this.socket.destroy(); return; }
            this.msg = new shared_1.Message(system, msgId, length);
            remainingData = this.msg.append(data.slice(4));
        }
        else {
            remainingData = this.msg.append(data);
        }
        if (this.msg.complete) {
            this.emit('message', this.msg);
            this.msg = null;
        }
        if (!this.socket.destroyed && remainingData.length > 0) {
            this.onData(remainingData);
        }
    }
    onEnd() {
        console.log('end');
        this.emit('disconnect', this);
    }
    onError(err, address, family, host) {
        console.log(err);
    }
}
exports.SocketClient = SocketClient;
//# sourceMappingURL=client.js.map
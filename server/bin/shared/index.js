"use strict";
/**
 * Local copy of the real @odyssey/shared package source
 * (from OdysseyOnlineClassic/odyssey-2-shared, lib/message.ts +
 * lib/enums.ts + lib/index.ts), since that package was never
 * published anywhere npm install can reach. Imported via a relative
 * path everywhere instead of as an npm dependency. If it's ever
 * published for real, swap these imports back to '@odyssey/shared'
 * and delete this file.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.Message = exports.Enums = void 0;
var Enums;
(function (Enums) {
    let Systems;
    (function (Systems) {
        Systems[Systems["Admin"] = 0] = "Admin";
        Systems[Systems["Account"] = 1] = "Account";
        Systems[Systems["Chat"] = 2] = "Chat";
        Systems[Systems["Guild"] = 3] = "Guild";
        Systems[Systems["World"] = 4] = "World";
    })(Systems = Enums.Systems || (Enums.Systems = {}));
})(Enums || (exports.Enums = Enums = {}));
/**
 * A single incoming/outgoing protocol message.
 *
 * Wire shape, per odyssey-2-shared/docs/network.md:
 *   [0]     UInt8   system  (Enums.Systems)
 *   [1]     UInt8   id      (message id within that system)
 *   [2..3]  UInt16BE length (payload length)
 *   [4..]   payload bytes
 */
class Message {
    constructor(system, id, length) {
        this.system = system;
        this.id = id;
        this.length = length;
        this.bytesRead = 0;
        this.data = Buffer.allocUnsafe(length);
        this.timestamp = Date.now();
    }
    /**
     * Appends data to a message
     *
     * @param appendData
     * @return {Buffer} Bytes remaining after appending
     */
    append(appendData) {
        let bytesToAppend = this.length - this.bytesRead;
        this.bytesRead += appendData.copy(this.data, this.bytesRead, 0, bytesToAppend);
        return appendData.slice(bytesToAppend);
    }
    get complete() {
        return this.bytesRead === this.length;
    }
}
exports.Message = Message;
//# sourceMappingURL=index.js.map
/**
 * Local copy of the real @odyssey/shared package source
 * (from OdysseyOnlineClassic/odyssey-2-shared, lib/message.ts +
 * lib/enums.ts + lib/index.ts), since that package was never
 * published anywhere npm install can reach. Imported via a relative
 * path everywhere instead of as an npm dependency. If it's ever
 * published for real, swap these imports back to '@odyssey/shared'
 * and delete this file.
 */

export namespace Enums {
  export enum Systems {
    Admin = 0,
    Account,
    Chat,
    Guild,
    World
  }
}

/**
 * A single incoming/outgoing protocol message.
 *
 * Wire shape, per odyssey-2-shared/docs/network.md:
 *   [0]     UInt8   system  (Enums.Systems)
 *   [1]     UInt8   id      (message id within that system)
 *   [2..3]  UInt16BE length (payload length)
 *   [4..]   payload bytes
 */
export class Message {
  data: Buffer;
  timestamp: number;

  private bytesRead = 0;

  constructor(public system: Enums.Systems, public id: number, public length: number) {
    this.data = Buffer.allocUnsafe(length);
    this.timestamp = Date.now();
  }

  /**
   * Appends data to a message
   *
   * @param appendData
   * @return {Buffer} Bytes remaining after appending
   */
  append(appendData: Buffer) {
    let bytesToAppend = this.length - this.bytesRead;

    this.bytesRead += appendData.copy(this.data, this.bytesRead, 0, bytesToAppend);

    return appendData.slice(bytesToAppend);
  }

  get complete(): boolean {
    return this.bytesRead === this.length;
  }
}


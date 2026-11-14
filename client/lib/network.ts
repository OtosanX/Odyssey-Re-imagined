import * as net from 'net';
import { EventEmitter } from 'events';
import { Message, Enums } from './shared';

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
export class Network extends EventEmitter {
  protected socket: net.Socket;
  private cache: Buffer = Buffer.allocUnsafe(0);
  private msg: Message;

  constructor(readonly host: string, readonly port: number) {
    super();
    this.socket = new net.Socket();
    this.socket.on('data', (chunk: Buffer) => { this.onData(chunk); });
    this.socket.on('error', err => this.emit('status', err.message));
    this.socket.on('close', () => this.emit('status', 'Disconnected. Restart the client to reconnect.'));
  }

  public async connect() {
    return new Promise<void>((resolve, reject) => {
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
  public sendMessage(message: Message) {
    this.send(message.system, message.id, message.data);
  }

  /**
   * Sends a message to the server
   *
   * @param system
   * @param id
   * @param data
   */
  public send(system: Enums.Systems, id: number, data: Buffer) {
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
  protected onData(data: Buffer) {
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
        this.msg = new Message(system, id, length);
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

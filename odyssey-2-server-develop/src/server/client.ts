import * as net from 'net';
import * as events from 'events';
import { Enums } from '../shared';
import { Message } from '../shared';
import { Account } from '../game/systems/accounts/account-data';
import { CharacterDocument } from '../game/data/characters';
import { EventEmitter } from 'events';

/**
 * Base client class
 */
export abstract class Client extends EventEmitter {
  public account: Account;
  public character: CharacterDocument;
  public index: number;
  public playing: boolean = false;
  public abstract readonly address: string;

  public abstract sendMessage(msg: Message);
  public abstract send(system: Enums.Systems, id: number, data: Buffer);
}

/**
 * Clients that communicate over traditional TCP Sockets
 */
export class SocketClient extends Client {
  protected msg: Message;
  private cache: Buffer = Buffer.alloc(0);

  constructor(protected socket: net.Socket) {
    super();
    socket.on('data', this.onData.bind(this));
    socket.on('close', this.onEnd.bind(this));
    socket.on('error', this.onError.bind(this));
  }

  get address(): string {
    // socket.address() describes the LOCAL end of the connection and can
    // be `{}` if the socket isn't connected yet in newer @types/node.
    // remoteAddress is what we actually want here: the connecting client's IP.
    return this.socket.remoteAddress || '';
  }

  public sendMessage(msg: Message) {
    return this.send(msg.system, msg.id, msg.data);
  }

  public send(system, id, data) {
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

  protected onData(data: Buffer) {
    if (!this.msg) {
      data = Buffer.concat([this.cache, data]);
      this.cache = Buffer.alloc(0);
      if (data.length < 4) { this.cache = data; return; }
    }
    let remainingData: Buffer;

    if (!this.msg) {
      if (data.length < 4) {
        // TODO: doesn't buffer partial headers smaller than 4 bytes —
        // fine under normal TCP conditions, worth hardening later.
        console.log('Need to cache not enough data');
        return;
      }

      let system: Enums.Systems = data.readUInt8(0);
      let msgId = data.readUInt8(1);
      let length = data.readUInt16BE(2);
      this.msg = new Message(system, msgId, length);
      remainingData = this.msg.append(data.slice(4));
    }
    else {
      remainingData = this.msg.append(data);
    }

    if (this.msg.complete) {
      this.emit('message', this.msg);
      this.msg = null;
    }

    if (remainingData.length > 0) {
      this.onData(remainingData);
    }
  }

  protected onEnd() {
    console.log('end');
    this.emit('disconnect', this);
  }

  protected onError(err, address, family, host) {
    console.log(err);
  }
}


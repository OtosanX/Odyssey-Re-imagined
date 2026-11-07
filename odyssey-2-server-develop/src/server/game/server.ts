import * as net from 'net';
import { SocketClient } from '../client';
import { GameState } from '../../game/game-state';

/**
 * Plain TCP server speaking the documented odyssey-2 protocol
 * (see odyssey-2-shared/docs/network.md). Replaces the former
 * ClassicServer/ClassicClient, which targeted VB6 client
 * compatibility — a goal this project has dropped in favor of a
 * modern client speaking this same protocol directly.
 */
export class GameServer {
  private server: net.Server;

  constructor(private gameState: GameState) {
    this.server = net.createServer((socket: net.Socket) => { this.onConnection(socket) });
    this.start();
  }

  start() {
    console.log(`Listening on ${this.gameState.config.server.port}`);
    this.server.on('error', error => { console.error(error); process.exit(1); });
    this.server.listen(this.gameState.config.server.port, this.gameState.config.server.host || '0.0.0.0', () => {
      const address = this.server.address() as net.AddressInfo;
      if (process.send) process.send({type: 'ready', port: address.port, host: address.address});
    });
  }

  protected onConnection(socket: net.Socket) {
    console.log(`Connection from ${socket.remoteAddress}:${socket.remotePort}`);
    let client = new SocketClient(socket);
    this.gameState.clients.registerClient(client);
  }
}

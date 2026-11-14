import { Network } from './network';
import { Enums } from './shared';

export enum States {
  Disconnected,
  Connected,
  Authenticated,
  Playing
}

export class GameState {
  protected state: States = States.Disconnected;
  protected network: Network;

  constructor() {

  }

  async connect(host, port) {
    this.network = new Network(host, port);
    await this.network.connect();
    this.state = States.Connected;
  }

  login(username, password) {
    let data = Buffer.from(username, 'utf8');
    data = Buffer.concat([data, Buffer.from([0])]);
    data = Buffer.concat([data, Buffer.from(password, 'utf8')]);
    this.network.send(Enums.Systems.Account, 1, data);
  }
}

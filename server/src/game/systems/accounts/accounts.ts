import { Client } from "../../../server/client";
import { Message } from "../../../shared";
import { Enums } from "../../../shared";
import { System } from "../system";
import { AccountData } from './account-data';
import * as path from 'path';
import * as bcrypt from 'bcryptjs';

enum messages {
  create = 0,
  login = 1,
  logout = 2
}

const success = Buffer.from([0]);

export class Accounts extends System {
  protected data = new AccountData(this.game.config.server.dataFolder + path.sep + this.game.config.game.accounts.file);

  public process(msg: Message, client: Client) {
    switch (msg.id) {
      case messages.create:
        this.createAccount(msg, client);
        break;
      case messages.login:
        this.login(msg, client);
        break;
      case messages.logout:
        this.game.world.leave(client);
        this.logout(msg, client);
        break;
      case 3:
        this.availability(msg, client);
        break;
    }
  }

  protected async createAccount(msg: Message, client: Client) {
    const [username, password] = this.splitLogin(msg.data);
    if (!this.valid(username, password) || !/^[a-zA-Z0-9_]{6,24}$/.test(password)) return client.send(1, 0, Buffer.from([4]));
    const salt = await bcrypt.genSalt();
    let hashed = await bcrypt.hash(password, salt);

    try {
      await this.data.createAccount(username, hashed);
    } catch (ex) {
      console.error('createAccount failed:', ex);
      return client.send(Enums.Systems.Account, messages.create, Buffer.from([ex.errorType === 'uniqueViolated' ? 3 : 255]));
    }

    return client.send(Enums.Systems.Account, messages.create, success);
  }

  protected async login(msg: Message, client: Client) {
    if (client.account) {
      client.send(Enums.Systems.Account, messages.login, Buffer.from([2]));
      //TODO Client already logged in, log an error or hack attempt?
      return;
    }

    const [username, password] = this.splitLogin(msg.data);
    if (!this.valid(username, password)) return client.send(1, 1, Buffer.from([1]));
    console.log(`Login attempt: ${username}`);

    let account;

    try {
      account = await this.data.getAccount(username);
    } catch (ex) {
      console.error('login lookup failed:', ex);
      return client.send(Enums.Systems.Account, messages.login, Buffer.from([255]))
    }

    //Failed login
    if (!(account && await bcrypt.compare(password, account.password))) {
      client.send(Enums.Systems.Account, messages.login, Buffer.from([1]))
      return;
    }

    //Successful Login
    if (this.game.clients.clients.some(c => c && c !== client && c.account && c.account.username === username)) {
      return client.send(1, 1, Buffer.from([2]));
    }
    client.account = account;
    client.send(Enums.Systems.Account, messages.login, success);
    //TODO Handle characters
  }

  protected async logout(msg: Message, client: Client) {
    client.account = null;
    client.send(Enums.Systems.Account, 2, success)
  }

  protected splitLogin(data: Buffer) {
    return data.toString('utf-8').split('\0');
  }
  private async availability(msg: Message, client: Client) {
    const username = msg.data.toString('utf8');
    if (!/^[a-zA-Z0-9_]{3,24}$/.test(username)) return client.send(1, 3, Buffer.concat([Buffer.from([4]), msg.data.slice(0,24)]));
    try {
      const account = await this.data.getAccount(username);
      client.send(1, 3, Buffer.concat([Buffer.from([account ? 1 : 0]), Buffer.from(username)]));
    } catch {
      client.send(1, 3, Buffer.concat([Buffer.from([255]), Buffer.from(username)]));
    }
  }
  private valid(username: string, password: string) {
    return typeof username === 'string' && /^[a-zA-Z0-9_]{3,24}$/.test(username) &&
      typeof password === 'string' && password.length >= 6 && Buffer.byteLength(password) <= 72;
  }
}

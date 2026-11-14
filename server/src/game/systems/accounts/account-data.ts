import * as fs from 'fs';
import * as path from 'path';
import NeDB = require('nedb-core');
import * as Data from '../../data/game-data';

export class AccountData {
  protected data: NeDB;

  constructor(dataFile: string) {
    dataFile = dataFile || 'accounts.data';

    // NeDB will create the data FILE if it's missing, but not missing
    // parent directories — writes silently fail with ENOENT if the
    // folder (e.g. `data/`) doesn't exist yet.
    const dir = path.dirname(dataFile);
    if (dir && !fs.existsSync(dir)) {
      fs.mkdirSync(dir, { recursive: true });
    }

    let options: NeDB.DataStoreOptions = {
      filename: dataFile,
      autoload: true
    }
    this.data = new NeDB(options);

    // username is required and cannot be null
    this.data.ensureIndex({
      fieldName: 'username',
      unique: true,
      sparse: false
    });
  }

  public async createAccount(username: string, password: string, email?: string): Promise<Account> {
    // `password` arrives already hashed (see Accounts.createAccount in
    // ../accounts.ts, which calls bcrypt.hash before calling this) —
    // this used to hash it AGAIN here, storing a hash-of-a-hash that
    // could never match a plaintext comparison at login time. This
    // layer just stores what it's given now.
    return new Promise<Account>((resolve, reject) => {
      this.data.insert({
        username: username,
        password: password,
        access: 0,
        email: email
      }, (err, account: any) => {
        if (err) {
          reject(err);
          return;
        }

        resolve(Data.applyProxy(new ConcreteAccount(this.data, account._id, account.username, account.password, account.access, account.email)));
      });
    });
  }

  public async getAccount(username: string): Promise<Account> {
    return new Promise<Account>((resolve, reject) => {
      this.data.findOne({ username: username }, (err, account) => {
        if (err) {
          reject(err);
          return;
        }

        resolve(Data.applyProxy(account));
      });
    });
  }
}

export class Account {
  username: string;
  password: string;
  access: number;
  email?: string;

  protected constructor(data: Nedb, readonly _id, username, password, access, email?) {

  }
}

class ConcreteAccount extends Account {
  constructor(data: Nedb, readonly _id, username, password, access, email?) {
    super(data, _id, username, password, access, email);
  }
}

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
exports.Account = exports.AccountData = void 0;
const fs = __importStar(require("fs"));
const path = __importStar(require("path"));
const NeDB = require("nedb-core");
const Data = __importStar(require("../../data/game-data"));
class AccountData {
    constructor(dataFile) {
        dataFile = dataFile || 'accounts.data';
        // NeDB will create the data FILE if it's missing, but not missing
        // parent directories — writes silently fail with ENOENT if the
        // folder (e.g. `data/`) doesn't exist yet.
        const dir = path.dirname(dataFile);
        if (dir && !fs.existsSync(dir)) {
            fs.mkdirSync(dir, { recursive: true });
        }
        let options = {
            filename: dataFile,
            autoload: true
        };
        this.data = new NeDB(options);
        // username is required and cannot be null
        this.data.ensureIndex({
            fieldName: 'username',
            unique: true,
            sparse: false
        });
    }
    async createAccount(username, password, email) {
        // `password` arrives already hashed (see Accounts.createAccount in
        // ../accounts.ts, which calls bcrypt.hash before calling this) —
        // this used to hash it AGAIN here, storing a hash-of-a-hash that
        // could never match a plaintext comparison at login time. This
        // layer just stores what it's given now.
        return new Promise((resolve, reject) => {
            this.data.insert({
                username: username,
                password: password,
                access: 0,
                email: email
            }, (err, account) => {
                if (err) {
                    reject(err);
                    return;
                }
                resolve(Data.applyProxy(new ConcreteAccount(this.data, account._id, account.username, account.password, account.access, account.email)));
            });
        });
    }
    async getAccount(username) {
        return new Promise((resolve, reject) => {
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
exports.AccountData = AccountData;
class Account {
    constructor(data, _id, username, password, access, email) {
        this._id = _id;
    }
}
exports.Account = Account;
class ConcreteAccount extends Account {
    constructor(data, _id, username, password, access, email) {
        super(data, _id, username, password, access, email);
        this._id = _id;
    }
}
//# sourceMappingURL=account-data.js.map
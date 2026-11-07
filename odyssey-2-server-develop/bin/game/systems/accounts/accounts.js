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
exports.Accounts = void 0;
const shared_1 = require("../../../shared");
const system_1 = require("../system");
const account_data_1 = require("./account-data");
const path = __importStar(require("path"));
const bcrypt = __importStar(require("bcryptjs"));
var messages;
(function (messages) {
    messages[messages["create"] = 0] = "create";
    messages[messages["login"] = 1] = "login";
    messages[messages["logout"] = 2] = "logout";
})(messages || (messages = {}));
const success = Buffer.from([0]);
class Accounts extends system_1.System {
    constructor() {
        super(...arguments);
        this.data = new account_data_1.AccountData(this.game.config.server.dataFolder + path.sep + this.game.config.game.accounts.file);
    }
    process(msg, client) {
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
    async createAccount(msg, client) {
        const [username, password] = this.splitLogin(msg.data);
        if (!this.valid(username, password) || !/^[a-zA-Z0-9_]{6,24}$/.test(password))
            return client.send(1, 0, Buffer.from([4]));
        const salt = await bcrypt.genSalt();
        let hashed = await bcrypt.hash(password, salt);
        try {
            await this.data.createAccount(username, hashed);
        }
        catch (ex) {
            console.error('createAccount failed:', ex);
            return client.send(shared_1.Enums.Systems.Account, messages.create, Buffer.from([ex.errorType === 'uniqueViolated' ? 3 : 255]));
        }
        return client.send(shared_1.Enums.Systems.Account, messages.create, success);
    }
    async login(msg, client) {
        if (client.account) {
            client.send(shared_1.Enums.Systems.Account, messages.login, Buffer.from([2]));
            //TODO Client already logged in, log an error or hack attempt?
            return;
        }
        const [username, password] = this.splitLogin(msg.data);
        if (!this.valid(username, password))
            return client.send(1, 1, Buffer.from([1]));
        console.log(`Login attempt: ${username}`);
        let account;
        try {
            account = await this.data.getAccount(username);
        }
        catch (ex) {
            console.error('login lookup failed:', ex);
            return client.send(shared_1.Enums.Systems.Account, messages.login, Buffer.from([255]));
        }
        //Failed login
        if (!(account && await bcrypt.compare(password, account.password))) {
            client.send(shared_1.Enums.Systems.Account, messages.login, Buffer.from([1]));
            return;
        }
        //Successful Login
        if (this.game.clients.clients.some(c => c && c !== client && c.account && c.account.username === username)) {
            return client.send(1, 1, Buffer.from([2]));
        }
        client.account = account;
        client.send(shared_1.Enums.Systems.Account, messages.login, success);
        //TODO Handle characters
    }
    async logout(msg, client) {
        client.account = null;
        client.send(shared_1.Enums.Systems.Account, 2, success);
    }
    splitLogin(data) {
        return data.toString('utf-8').split('\0');
    }
    async availability(msg, client) {
        const username = msg.data.toString('utf8');
        if (!/^[a-zA-Z0-9_]{3,24}$/.test(username))
            return client.send(1, 3, Buffer.concat([Buffer.from([4]), msg.data.slice(0, 24)]));
        try {
            const account = await this.data.getAccount(username);
            client.send(1, 3, Buffer.concat([Buffer.from([account ? 1 : 0]), Buffer.from(username)]));
        }
        catch {
            client.send(1, 3, Buffer.concat([Buffer.from([255]), Buffer.from(username)]));
        }
    }
    valid(username, password) {
        return typeof username === 'string' && /^[a-zA-Z0-9_]{3,24}$/.test(username) &&
            typeof password === 'string' && password.length >= 6 && Buffer.byteLength(password) <= 72;
    }
}
exports.Accounts = Accounts;
//# sourceMappingURL=accounts.js.map
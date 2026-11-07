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
exports.Character = exports.CharacterData = void 0;
const NeDB = require("nedb-core");
const Data = __importStar(require("../../data/game-data"));
class CharacterData {
    constructor(dataFile) {
        dataFile = dataFile || 'accounts.data';
        let options = {
            filename: dataFile,
            autoload: true
        };
        this.data = new NeDB(options);
        // username is required and cannot be null
        this.data.ensureIndex({
            fieldName: 'accountId',
            unique: true,
            sparse: false
        });
    }
    async getCharacter(accountId) {
        return new Promise((resolve, reject) => {
            this.data.findOne({ accountId: accountId }, (err, character) => {
                if (err) {
                    reject(err);
                    return;
                }
                resolve(Data.applyProxy(new ConcreteCharacter(this.data, character._id, character)));
            });
        });
    }
}
exports.CharacterData = CharacterData;
class Character {
    constructor(data, _id, character) {
        this.data = data;
        this._id = _id;
        this.alive = character.alive;
        this.ammo = character.ammo;
        this.bank = character.bank;
        this.class = character.class;
        this.description = character.description;
        this.equipped = character.equipped;
        this.female = character.female;
        this.guild = character.guild;
        this.inventory = character.inventory;
        this.location = character.location;
        this.name = character.name;
        this.sprite = character.sprite;
        this.status = character.status;
        this.stats = character.stats;
    }
}
exports.Character = Character;
class ConcreteCharacter extends Character {
    constructor(data, _id, character) {
        super(data, _id, character);
        //TODO Do we add proxies for object properties here?
    }
}
//# sourceMappingURL=character-data.js.map
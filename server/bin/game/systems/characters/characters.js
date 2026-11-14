"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Characters = void 0;
const system_1 = require("../system");
class Characters extends system_1.System {
    process(msg, client) {
    }
    serializeCharacter(character) {
        let length = 15 + character.name.length + character.description.length;
        let data = Buffer.allocUnsafe(length);
        data.writeUInt8(character.class, 0);
        data.writeUInt8(character.female ? 0 : 1, 1);
        data.writeUInt16BE(character.sprite, 2);
        data.writeUInt8(character.stats.level, 4);
        data.writeUInt8(character.status, 5);
        data.writeUInt8(character.guild.id, 6);
        data.writeUInt8(character.guild.rank, 7);
        data.writeUInt32BE(character.stats.experience, 8);
        // TODO Stats: MaxHP, MaxEnergy, MaxMana, Attack, Defense, MagicDefense, etc.
        data.write(character.name, 12);
        data.writeUInt8(0, character.name.length + 12);
        data.write(character.description, character.name.length + 13);
        return data;
    }
    getCharacter(accountId) {
    }
}
exports.Characters = Characters;
//# sourceMappingURL=characters.js.map
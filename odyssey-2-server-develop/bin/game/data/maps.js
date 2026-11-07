"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Direction = exports.AttributeType = exports.MapDataManager = void 0;
const game_data_1 = require("./game-data");
class MapDataManager extends game_data_1.GameDataManager {
    //TODO need to build a blank map when we request a map that doesn't exist.
    /**
     * Provides a normalized (x,y) way to get tiles.
     * Currently due to legacy code, map tiles are organized y,x.
     * This method abstracts that away, so if it changes calls to this method will still be valid.
     *
     * @static
     * @param {MapDocument} map
     * @param {number} x
     * @param {number} y
     * @returns
     * @memberof MapDataManager
     */
    static getTile(map, x, y) {
        if (!map.tiles[y] || !map.tiles[y][x]) {
            return null;
        }
        return map.tiles[y][x];
    }
}
exports.MapDataManager = MapDataManager;
var AttributeType;
(function (AttributeType) {
    AttributeType[AttributeType["Wall"] = 1] = "Wall";
    AttributeType[AttributeType["Warp"] = 2] = "Warp";
    AttributeType[AttributeType["Key"] = 3] = "Key";
    AttributeType[AttributeType["Door"] = 4] = "Door";
    AttributeType[AttributeType["Keep"] = 5] = "Keep";
    AttributeType[AttributeType["NoAttack"] = 6] = "NoAttack";
    AttributeType[AttributeType["ObjectSpawn"] = 7] = "ObjectSpawn";
    AttributeType[AttributeType["TouchPlate"] = 8] = "TouchPlate";
    AttributeType[AttributeType["Damage"] = 9] = "Damage";
    AttributeType[AttributeType["NoMonster"] = 10] = "NoMonster";
    AttributeType[AttributeType["Script"] = 11] = "Script";
    AttributeType[AttributeType["Click"] = 12] = "Click";
    AttributeType[AttributeType["Fish"] = 13] = "Fish";
    AttributeType[AttributeType["Ore"] = 14] = "Ore";
    AttributeType[AttributeType["ProjectileWall"] = 15] = "ProjectileWall";
    AttributeType[AttributeType["Tree"] = 16] = "Tree";
    AttributeType[AttributeType["DirectionalWall"] = 17] = "DirectionalWall";
    AttributeType[AttributeType["S"] = 18] = "S";
    AttributeType[AttributeType["Light"] = 19] = "Light";
    AttributeType[AttributeType["LightDampening"] = 20] = "LightDampening";
    AttributeType[AttributeType["O1"] = 21] = "O1";
    AttributeType[AttributeType["O2"] = 22] = "O2";
})(AttributeType || (exports.AttributeType = AttributeType = {}));
var Direction;
(function (Direction) {
    Direction[Direction["up"] = 0] = "up";
    Direction[Direction["down"] = 1] = "down";
    Direction[Direction["left"] = 2] = "left";
    Direction[Direction["right"] = 3] = "right";
})(Direction || (exports.Direction = Direction = {}));
//# sourceMappingURL=maps.js.map
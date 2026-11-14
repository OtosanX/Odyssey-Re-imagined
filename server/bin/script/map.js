"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Map = void 0;
/**
 * Provides an object for scripts to interact with Maps
 *
 * @export
 * @class Map
 */
class Map {
    constructor(gameState, map) {
        this.gameState = gameState;
        this.map = map;
    }
    get name() {
        return this.map.name;
    }
    get playerCount() {
        //TODO
        return null;
    }
    get friendly() {
        //TODO
        return null;
    }
}
exports.Map = Map;
//# sourceMappingURL=map.js.map
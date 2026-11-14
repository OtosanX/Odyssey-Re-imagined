"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.GameState = exports.States = void 0;
const network_1 = require("./network");
const shared_1 = require("./shared");
var States;
(function (States) {
    States[States["Disconnected"] = 0] = "Disconnected";
    States[States["Connected"] = 1] = "Connected";
    States[States["Authenticated"] = 2] = "Authenticated";
    States[States["Playing"] = 3] = "Playing";
})(States || (exports.States = States = {}));
class GameState {
    constructor() {
        this.state = States.Disconnected;
    }
    async connect(host, port) {
        this.network = new network_1.Network(host, port);
        await this.network.connect();
        this.state = States.Connected;
    }
    login(username, password) {
        let data = Buffer.from(username, 'utf8');
        data = Buffer.concat([data, Buffer.from([0])]);
        data = Buffer.concat([data, Buffer.from(password, 'utf8')]);
        this.network.send(shared_1.Enums.Systems.Account, 1, data);
    }
}
exports.GameState = GameState;
//# sourceMappingURL=game-state.js.map
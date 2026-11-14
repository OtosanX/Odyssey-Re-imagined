"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ClientManager = exports.ClientType = void 0;
var ClientType;
(function (ClientType) {
    ClientType[ClientType["Classic"] = 0] = "Classic";
    ClientType[ClientType["WebAdmin"] = 1] = "WebAdmin";
})(ClientType || (exports.ClientType = ClientType = {}));
class ClientManager {
    constructor(game) {
        this.game = game;
        this.min = 1;
        this.clients = new Array(game.options.max.players + 1);
    }
    /**
     * Handles client disconnection
     *
     * @param client
     */
    disconnect(client) {
        this.game.world.leave(client);
        if (this.clients[client.index] !== client) {
            // TODO Error State! Client should not have different index
            let flag = false;
            this.clients.forEach((value, index) => {
                if (value === client) {
                    this.clients[index] = null;
                    flag = true;
                }
            });
            if (!flag) {
                // TODO Error State! Client was not in list of clients
            }
        }
        else {
            this.clients[client.index] = null;
        }
    }
    /**
     * Gets a list of all clients on the map.
     * Index in result is not their global index
     *
     * @param {number} mapIndex
     * @returns {Client[]}
     *
     * @memberOf ClientManager
     */
    getClientsByMap(mapIndex) {
        let mapClients = [];
        for (let i = this.min; i < this.clients.length; i++) {
            if (this.clients[i] && this.clients[i].character && this.clients[i].character.location.map == mapIndex) {
                mapClients.push(this.clients[i]);
            }
        }
        return mapClients;
    }
    /**
     * Registers the client with the game
     *
     * @param client
     */
    registerClient(client) {
        let index = this.getAvailablePlayerIndex();
        if (index === null) {
            client.send(0, 255, Buffer.from('Server full'));
            return null;
        }
        client.on('message', (message) => { this.game.processMessage(message, client); });
        client.on('disconnect', (client) => { this.disconnect(client); });
        client.index = index;
        this.clients[index] = client;
        return index;
    }
    /**
     * Sends a message to all players
     *
     * @param {number} id
     * @param {Buffer} data
     * @param {number} [ignoreIndex] Index of the client to not send to
     *
     * @memberOf ClientManager
     */
    sendMessageAll(msg, ignoreIndex) {
        for (let i = this.min; i < this.clients.length; i++) {
            if (i != ignoreIndex && this.clients[i] && this.clients[i].playing) {
                this.clients[i].sendMessage(msg);
            }
        }
    }
    /**
     * Sends a message to all players on a map
     *
     * @param {number} id
     * @param {Buffer} data
     * @param {number} mapIndex
     * @param {number} [ignoreIndex]
     *
     * @memberOf ClientManager
     */
    sendMessageMap(msg, mapIndex, ignoreIndex) {
        let clients = this.getClientsByMap(mapIndex);
        for (let i = 0; i < clients.length; i++) {
            if (clients[i].index != ignoreIndex) {
                clients[i].sendMessage(msg);
            }
        }
    }
    clientDisconnect(client) {
        this.clients[client.index] = null;
    }
    getAvailablePlayerIndex() {
        for (let i = this.min; i < this.clients.length; i++) {
            if (!this.clients[i]) {
                return i;
            }
        }
        return null;
    }
}
exports.ClientManager = ClientManager;
//# sourceMappingURL=client-manager.js.map
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Player = void 0;
/**
 * Provides an object for scripts to interact with the players
 *
 * @export
 * @class Player
 */
class Player {
    constructor(gameState, client) {
        this.gameState = gameState;
        this.client = client;
        this.account = client.account;
        this.character = client.character;
        this.players = gameState.managers.player;
    }
    get access() {
        return this.account.access;
    }
    set access(access) {
        this.account.access = access;
    }
    get ammo() {
        return this.character.ammo;
    }
    set ammo(ammo) {
        this.character.ammo = ammo;
    }
    get class() {
        return this.character.class;
    }
    set class(playerClass) {
        this.character.class = playerClass;
    }
    get description() {
        return this.character.description;
    }
    set description(description) {
        this.character.description = description;
    }
    get female() {
        return this.character.female;
    }
    set female(isFemale) {
        this.character.female = isFemale;
    }
    get guild() {
        return this.character.guild;
    }
    get location() {
        return this.character.location;
    }
    set location(location) {
        this.gameState.managers.player.warp(this.client, location);
    }
    get name() {
        return this.character.name;
    }
    set name(name) {
        this.character.name = name;
        this.players.updateName(this.client);
    }
    get sprite() {
        return this.character.sprite;
    }
    set sprite(sprite) {
        this.character.sprite = sprite;
    }
    get stats() {
        return this.character.stats;
    }
    get status() {
        return this.character.status;
    }
    set status(status) {
        this.character.status = status;
    }
    get timers() {
        return this.character.timers;
    }
}
exports.Player = Player;
//# sourceMappingURL=player.js.map
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.GameState = void 0;
const client_manager_1 = require("../server/client-manager");
const shared_1 = require("../shared");
const script_1 = require("../script/script");
const accounts_1 = require("./systems/accounts/accounts");
const world_1 = require("./world");
class GameState {
    constructor(config) {
        this.config = config;
        this.accounts = new accounts_1.Accounts(this);
        this.updateInProgress = false;
        this.counter = 0;
        this.scripts = new script_1.ScriptManager(this);
        this.options = {
            max: {
                attributes: 22,
                classes: 4,
                floatText: 20,
                guilds: 255,
                halls: 255,
                inventoryObjects: 20,
                magic: 500,
                mapMonsters: 20,
                mapObjects: 79,
                maps: 3000,
                modifications: 255, //prefix,suffix?
                monsters: 1000,
                npcs: 500,
                objects: 1000,
                players: 80,
                projectiles: 20,
                requestLength: 200,
                skill: 10,
                sprite: 643,
                users: 80
            },
            stats: {
                strength: 1,
                endurance: 1,
                intelligence: 1,
                concentration: 1,
                constitution: 1,
                stamina: 1,
                wisdom: 1,
            },
            moneyObject: 1,
            costs: {
                durability: 1,
                strength: 1,
                modifier: 1
            },
            guilds: {
                createLevel: 1,
                createdPrice: 1,
                joinLevel: 1,
                joinPrice: 1,
            }
        };
        this.world = new world_1.World(config.server.dataFolder);
        this.clients = new client_manager_1.ClientManager(this);
        let interval = config.server.interval || 100;
        this.start(interval);
        this.firstTick = process.hrtime();
    }
    /**
     * Get current timer in ms
     */
    get tick() {
        let tick = process.hrtime(this.firstTick);
        return (tick[0] * 1e9 + tick[1]) / 1000000;
    }
    processMessage(msg, client) {
        if (!require('../../../tools/game-ingress.cjs').allow(this, msg, client)) return;
        if (require('../../../tools/server-directory.cjs').gate(this, msg, client)) return;
        if (!require('../../../tools/story-host-policy.cjs').allow(this, msg, client)) return;
        console.log(`Message ${msg.id} [${msg.data.length}] - ` + (client.account ? client.account.username : client.address));
        console.log(`Playing: ${client.playing}`);
        switch (msg.system) {
            case 4:
                this.world.process(msg, client);
                break;
            case shared_1.Enums.Systems.Account:
                this.accounts.process(msg, client);
                break;
            default:
                console.error(`Unknown Message System [${msg.system}]`);
                break;
        }
    }
    start(interval = 10) {
        this.performance = {
            updateAverage: 0.0,
            latestUpdate: 0.0,
            diff: [0, 0]
        };
        this.intervalId = setInterval(this.update.bind(this), interval);
    }
    stop() {
        clearInterval(this.intervalId);
    }
    update() {
        if (this.updateInProgress) {
            return;
        }
        this.updateInProgress = true;
        this.timestamp = process.hrtime();
        try {
            this.world.tick();
        }
        catch (error) {
            console.error('World update failed:', error);
        }
        this.performance.diff = process.hrtime(this.timestamp);
        this.performance.updateAverage -= this.performance.updateAverage / 100;
        this.performance.latestUpdate = (this.performance.diff[0] * 1e9 + this.performance.diff[1]);
        this.performance.updateAverage += this.performance.latestUpdate / 1000000 / 100;
        this.updateInProgress = false;
    }
}
exports.GameState = GameState;
//# sourceMappingURL=game-state.js.map
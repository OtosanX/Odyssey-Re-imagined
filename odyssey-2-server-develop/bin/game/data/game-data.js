"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DataDocument = exports.GameDataManager = void 0;
exports.setter = setter;
exports.data = data;
exports.applyProxy = applyProxy;
const NeDB = require("nedb-core");
class GameDataManager {
    constructor(dataFile) {
        let options = {
            filename: dataFile,
            autoload: true
        };
        this.data = new NeDB(options);
        this.data.ensureIndex({
            fieldName: 'index',
            unique: true,
            sparse: false
        });
    }
    get(index, cb) {
        this.data.findOne({ index: index }, cb);
    }
    getAll(cb) {
        this.data.find({}).sort({ index: -1 }).exec(cb);
    }
    update(doc, cb) {
        this.data.update({ index: doc.index }, doc, { upsert: true }, cb);
    }
}
exports.GameDataManager = GameDataManager;
/**
 * Abstract class for our DataDocuments
 *
 * @export
 * @class DataDocument
 */
class DataDocument {
}
exports.DataDocument = DataDocument;
function setter(target, property, value, receiver) {
    if (value instanceof Object) {
        //Object or array, need to establish a "sub-proxy"
        let p = new Proxy(value, { set: subSetter(target, property) });
        target[property] = p;
    }
    else {
        target[property] = value;
    }
    if (!(value instanceof Function)) {
        target.saveChange(property);
    }
    return true;
}
function subSetter(parent, key) {
    return (target, property, value, receiver) => {
        if (value instanceof Object) {
            let p = new Proxy(value, { set: subSetter(parent, key) });
            target[property] = p;
        }
        else {
            target[property] = value;
        }
        parent.saveChange(key);
        return true;
    };
}
function data(target) {
    target.prototype.saveChange = async function saveChange(key) {
        if (this[key] instanceof Function) {
            return;
        }
        let set = {};
        set[key] = this[key];
        this.data.update({ _id: this._id }, { $set: set }, {}, (err, numAffected) => {
            if (err) {
                //TODO handle error
            }
            if (numAffected != 1) {
                //TODO Handle error
            }
        });
    };
}
function applyProxy(obj, ignore = ['data']) {
    if (!obj) {
        return null;
    }
    Object.keys(obj).forEach((key) => {
        let ignored = (ignore.findIndex(value => value == key) > -1);
        if (obj[key] instanceof Object && !ignored) {
            let p = new Proxy(obj[key], { set: subSetter(obj, key) });
            obj[key] = p;
        }
    });
    return new Proxy(obj, { set: setter });
}
//# sourceMappingURL=game-data.js.map
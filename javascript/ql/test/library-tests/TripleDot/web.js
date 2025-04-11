function Websock() {
    "use strict";
    this._websocket = null;
    this._rQi = 0;
    this._rQlen = 0;
};

(function () {
    "use strict";
    var typedArrayToString = (function () {return function (a) { return String.fromCharCode.apply(null, a); };})();

    Websock.prototype = {
        rQshiftStr: function (len) {
            var arr = new Uint8Array(this._rQ.buffer, this._rQi, len);
            this._rQi += len;
            var str = typedArrayToString(arr);
            sink(str); // $ MISSING: hasTaintFlow=h1.2
            return str;
        },

        decode_message: function (data) {
            var u8 = new Uint8Array(data);
            this._rQ.set(u8, this._rQlen);
            this._rQlen += u8.length;
        },

        recv_message: function (e) {
            e = source("h1.2");
            this.decode_message(e.data);
        }
    };
})();



class Websock {
    constructor() {
        this._websocket = null;
        this._rQi = 0;
        this._rQlen = 0;
        this._rQbufferSize = 1024 * 1024 * 4;
        this._rQ = new Uint8Array(this._rQbufferSize);
    }

    static typedArrayToString(arr) { return String.fromCharCode.apply(null, arr);}

    rQshiftStr(len = this._rQlen) {
        const arr = new Uint8Array(this._rQ.buffer, this._rQi, len);
        this._rQi += len;
        let str = Websock.typedArrayToString(arr);
        sink(str); // $ hasTaintFlow=h1.1
        return str;
    }

    decode_message(data) {
        const u8 = new Uint8Array(data);
        this._rQ.set(u8, this._rQlen);
        this._rQlen += u8.length;
    }

    recv_message(e) {
        e = source("h1.1");
        this.decode_message(e.data);
    }
}

(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    function customEvent(eventType, detail) {
        if (detail === void 0) { detail = {}; }
        var event = new CustomEvent(eventType, { detail: detail });
        document.dispatchEvent(event);
    }
    exports.customEvent = customEvent;
});

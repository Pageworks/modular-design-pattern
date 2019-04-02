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
    function getParent(el, selector) {
        var parent = el;
        do {
            parent = parent.parentElement;
            if (parent.classList.contains(selector))
                return parent;
        } while (parent.parentElement !== null);
        return el;
    }
    exports.getParent = getParent;
});

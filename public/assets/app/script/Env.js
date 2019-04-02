(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports"], factory);
    }
})(function (require, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    var Env = (function () {
        function Env() {
            if (window.location.hostname.match(/.local/gi)) {
                Env.setDebug(true);
            }
            else if (document.documentElement.getAttribute('debug') !== null) {
                Env.setDebug(true);
            }
        }
        Env.setDebug = function (status) {
            Env.isDebug = status;
        };
        Env.PJAX_CONTAINER = '.js-pjax';
        Env.SCROLL_TRIGGER = 100;
        Env.APP_NAME = 'REPLACE_ME';
        Env.isDebug = false;
        Env.EASING = {
            ease: 'cubicBezier(0.4, 0.0, 0.2, 1)',
            in: 'cubicBezier(0.0, 0.0, 0.2, 1)',
            out: 'cubicBezier(0.4, 0.0, 1, 1)',
            sharp: 'cubicBezier(0.4, 0.0, 0.6, 1)'
        };
        return Env;
    }());
    exports.default = Env;
});
//# sourceMappingURL=Env.js.map

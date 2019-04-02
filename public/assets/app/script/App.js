(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./Env", "@codewithkyle/pjax", "@codewithkyle/device-manager"], factory);
    }
})(function (require, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    var Env_1 = require("./Env");
    var pjax_1 = require("@codewithkyle/pjax");
    var device_manager_1 = require("@codewithkyle/device-manager");
    var App = (function () {
        function App() {
            var _this = this;
            this.handlePageLoad = function () {
                _this.reinit();
            };
            this._deviceManager = null;
            this.init();
        }
        App.prototype.init = function () {
            new Env_1.default();
            new pjax_1.default({ debug: Env_1.default.isDebug });
            this._deviceManager = new device_manager_1.default(Env_1.default.isDebug, true);
            document.addEventListener('pjax:complete', this.handlePageLoad);
        };
        App.prototype.reinit = function () {
            if (this._deviceManager !== null) {
                this._deviceManager.reinit();
            }
        };
        return App;
    }());
    exports.default = App;
    (function () {
        new App();
    })();
});
//# sourceMappingURL=App.js.map

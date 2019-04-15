(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[1],[
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
var Env_1 = __webpack_require__(1);
var pjax_1 = __webpack_require__(2);
var device_manager_1 = __webpack_require__(15);
var ModuleManager_1 = __webpack_require__(16);
var App = (function () {
    function App() {
        var _this = this;
        this.invokeModuleManager = function () {
            ModuleManager_1.ModuleManager.wrangleModules();
        };
        this.handlePageLoad = function () {
            _this.reinit();
        };
        this._deviceManager = null;
        this.init();
    }
    App.prototype.init = function () {
        new Env_1.Env();
        new pjax_1.default({ debug: Env_1.Env.isDebug });
        this._deviceManager = new device_manager_1.default(Env_1.Env.isDebug, true);
        new ModuleManager_1.ModuleManager();
        document.addEventListener('pjax:complete', this.handlePageLoad);
        document.addEventListener('pjax:scriptContentLoaded', this.invokeModuleManager);
    };
    App.prototype.reinit = function () {
        if (this._deviceManager !== null) {
            this._deviceManager.reinit();
        }
    };
    return App;
}());
(function () {
    new App();
})();


/***/ })
],[[0,0,4,3,2]]]);
(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[2],{

/***/ 1:
/***/ (function(module, exports, __webpack_require__) {

"use strict";

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
    Env.isDebug = false;
    Env.EASING = {
        ease: 'cubicBezier(0.4, 0.0, 0.2, 1)',
        in: 'cubicBezier(0.0, 0.0, 0.2, 1)',
        out: 'cubicBezier(0.4, 0.0, 1, 1)',
        sharp: 'cubicBezier(0.4, 0.0, 0.6, 1)'
    };
    return Env;
}());
exports.Env = Env;


/***/ }),

/***/ 21:
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
var Env_1 = __webpack_require__(1);
var BaseModule = (function () {
    function BaseModule(el, uuid, manager) {
        this.el = el;
        this.uuid = uuid;
        this.manager = manager;
        this.isDebug = Env_1.Env.isDebug;
        this.el.dataset.uuid = this.uuid;
    }
    BaseModule.prototype.init = function () { };
    BaseModule.prototype.destroy = function (MODULE_NAME) {
        this.el.removeAttribute('data-uuid');
        if (this.isDebug) {
            console.log(MODULE_NAME + " has been removed");
        }
    };
    return BaseModule;
}());
exports.BaseModule = BaseModule;


/***/ })

}]);
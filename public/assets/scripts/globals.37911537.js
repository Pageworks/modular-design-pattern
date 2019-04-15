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

/***/ 16:
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
var uuid = __webpack_require__(17);
var Env_1 = __webpack_require__(1);
var ModuleManager = (function () {
    function ModuleManager() {
        ModuleManager.initModules();
    }
    ModuleManager.wrangleModules = function () {
        this.initModules();
        this.removeModules();
    };
    ModuleManager.getModuleNames = function (data) {
        var modules = data.trim().split(/\s+/gi);
        if (modules.length === 1 && modules[0] === '') {
            modules = [];
        }
        return modules;
    };
    ModuleManager.initModules = function () {
        var _this = this;
        console.log('Getting modules');
        var moduleEls = Array.from(document.body.querySelectorAll('[data-module]'));
        if (!moduleEls.length) {
            return;
        }
        moduleEls.forEach(function (el) {
            if (!el.dataset.uuid) {
                var moduleNames = ModuleManager.getModuleNames(el.dataset.module);
                var newUUID_1 = uuid();
                if (moduleNames.length) {
                    moduleNames.forEach(function (id) {
                        try {
                            var newModule = new modules[id].prototype.constructor(el, newUUID_1, _this);
                            _this._modules.push(newModule);
                            newModule.init();
                        }
                        catch (_a) {
                            if (Env_1.Env.isDebug) {
                                console.warn("Module " + id + " is undefined");
                            }
                        }
                    });
                }
            }
        });
    };
    ModuleManager.removeModules = function () {
        var _this = this;
        var moduleEls = Array.from(document.body.querySelectorAll('[data-module]'));
        var deadModules = [];
        if (!moduleEls.length) {
            return;
        }
        this._modules.forEach(function (module) {
            var survived = false;
            moduleEls.forEach(function (el) {
                if (el.dataset.uuid === module.uuid) {
                    survived = true;
                    return;
                }
            });
            if (!survived) {
                deadModules.push(module);
            }
        });
        if (deadModules.length) {
            deadModules.forEach(function (deadModule) {
                _this._modules.forEach(function (module) {
                    if (deadModule.uuid === module.uuid) {
                        module.destroy();
                        var index = _this._modules.indexOf(module);
                        _this._modules.splice(index, 1);
                    }
                });
            });
        }
    };
    ModuleManager.removeModule = function (uuid) {
        var _this = this;
        if (!uuid) {
            if (Env_1.Env.isDebug) {
                console.error('UUID value was not provided');
                return;
            }
        }
        this._modules.forEach(function (module) {
            if (module.uuid === uuid) {
                module.destroy();
                var index = _this._modules.indexOf(module);
                _this._modules.splice(index, 1);
            }
        });
    };
    ModuleManager._modules = [];
    return ModuleManager;
}());
exports.ModuleManager = ModuleManager;


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
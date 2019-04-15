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
        if (Env_1.Env.isDebug) {
            console.log('%c[Module Manager] ' + "%csuccessfully started", 'color:#4882fd', 'color:#eee');
        }
        ModuleManager.initModules();
    }
    ModuleManager.wrangleModules = function () {
        this.initModules();
    };
    ModuleManager.manageModules = function () {
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
        if (Env_1.Env.isDebug) {
            console.log('%c[Module Manager] ' + "%cinstantiating new modules", 'color:#4882fd', 'color:#eee');
        }
        var moduleEls = Array.from(document.body.querySelectorAll('[data-module]'));
        if (!moduleEls.length) {
            if (Env_1.Env.isDebug) {
                console.log('%c[Module Manager] ' + "%cno modules are required", 'color:#4882fd', 'color:#eee');
            }
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
                            if (Env_1.Env.isDebug) {
                                console.log('%c[Module Manager] ' + ("%ccreated new %c" + id + " %cmodule: %c" + newUUID_1), 'color:#4882fd', 'color:#eee', 'color:#48eefd', 'color:#eee', 'color:#48eefd');
                            }
                            if (el.dataset.waitingForModule) {
                                el.removeAttribute('data-waiting-for-module');
                            }
                        }
                        catch (_a) {
                            if (Env_1.Env.isDebug) {
                                console.warn('%c[Module Manager] ' + ("%cmodule %c" + id + " %cis undefined"), 'color:#4882fd', 'color:#eee', 'color:#48eefd', 'color:#eee');
                            }
                            el.dataset.waitingForModule = 'true';
                        }
                    });
                }
            }
        });
    };
    ModuleManager.removeModules = function () {
        var _this = this;
        if (Env_1.Env.isDebug) {
            console.log('%c[Module Manager] ' + "%cremoving dead modules", 'color:#4882fd', 'color:#eee');
        }
        if (!this._modules.length) {
            if (Env_1.Env.isDebug) {
                console.log('%c[Module Manager] ' + "%cno modules needed to be removed", 'color:#4882fd', 'color:#eee');
            }
            return;
        }
        var moduleEls = Array.from(document.body.querySelectorAll('[data-module]'));
        var deadModules = [];
        this._modules.forEach(function (module) {
            var survived = false;
            moduleEls.forEach(function (el) {
                if (el.dataset.uuid === module.uuid || el.dataset.waitingForModule) {
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
                        if (Env_1.Env.isDebug) {
                            console.log('%c[Module Manager] ' + ("%cremoved module: %c" + module.uuid), 'color:#4882fd', 'color:#eee', 'color:#48eefd');
                        }
                    }
                });
            });
        }
        if (Env_1.Env.isDebug) {
            console.log('%c[Module Manager] ' + "%cfinished removing the dead modules", 'color:#4882fd', 'color:#eee');
        }
    };
    ModuleManager.removeModule = function (uuid) {
        var _this = this;
        if (!uuid) {
            if (Env_1.Env.isDebug) {
                console.error('%c[Module Manager] ' + "%cUUID was not provided", 'color:#4882fd', 'color:#eee');
            }
            return;
        }
        this._modules.forEach(function (module) {
            if (module.uuid === uuid) {
                module.destroy();
                var index = _this._modules.indexOf(module);
                _this._modules.splice(index, 1);
                if (Env_1.Env.isDebug) {
                    console.log('%c[Module Manager] ' + ("%cmodule with UUID " + uuid + " has been removed"), 'color:#4882fd', 'color:#eee');
                }
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
    };
    return BaseModule;
}());
exports.BaseModule = BaseModule;


/***/ })

}]);
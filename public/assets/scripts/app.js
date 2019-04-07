(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["app"],{

/***/ "./_compiled/app/script/App.js":
/*!*************************************!*\
  !*** ./_compiled/app/script/App.js ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
eval("\r\nObject.defineProperty(exports, \"__esModule\", { value: true });\r\nvar Env_1 = __webpack_require__(/*! ./Env */ \"./_compiled/app/script/Env.js\");\r\nvar pjax_1 = __webpack_require__(/*! @codewithkyle/pjax */ \"./node_modules/@codewithkyle/pjax/pjax.js\");\r\nvar device_manager_1 = __webpack_require__(/*! @codewithkyle/device-manager */ \"./node_modules/@codewithkyle/device-manager/DeviceManager.js\");\r\nvar App = (function () {\r\n    function App() {\r\n        var _this = this;\r\n        this.handlePageLoad = function () {\r\n            _this.reinit();\r\n        };\r\n        this._deviceManager = null;\r\n        this.init();\r\n    }\r\n    App.prototype.init = function () {\r\n        new Env_1.Env();\r\n        new pjax_1.default({ debug: Env_1.Env.isDebug });\r\n        this._deviceManager = new device_manager_1.default(Env_1.Env.isDebug, true);\r\n        document.addEventListener('pjax:complete', this.handlePageLoad);\r\n    };\r\n    App.prototype.reinit = function () {\r\n        if (this._deviceManager !== null) {\r\n            this._deviceManager.reinit();\r\n        }\r\n    };\r\n    return App;\r\n}());\r\n(function () {\r\n    new App();\r\n})();\r\n\n\n//# sourceURL=webpack:///./_compiled/app/script/App.js?");

/***/ })

},[["./_compiled/app/script/App.js","runtime","npm.codewithkyle","globals"]]]);
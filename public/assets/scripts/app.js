(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["app"],{

/***/ "./_compiled/app/script/App.js":
/*!*************************************!*\
  !*** ./_compiled/app/script/App.js ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
eval("\nObject.defineProperty(exports, \"__esModule\", { value: true });\nvar Env_1 = __webpack_require__(/*! ./Env */ \"./_compiled/app/script/Env.js\");\nvar device_manager_1 = __webpack_require__(/*! @codewithkyle/device-manager */ \"./node_modules/@codewithkyle/device-manager/DeviceManager.js\");\nvar App = (function () {\n    function App() {\n        var _this = this;\n        this.handlePageLoad = function () {\n            _this.reinit();\n        };\n        this._deviceManager = null;\n        this.init();\n    }\n    App.prototype.init = function () {\n        new Env_1.default();\n        this._deviceManager = new device_manager_1.default(Env_1.default.isDebug, true);\n        document.addEventListener('pjax:complete', this.handlePageLoad);\n    };\n    App.prototype.reinit = function () {\n        if (this._deviceManager !== null) {\n            this._deviceManager.reinit();\n        }\n    };\n    return App;\n}());\n(function () {\n    new App();\n})();\n\n\n//# sourceURL=webpack:///./_compiled/app/script/App.js?");

/***/ })

},[["./_compiled/app/script/App.js","runtime","npm.codewithkyle","globals"]]]);
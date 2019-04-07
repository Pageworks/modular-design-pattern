(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["header"],{

/***/ "./_compiled/app/script/BaseModule.js":
/*!********************************************!*\
  !*** ./_compiled/app/script/BaseModule.js ***!
  \********************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
eval("\r\nObject.defineProperty(exports, \"__esModule\", { value: true });\r\nvar Env_1 = __webpack_require__(/*! ./Env */ \"./_compiled/app/script/Env.js\");\r\nvar BaseModule = (function () {\r\n    function BaseModule(el, uuid, app) {\r\n        this.el = el;\r\n        this.uuid = uuid;\r\n        this.app = app;\r\n        this.isDebug = Env_1.Env.isDebug;\r\n        this.el.dataset.uuid = this.uuid;\r\n    }\r\n    BaseModule.prototype.init = function () { };\r\n    BaseModule.prototype.destroy = function (MODULE_NAME) {\r\n        this.el.removeAttribute('data-uuid');\r\n        if (this.isDebug) {\r\n            console.log(MODULE_NAME + \" has been removed\");\r\n        }\r\n    };\r\n    return BaseModule;\r\n}());\r\nexports.BaseModule = BaseModule;\r\n\n\n//# sourceURL=webpack:///./_compiled/app/script/BaseModule.js?");

/***/ }),

/***/ "./_compiled/templates/components/header/header.js":
/*!*********************************************************!*\
  !*** ./_compiled/templates/components/header/header.js ***!
  \*********************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
eval("\r\nvar __extends = (this && this.__extends) || (function () {\r\n    var extendStatics = function (d, b) {\r\n        extendStatics = Object.setPrototypeOf ||\r\n            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||\r\n            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };\r\n        return extendStatics(d, b);\r\n    };\r\n    return function (d, b) {\r\n        extendStatics(d, b);\r\n        function __() { this.constructor = d; }\r\n        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());\r\n    };\r\n})();\r\nObject.defineProperty(exports, \"__esModule\", { value: true });\r\nvar BaseModule_1 = __webpack_require__(/*! ../../../app/script/BaseModule */ \"./_compiled/app/script/BaseModule.js\");\r\nvar Header = (function (_super) {\r\n    __extends(Header, _super);\r\n    function Header(el, uuid, app) {\r\n        var _this = _super.call(this, el, uuid, app) || this;\r\n        if (_this.isDebug) {\r\n            console.log(\"Creating a new \" + Header.MODULE_NAME + \" module\");\r\n        }\r\n        return _this;\r\n    }\r\n    Header.prototype.init = function () {\r\n    };\r\n    Header.prototype.destroy = function () {\r\n        _super.prototype.destroy.call(this, Header.MODULE_NAME);\r\n    };\r\n    Header.MODULE_NAME = 'Header';\r\n    return Header;\r\n}(BaseModule_1.BaseModule));\r\nexports.Header = Header;\r\n\n\n//# sourceURL=webpack:///./_compiled/templates/components/header/header.js?");

/***/ })

},[["./_compiled/templates/components/header/header.js","runtime","globals"]]]);
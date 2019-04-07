(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["globals"],{

/***/ "./_compiled/app/script/Env.js":
/*!*************************************!*\
  !*** ./_compiled/app/script/Env.js ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
eval("\r\nObject.defineProperty(exports, \"__esModule\", { value: true });\r\nvar Env = (function () {\r\n    function Env() {\r\n        if (window.location.hostname.match(/.local/gi)) {\r\n            Env.setDebug(true);\r\n        }\r\n        else if (document.documentElement.getAttribute('debug') !== null) {\r\n            Env.setDebug(true);\r\n        }\r\n    }\r\n    Env.setDebug = function (status) {\r\n        Env.isDebug = status;\r\n    };\r\n    Env.PJAX_CONTAINER = '.js-pjax';\r\n    Env.SCROLL_TRIGGER = 100;\r\n    Env.isDebug = false;\r\n    Env.EASING = {\r\n        ease: 'cubicBezier(0.4, 0.0, 0.2, 1)',\r\n        in: 'cubicBezier(0.0, 0.0, 0.2, 1)',\r\n        out: 'cubicBezier(0.4, 0.0, 1, 1)',\r\n        sharp: 'cubicBezier(0.4, 0.0, 0.6, 1)'\r\n    };\r\n    return Env;\r\n}());\r\nexports.Env = Env;\r\n\n\n//# sourceURL=webpack:///./_compiled/app/script/Env.js?");

/***/ })

}]);
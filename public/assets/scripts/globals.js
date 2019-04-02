(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["globals"],{

/***/ "./_compiled/app/script/Env.js":
/*!*************************************!*\
  !*** ./_compiled/app/script/Env.js ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
eval("\nObject.defineProperty(exports, \"__esModule\", { value: true });\nvar Env = (function () {\n    function Env() {\n        if (window.location.hostname.match(/.local/gi)) {\n            Env.setDebug(true);\n        }\n        else if (document.documentElement.getAttribute('debug') !== null) {\n            Env.setDebug(true);\n        }\n        console.log('Env started');\n    }\n    Env.setDebug = function (status) {\n        Env.isDebug = status;\n    };\n    Env.PJAX_CONTAINER = '.js-pjax';\n    Env.SCROLL_TRIGGER = 100;\n    Env.APP_NAME = 'REPLACE_ME';\n    Env.isDebug = false;\n    Env.EASING = {\n        ease: 'cubicBezier(0.4, 0.0, 0.2, 1)',\n        in: 'cubicBezier(0.0, 0.0, 0.2, 1)',\n        out: 'cubicBezier(0.4, 0.0, 1, 1)',\n        sharp: 'cubicBezier(0.4, 0.0, 0.6, 1)'\n    };\n    return Env;\n}());\nexports.default = Env;\n\n\n//# sourceURL=webpack:///./_compiled/app/script/Env.js?");

/***/ })

}]);
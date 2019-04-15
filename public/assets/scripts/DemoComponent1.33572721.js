(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[5],{

/***/ 20:
/***/ (function(module, exports, __webpack_require__) {

"use strict";

var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
var BaseModule_1 = __webpack_require__(21);
var DemoComponent1 = (function (_super) {
    __extends(DemoComponent1, _super);
    function DemoComponent1(el, uuid, manager) {
        var _this = _super.call(this, el, uuid, manager) || this;
        if (_this.isDebug) {
            console.log("Creating a new " + DemoComponent1.MODULE_NAME + " module");
        }
        return _this;
    }
    DemoComponent1.prototype.init = function () {
        var _this = this;
        console.log('Component 1 started');
        this.el.addEventListener('mouseenter', function (e) {
            if (_this.el.classList.contains('is-alt')) {
                _this.el.classList.remove('is-alt');
            }
            else {
                _this.el.classList.add('is-alt');
            }
        });
    };
    DemoComponent1.prototype.destroy = function () {
        _super.prototype.destroy.call(this, DemoComponent1.MODULE_NAME);
    };
    DemoComponent1.MODULE_NAME = 'DemoComponent1';
    return DemoComponent1;
}(BaseModule_1.BaseModule));
exports.DemoComponent1 = DemoComponent1;
modules[DemoComponent1.MODULE_NAME] = DemoComponent1;
console.log('loaded');


/***/ })

},[[20,0,2]]]);
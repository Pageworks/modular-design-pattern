"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function isInView(el) {
    var rect = el.getBoundingClientRect();
    return (rect.height > 0 || rect.width > 0) && rect.bottom >= 0 && rect.right >= 0 && rect.top <= (window.innerHeight || document.documentElement.clientHeight) && rect.left <= (window.innerWidth || document.documentElement.clientWidth);
}
exports.isInView = isInView;

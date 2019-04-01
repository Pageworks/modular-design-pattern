"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function customEvent(eventType, detail) {
    if (detail === void 0) { detail = {}; }
    var event = new CustomEvent(eventType, { detail: detail });
    document.dispatchEvent(event);
}
exports.customEvent = customEvent;
//# sourceMappingURL=customEvent.js.map
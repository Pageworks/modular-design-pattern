export function customEvent(eventType, detail) {
    if (detail === void 0) { detail = {}; }
    var event = new CustomEvent(eventType, { detail: detail });
    document.dispatchEvent(event);
}

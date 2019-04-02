export function getParent(el, selector) {
    var parent = el;
    do {
        parent = parent.parentElement;
        if (parent.classList.contains(selector))
            return parent;
    } while (parent.parentElement !== null);
    return el;
}

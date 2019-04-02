(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[3],[
/* 0 */,
/* 1 */,
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
var parse_options_1 = __webpack_require__(3);
var trigger_1 = __webpack_require__(4);
var parse_dom_1 = __webpack_require__(5);
var scroll_1 = __webpack_require__(10);
var clear_active_1 = __webpack_require__(11);
var state_manager_1 = __webpack_require__(12);
var device_manager_1 = __webpack_require__(14);
var Pjax = (function () {
    function Pjax(options) {
        var _this = this;
        this.handlePopstate = function (e) {
            if (e.state) {
                if (_this.options.debug) {
                    console.log('%c[Pjax] ' + "%chijacking popstate event", 'color:#f3ff35', 'color:#eee');
                }
                _this._scrollTo = e.state.scrollPos;
                _this.loadUrl(e.state.uri, 'popstate');
            }
        };
        this.handleContinue = function (e) {
            if (_this._cachedSwitch !== null) {
                if (_this.options.titleSwitch) {
                    document.title = _this._cachedSwitch.title;
                }
                _this.handleSwitches(_this._cachedSwitch.queue);
            }
            else {
                if (_this.options.debug) {
                    console.log('%c[Pjax] ' + "%cswitch queue was empty. You might be sending pjax:continue early", 'color:#f3ff35', 'color:#eee');
                }
                trigger_1.default(document, ['pjax:error']);
            }
        };
        this._dom = document.documentElement;
        if (device_manager_1.default.isIE) {
            console.log('%c[Pjax] ' + "%cIE 11 detected - Pjax aborted", 'color:#f3ff35', 'color:#eee');
            this._dom.classList.remove('dom-is-loading');
            this._dom.classList.add('dom-is-loaded');
            return;
        }
        this._cache = null;
        this.options = parse_options_1.default(options);
        this._request = null;
        this._confirmed = false;
        this._cachedSwitch = null;
        this._scrollTo = { x: 0, y: 0 };
        this._isPushstate = true;
        this.init();
    }
    Pjax.prototype.init = function () {
        if (this.options.debug) {
            console.log('%c[Pjax] ' + ("%cinitializing Pjax version " + Pjax.VERSION), 'color:#f3ff35', 'color:#eee');
            console.log('%c[Pjax] ' + "%cview Pjax documentation at http://papertrain.io/pjax", 'color:#f3ff35', 'color:#eee');
            console.log('%c[Pjax] ' + "%cloaded with the following options: ", 'color:#f3ff35', 'color:#eee');
            console.log(this.options);
        }
        this._dom.classList.add('dom-is-loaded');
        this._dom.classList.remove('dom-is-loading');
        new state_manager_1.default(this.options.debug, true);
        window.addEventListener('popstate', this.handlePopstate);
        if (this.options.customTransitions) {
            document.addEventListener('pjax:continue', this.handleContinue);
        }
        parse_dom_1.default(document.body, this);
    };
    Pjax.prototype.loadUrl = function (href, loadType) {
        this.abortRequest();
        this._cache = null;
        this.handleLoad(href, loadType);
    };
    Pjax.prototype.abortRequest = function () {
        if (this._request === null) {
            return;
        }
        if (this._request.readyState !== 4) {
            this._request.abort();
        }
        this._request = null;
    };
    Pjax.prototype.finalize = function () {
        if (this.options.debug) {
            console.log('%c[Pjax] ' + "%cpage transition completed", 'color:#f3ff35', 'color:#eee');
        }
        scroll_1.default(this._scrollTo);
        if (this.options.history) {
            if (this._isPushstate) {
                state_manager_1.default.doPush(this._request.responseURL, document.title);
            }
            else {
                state_manager_1.default.doReplace(this._request.responseURL, document.title);
            }
        }
        this._cache = null;
        this._request = null;
        this._confirmed = false;
        this._cachedSwitch = null;
        this._isPushstate = true;
        this._scrollTo = { x: 0, y: 0 };
        trigger_1.default(document, ['pjax:complete']);
        this._dom.classList.add('dom-is-loaded');
        this._dom.classList.remove('dom-is-loading');
    };
    Pjax.prototype.handleSwitches = function (switchQueue) {
        for (var i = 0; i < switchQueue.length; i++) {
            switchQueue[i].current.innerHTML = switchQueue[i].new.innerHTML;
            parse_dom_1.default(switchQueue[i].current, this);
        }
        this.finalize();
    };
    Pjax.prototype.switchSelectors = function (selectors, tempDocument, currentDocument) {
        if (tempDocument === null) {
            if (this.options.debug) {
                console.log('%c[Pjax] ' + ("%ctemporary document was null, telling the browser to load " + ((this._cache !== null) ? this._cache.url : this._request.responseURL)), 'color:#f3ff35', 'color:#eee');
            }
            if (this._cache !== null) {
                this.lastChance(this._cache.url);
            }
            else {
                this.lastChance(this._request.responseURL);
            }
        }
        var switchQueue = [];
        var contiansScripts = false;
        for (var i = 0; i < selectors.length; i++) {
            var newContainers = Array.from(tempDocument.querySelectorAll(selectors[i]));
            var currentContainers = Array.from(currentDocument.querySelectorAll(selectors[i]));
            if (this.options.debug) {
                console.log('%c[Pjax] ' + ("%cswapping content from " + selectors[i]), 'color:#f3ff35', 'color:#eee');
            }
            if (newContainers.length !== currentContainers.length) {
                if (this.options.debug) {
                    console.log('%c[Pjax] ' + "%cthe dom doesn't look the same", 'color:#f3ff35', 'color:#eee');
                }
                this.lastChance(this._request.responseURL);
                return;
            }
            for (var k = 0; k < newContainers.length; k++) {
                var scripts = Array.from(newContainers[k].querySelectorAll('script'));
                if (scripts.length > 0) {
                    contiansScripts = true;
                }
                var newContainer = newContainers[k];
                var currentContainer = currentContainers[k];
                var switchObject = {
                    new: newContainer,
                    current: currentContainer
                };
                switchQueue.push(switchObject);
            }
        }
        if (switchQueue.length === 0) {
            if (this.options.debug) {
                console.log('%c[Pjax] ' + "%ccouldn't find anything to switch", 'color:#f3ff35', 'color:#eee');
            }
            this.lastChance(this._request.responseURL);
            return;
        }
        if (contiansScripts) {
            if (this.options.debug) {
                console.log('%c[Pjax] ' + "%cthe new page contains scripts", 'color:#f3ff35', 'color:#eee');
            }
            this.lastChance(this._request.responseURL);
            return;
        }
        if (!this.options.customTransitions) {
            if (this.options.titleSwitch) {
                document.title = tempDocument.title;
            }
            this.handleSwitches(switchQueue);
        }
        else {
            this._cachedSwitch = {
                queue: switchQueue,
                title: tempDocument.title
            };
        }
    };
    Pjax.prototype.lastChance = function (uri) {
        if (this.options.debug) {
            console.log('%c[Pjax] ' + ("%csomething caused Pjax to break, native loading " + uri), 'color:#f3ff35', 'color:#eee');
        }
        window.location.href = uri;
    };
    Pjax.prototype.statusCheck = function () {
        for (var status_1 = 200; status_1 <= 206; status_1++) {
            if (this._cache.status === status_1) {
                return true;
            }
        }
        return false;
    };
    Pjax.prototype.loadCachedContent = function () {
        if (!this.statusCheck()) {
            this.lastChance(this._cache.url);
            return;
        }
        clear_active_1.default();
        state_manager_1.default.doReplace(window.location.href, document.title);
        this.switchSelectors(this.options.selectors, this._cache.document, document);
    };
    Pjax.prototype.parseContent = function (responseText) {
        var tempDocument = document.implementation.createHTMLDocument('pjax-temp-document');
        var htmlRegex = /<html[^>]+>/gi;
        var matches = responseText.match(htmlRegex);
        if (matches !== null) {
            tempDocument.documentElement.innerHTML = responseText;
            return tempDocument;
        }
        return null;
    };
    Pjax.prototype.cacheContent = function (responseText, responseStatus, uri) {
        var tempDocument = this.parseContent(responseText);
        this._cache = {
            status: responseStatus,
            document: tempDocument,
            url: uri
        };
        if (tempDocument instanceof HTMLDocument) {
            if (this.options.debug) {
                console.log('%c[Pjax] ' + "%ccaching content", 'color:#f3ff35', 'color:#eee');
            }
        }
        else {
            if (this.options.debug) {
                console.log('%c[Pjax] ' + "%cresponse wan't an HTML document", 'color:#f3ff35', 'color:#eee');
            }
            trigger_1.default(document, ['pjax:error']);
        }
    };
    Pjax.prototype.loadContent = function (responseText) {
        var tempDocument = this.parseContent(responseText);
        if (tempDocument instanceof HTMLDocument) {
            clear_active_1.default();
            state_manager_1.default.doReplace(window.location.href, document.title);
            this.switchSelectors(this.options.selectors, tempDocument, document);
        }
        else {
            if (this.options.debug) {
                console.log('%c[Pjax] ' + "%cresponse wasn't an HTML document", 'color:#f3ff35', 'color:#eee');
            }
            trigger_1.default(document, ['pjax:error']);
            this.lastChance(this._request.responseURL);
            return;
        }
    };
    Pjax.prototype.handleResponse = function (e, loadType) {
        if (this.options.debug) {
            console.log('%c[Pjax] ' + ("%cXML Http Request status: " + this._request.status), 'color:#f3ff35', 'color:#eee');
        }
        if (this._request.responseText === null) {
            trigger_1.default(document, ['pjax:error']);
            return;
        }
        switch (loadType) {
            case 'prefetch':
                if (this._confirmed) {
                    this.loadContent(this._request.responseText);
                }
                else {
                    this.cacheContent(this._request.responseText, this._request.status, this._request.responseURL);
                }
                break;
            case 'popstate':
                this._isPushstate = false;
                this.loadContent(this._request.responseText);
                break;
            case 'reload':
                this._isPushstate = false;
                this.loadContent(this._request.responseText);
                break;
            default:
                this.loadContent(this._request.responseText);
                break;
        }
    };
    Pjax.prototype.doRequest = function (href) {
        var _this = this;
        var reqeustMethod = 'GET';
        var timeout = this.options.timeout || 0;
        var request = new XMLHttpRequest();
        var uri = href;
        var queryString = href.split('?')[1];
        if (this.options.cacheBust) {
            uri += (queryString === undefined) ? ("?cb=" + Date.now()) : ("&cb=" + Date.now());
        }
        return new Promise(function (resolve, reject) {
            request.open(reqeustMethod, uri, true);
            request.timeout = timeout;
            request.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
            request.setRequestHeader('X-PJAX', 'true');
            request.setRequestHeader('X-PJAX-Selectors', JSON.stringify(_this.options.selectors));
            request.onload = resolve;
            request.onerror = reject;
            request.send();
            _this._request = request;
        });
    };
    Pjax.prototype.handlePrefetch = function (href) {
        var _this = this;
        if (this._confirmed) {
            return;
        }
        if (this.options.debug) {
            console.log('%c[Pjax] ' + ("%cprefetching " + href), 'color:#f3ff35', 'color:#eee');
        }
        this.abortRequest();
        trigger_1.default(document, ['pjax:prefetch']);
        this.doRequest(href).then(function (e) {
            _this.handleResponse(e, 'prefetch');
        }).catch(function (e) {
            if (_this.options.debug) {
                console.log('%c[Pjax] ' + "%cXHR error:", 'color:#f3ff35', 'color:#eee');
                console.log(e);
            }
        });
    };
    Pjax.prototype.handleLoad = function (href, loadType, el) {
        var _this = this;
        if (el === void 0) { el = null; }
        if (this._confirmed) {
            return;
        }
        trigger_1.default(document, ['pjax:send'], el);
        this._dom.classList.remove('dom-is-loaded');
        this._dom.classList.add('dom-is-loading');
        this._confirmed = true;
        if (this._cache !== null) {
            if (this.options.debug) {
                console.log('%c[Pjax] ' + ("%cloading cached content from " + href), 'color:#f3ff35', 'color:#eee');
            }
            this.loadCachedContent();
        }
        else if (this._request !== null) {
            if (this.options.debug) {
                console.log('%c[Pjax] ' + ("%cconfirming prefetch for " + href), 'color:#f3ff35', 'color:#eee');
            }
            this._confirmed = true;
        }
        else {
            if (this.options.debug) {
                console.log('%c[Pjax] ' + ("%cloading " + href), 'color:#f3ff35', 'color:#eee');
            }
            this.doRequest(href).then(function (e) {
                _this.handleResponse(e, loadType);
            }).catch(function (e) {
                if (_this.options.debug) {
                    console.log('%c[Pjax] ' + "%cXHR error:", 'color:#f3ff35', 'color:#eee');
                    console.log(e);
                }
            });
        }
    };
    Pjax.prototype.clearPrefetch = function () {
        if (!this._confirmed) {
            this._cache = null;
            this.abortRequest();
            trigger_1.default(document, ['pjax:cancel']);
        }
    };
    Pjax.VERSION = '1.3.0';
    return Pjax;
}());
exports.default = Pjax;
//# sourceMappingURL=pjax.js.map

/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
exports.default = (function (options) {
    if (options === void 0) { options = null; }
    var parsedOptions = (options !== null) ? options : {};
    parsedOptions.elements = (options !== null && options.elements !== undefined) ? options.elements : 'a[href]';
    parsedOptions.selectors = (options !== null && options.selectors !== undefined) ? options.selectors : ['.js-pjax'];
    parsedOptions.history = (options !== null && options.history !== undefined) ? options.history : true;
    parsedOptions.cacheBust = (options !== null && options.cacheBust !== undefined) ? options.cacheBust : false;
    parsedOptions.debug = (options !== null && options.debug !== undefined) ? options.debug : false;
    parsedOptions.timeout = (options !== null && options.timeout !== undefined) ? options.timeout : 0;
    parsedOptions.titleSwitch = (options !== null && options.titleSwitch !== undefined) ? options.titleSwitch : true;
    parsedOptions.customTransitions = (options !== null && options.customTransitions !== undefined) ? options.customTransitions : false;
    parsedOptions.customPreventionAttributes = (options !== null && options.customPreventionAttributes !== undefined) ? options.customPreventionAttributes : [];
    return parsedOptions;
});
//# sourceMappingURL=parse-options.js.map

/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
exports.default = (function (el, events, target) {
    if (target === void 0) { target = null; }
    events.forEach(function (e) {
        if (target !== null) {
            var customEvent = new CustomEvent(e, {
                detail: {
                    el: target
                }
            });
            el.dispatchEvent(customEvent);
        }
        else {
            var event_1 = new Event(e);
            el.dispatchEvent(event_1);
        }
    });
});
//# sourceMappingURL=trigger.js.map

/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
var get_elements_1 = __webpack_require__(6);
var check_element_1 = __webpack_require__(7);
exports.default = (function (el, pjax) {
    var elements = get_elements_1.default(el, pjax);
    if (pjax.options.debug && elements.length === 0) {
        console.log('%c[Pjax] ' + "%cno elements could be found, check what selectors you're providing Pjax", 'color:#f3ff35', 'color:#eee');
        return;
    }
    for (var i = 0; i < elements.length; i++) {
        check_element_1.default(elements[i], pjax);
    }
});
//# sourceMappingURL=parse-dom.js.map

/***/ }),
/* 6 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
exports.default = (function (el, pjax) {
    var elements = Array.from(el.querySelectorAll(pjax.options.elements));
    return elements;
});
//# sourceMappingURL=get-elements.js.map

/***/ }),
/* 7 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
var link_events_1 = __webpack_require__(8);
exports.default = (function (el, pjax) {
    if (el.getAttribute('href')) {
        link_events_1.default(el, pjax);
    }
    else {
        if (pjax.options.debug) {
            console.log('%c[Pjax] ' + ("%c" + el + " is missing a href attribute, Pjax couldn't assign the event listener"), 'color:#f3ff35', 'color:#eee');
        }
    }
});
//# sourceMappingURL=check-element.js.map

/***/ }),
/* 8 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
var on_1 = __webpack_require__(9);
var attrState = 'data-pjax-state';
var isDefaultPrevented = function (el, e, options) {
    var isPrevented = false;
    if (e.defaultPrevented) {
        isPrevented = true;
    }
    else if (el.getAttribute('prevent-pjax') !== null) {
        isPrevented = true;
    }
    else if (el.classList.contains('no-transition')) {
        isPrevented = true;
    }
    else if (el.getAttribute('download') !== null) {
        isPrevented = true;
    }
    else if (el.getAttribute('target') === '_blank') {
        isPrevented = true;
    }
    if (options.length > 0) {
        for (var i = 0; i < options.length; i++) {
            if (el.getAttribute(options[i]) !== null) {
                isPrevented = true;
            }
        }
    }
    return isPrevented;
};
var checkForAbort = function (el, e) {
    if (el instanceof HTMLAnchorElement) {
        if (el.protocol !== window.location.protocol || el.host !== window.location.host) {
            return 'external';
        }
        if (el.hash && el.href.replace(el.hash, '') === window.location.href.replace(location.hash, '')) {
            return 'anchor';
        }
        if (el.href === window.location.href.split('#')[0] + ", '#'") {
            return 'anchor-empty';
        }
    }
    return null;
};
var handleClick = function (el, e, pjax) {
    if (isDefaultPrevented(el, e, pjax.options.customPreventionAttributes)) {
        return;
    }
    var attrValue = checkForAbort(el, e);
    if (attrValue !== null) {
        el.setAttribute(attrState, attrValue);
        return;
    }
    e.preventDefault();
    var elementLink = el.getAttribute('href');
    if (elementLink === window.location.href.split('#')[0]) {
        el.setAttribute(attrState, 'reload');
    }
    else {
        el.setAttribute(attrState, 'load');
    }
    pjax.handleLoad(elementLink, el.getAttribute(attrState), el);
};
var handleHover = function (el, e, pjax) {
    if (isDefaultPrevented(el, e, pjax.options.customPreventionAttributes)) {
        return;
    }
    if (e.type === 'mouseleave') {
        pjax.clearPrefetch();
        return;
    }
    var attrValue = checkForAbort(el, e);
    if (attrValue !== null) {
        el.setAttribute(attrState, attrValue);
        return;
    }
    var elementLink = el.getAttribute('href');
    if (elementLink !== window.location.href.split('#')[0]) {
        el.setAttribute(attrState, 'prefetch');
    }
    else {
        return;
    }
    pjax.handlePrefetch(elementLink);
};
exports.default = (function (el, pjax) {
    el.setAttribute(attrState, '');
    on_1.default(el, 'click', function (e) { handleClick(el, e, pjax); });
    on_1.default(el, 'mouseenter', function (e) { handleHover(el, e, pjax); });
    on_1.default(el, 'mouseleave', function (e) { handleHover(el, e, pjax); });
    on_1.default(el, 'keyup', function (e) {
        if (e.key === 'enter' || e.keyCode === 13)
            handleClick(el, e, pjax);
    });
});
//# sourceMappingURL=link-events.js.map

/***/ }),
/* 9 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
exports.default = (function (el, event, listener) {
    el.addEventListener(event, listener);
});
//# sourceMappingURL=on.js.map

/***/ }),
/* 10 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
exports.default = (function (scrollTo) {
    window.scrollTo(scrollTo.x, scrollTo.y);
});
//# sourceMappingURL=scroll.js.map

/***/ }),
/* 11 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
exports.default = (function () {
    if (document.activeElement) {
        try {
            document.activeElement.blur();
        }
        catch (e) {
            console.log(e);
        }
    }
});
//# sourceMappingURL=clear-active.js.map

/***/ }),
/* 12 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
var timestamp_1 = __webpack_require__(13);
var StateManager = /** @class */ (function () {
    function StateManager(debug, initialpushState) {
        this._doInitialPushState = (initialpushState) ? initialpushState : false;
        StateManager._isDebug = (debug) ? debug : false;
        // Check if the initial page state needs to be pushed into history
        if (this._doInitialPushState) {
            StateManager.doReplace(window.location.href);
        }
    }
    /**
     * Replaces the current `StateObject` in the windows history.
     * @param stateObject - the new`StateObject`
     */
    StateManager.handleReplaceState = function (stateObject) {
        if (StateManager._isDebug) {
            console.log('Replacing History State: ', stateObject);
        }
        window.history.replaceState(stateObject, stateObject.title, stateObject.uri);
    };
    /**
     * Pushes the `StateObject` into the windows history.
     * @param stateObject - `StateObject` that will be pushed into the windows history
     */
    StateManager.handlePushState = function (stateObject) {
        if (StateManager._isDebug) {
            console.log('Pushing History State: ', stateObject);
        }
        window.history.pushState(stateObject, stateObject.title, stateObject.uri);
    };
    /**
     * Builds the custom `StateObject`
     * @param pageURI - the new URI of the page
     * @param isPushstate - the new document title
     * @param pageTitle - the current scroll position of the page
     */
    StateManager.buildStateObject = function (pageURI, isPushstate, pageTitle, scrollOffset) {
        var stateObject = {
            uri: pageURI,
            timestamp: timestamp_1.default(),
            history: isPushstate,
            scrollPos: {
                x: (window.scrollX + scrollOffset.x),
                y: (window.scrollY + scrollOffset.y)
            }
        };
        stateObject.title = (pageTitle !== null && pageTitle !== undefined) ? pageTitle : document.title;
        // Handle the state type
        if (isPushstate) {
            StateManager.handlePushState(stateObject);
        }
        else {
            StateManager.handleReplaceState(stateObject);
        }
    };
    /**
     * Called when a new `window.history.pushState()` needs to occur.
     * @param uri - the new URI of the page
     * @param title - the new document title
     * @param scrollPosition - the current scroll position of the page
     */
    StateManager.doPush = function (uri, title, scrollOffset) {
        if (title === void 0) { title = document.title; }
        if (scrollOffset === void 0) { scrollOffset = { x: 0, y: 0 }; }
        StateManager.buildStateObject(uri, true, title, scrollOffset);
    };
    /**
     * Called when a new `window.history.replaceState()` needs to occur.
     * @param uri - the new URI of the page
     * @param title - the new document title
     * @param scrollPosition - the current scroll position of the page
     */
    StateManager.doReplace = function (uri, title, scrollOffset) {
        if (title === void 0) { title = document.title; }
        if (scrollOffset === void 0) { scrollOffset = { x: 0, y: 0 }; }
        StateManager.buildStateObject(uri, false, title, scrollOffset);
    };
    return StateManager;
}());
exports.default = StateManager;
//# sourceMappingURL=manager.js.map

/***/ }),
/* 13 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
/**
 * Grab the current timestamp.
 * @returns `Date.now()` number
 */
exports.default = (function () {
    return Date.now();
});
//# sourceMappingURL=timestamp.js.map

/***/ }),
/* 14 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
var DeviceManager = /** @class */ (function () {
    function DeviceManager(debug, setStatusClasses) {
        var _this = this;
        /**
         * Called when the `touchstart` event fires on an element that has a `js-touch` class.
         */
        this.userTouchedElement = function (e) {
            var target = e.currentTarget;
            target.setAttribute('data-touching', "true");
        };
        /**
         * Called when the `touchend` or `touchcancel` or `touchleave` event(s) fire on
         * an element with the `js-touch` class.
         */
        this.userReleasedTouchedElement = function (e) {
            var target = e.currentTarget;
            target.setAttribute('data-touching', "false");
        };
        /**
         * Called when the `change` event is fired on `NetworkInformation`.
         * @see https://developer.mozilla.org/en-US/docs/Web/API/NetworkInformation#Event_handlers
         */
        this.handleConnectionChange = function (e) {
            _this._navigator = window.navigator;
            // @ts-ignore
            DeviceManager.connection = _this._navigator.connection || _this._navigator.mozConnection || _this._navigator.webkitConnection;
        };
        /**
         * Called when the `mouseover` event is fired on the body.
         * Sets a status class confirming that the user is using a pointer device (mouse).
         */
        this.handleMouseEvent = function (e) {
            _this._body.removeEventListener('mouseover', _this.handleMouseEvent);
            _this._html.classList.add('is-pointer-device');
            _this._html.classList.remove('is-not-pointer-device');
            if (_this._isDebug) {
                console.log('%c[Device Manager] ' + "%cUser is using a pointer device", 'color:#35ffb8', 'color:#eee');
            }
        };
        /**
         * Called when the `touchstart` event is fired on the body.
         * Sets a status class confirming that the user is using touch input.
         */
        this.handleTouchEvent = function (e) {
            _this._body.removeEventListener('touchstart', _this.handleTouchEvent);
            _this._html.classList.add('has-touched');
            if (_this._isDebug) {
                console.log('%c[Device Manager] ' + "%cUser has touched their device", 'color:#35ffb8', 'color:#eee');
            }
        };
        this._isDebug = (debug) ? debug : false;
        this._html = document.documentElement;
        this._body = document.body;
        this._navigator = window.navigator;
        // @ts-ignore
        DeviceManager.connection = this._navigator.connection || this._navigator.mozConnection || this._navigator.webkitConnection;
        DeviceManager.connection.addEventListener('change', this.handleConnectionChange);
        if (setStatusClasses) {
            this.setStatusClasses();
        }
        this._trackedElements = [];
        this.getTouchElements();
    }
    /**
     * Called when the page has changed and `DeviceManager` needs to handle the new/old touch tracked elements.
     */
    DeviceManager.prototype.reinit = function () {
        this.purgeTouchElements();
        this.getTouchElements();
    };
    /**
     * Get all the elements that require touch tracking if they're not already tracked.
     */
    DeviceManager.prototype.getTouchElements = function () {
        var _this = this;
        // Do nothing on non-touch devices
        if (!DeviceManager.supportsTouch) {
            return;
        }
        // Create an array of elements with the `.js-touch` class if they're not already tracked
        var elements = Array.from(document.body.querySelectorAll('.js-touch:not([data-touch-tracked="true"])'));
        elements.forEach(function (el) {
            // Sets tracking attribute
            el.setAttribute('data-touch-tracked', 'true');
            // Sets event listeners
            el.addEventListener('touchstart', _this.userTouchedElement);
            el.addEventListener('touchend', _this.userReleasedTouchedElement);
            el.addEventListener('touchleave', _this.userReleasedTouchedElement);
            el.addEventListener('touchcancel', _this.userReleasedTouchedElement);
            // Places element in the arrray
            _this._trackedElements.push(el);
        });
    };
    /**
     * Grabs all the current touch elements and removes any that are missing in the DOM.
     */
    DeviceManager.prototype.purgeTouchElements = function () {
        // Do nothing on non-touch devices
        if (!DeviceManager.supportsTouch) {
            return;
        }
        // Check if there are elements to check
        if (this._trackedElements.length === 0) {
            return;
        }
        var currentElements = Array.from(document.body.querySelectorAll('.js-touch'));
        var deadElements = [];
        // Loop through all tracked touch elements
        for (var i = 0; i < this._trackedElements.length; i++) {
            var survived = false;
            // Compare aginst all current touch elements
            for (var k = 0; k < currentElements.length; k++) {
                if (this._trackedElements[i] === currentElements[k]) {
                    survived = true;
                }
            }
            // Prepare dead elements for the purge
            if (!survived) {
                deadElements.push(this._trackedElements[i]);
            }
        }
        // Verify we have elements to remove
        if (deadElements.length !== 0) {
            // Loop though all the elements we need to remove
            for (var k = 0; k < deadElements.length; k++) {
                // Loop through all the current elements
                for (var i = 0; i < this._trackedElements.length; i++) {
                    // Check if the current element matches the element marked for death
                    if (this._trackedElements[i] === deadElements[i]) {
                        // Remove event listeners
                        deadElements[i].removeEventListener('touchstart', this.userTouchedElement);
                        deadElements[i].removeEventListener('touchend', this.userReleasedTouchedElement);
                        deadElements[i].removeEventListener('touchleave', this.userReleasedTouchedElement);
                        deadElements[i].removeEventListener('touchcancel', this.userReleasedTouchedElement);
                        // Get the elements index
                        var index = this._trackedElements.indexOf(this._trackedElements[i]);
                        // Splice the array at the index and shift the remaining elements
                        this._trackedElements.splice(index, 1);
                    }
                }
            }
        }
    };
    /**
     * Sets custom status classes on the HTML Document.
     */
    DeviceManager.prototype.setStatusClasses = function () {
        this._html.classList.add('has-js');
        this._html.classList.remove('has-no-js');
        if (this._isDebug) {
            console.log('%c[Device Manager] ' + "%cSetting status classes", 'color:#35ffb8', 'color:#eee');
        }
        // Listen for basic device event types
        this._body.addEventListener('mouseover', this.handleMouseEvent);
        this._body.addEventListener('touchstart', this.handleTouchEvent);
        // Set a status class if the device supports touch
        if (DeviceManager.supportsTouch) {
            this._html.classList.add('is-touch-device');
            this._html.classList.remove('is-not-touch-device');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cSupports Touch: %c" + DeviceManager.supportsTouch), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
        // Sets a status class if the browser is using the Blink engine
        if (DeviceManager.isBlinkEngine) {
            this._html.classList.add('is-blink');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cUsing Blink Engine: %c" + DeviceManager.isBlinkEngine), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
        // Sets a status class if the browser is Chrome
        if (DeviceManager.isChrome) {
            this._html.classList.add('is-chrome');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cChrome: %c" + DeviceManager.isChrome), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
        // Sets a status class if the browser is IE 11
        if (DeviceManager.isIE) {
            this._html.classList.add('is-ie');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cInternet Explorer: %c" + DeviceManager.isIE), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
        // Sets a status class if the browser is Edge
        if (DeviceManager.isEdge) {
            this._html.classList.add('is-edge');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cEdge: %c" + DeviceManager.isEdge), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
        // Sets a status class if the browser is Firefox
        if (DeviceManager.isFirefox) {
            this._html.classList.add('is-firefox');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cFirefox: %c" + DeviceManager.isFirefox), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
        // Sets a status class if the browser is Safari
        if (DeviceManager.isSafari) {
            this._html.classList.add('is-safari');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cSafari: %c" + DeviceManager.isSafari), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
        // Sets a status class if the browser is Opera
        if (DeviceManager.isOpera) {
            this._html.classList.add('is-opera');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cOpera: %c" + DeviceManager.isOpera), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
        // Sets a status class if the device's connection type is known
        if (DeviceManager.connection !== undefined) {
            this._html.classList.add("is-" + DeviceManager.connection.effectiveType);
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cConnection Type: %c" + DeviceManager.connection.effectiveType), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
    };
    DeviceManager.connection = undefined;
    /**
     * Checks if the browser is Chrome 1 - 71.
     * @returns `boolean`
     */
    DeviceManager.isChrome = (function () {
        var isChrome = false;
        // @ts-ignore
        if (!!window.chrome && (window.StyleMedia === undefined)) {
            isChrome = true;
        }
        return isChrome;
    })();
    /**
     * Checks if the browser is Edge 20+.
     * @returns `boolean`
     */
    DeviceManager.isEdge = (function () {
        var isEdge = false;
        // @ts-ignore
        if (!!window.StyleMedia && !!window.chrome) {
            isEdge = true;
        }
        return isEdge;
    })();
    /**
     * Checks if the browser is Internet Explorer 6 - 11.
     * @returns `boolean`
     */
    DeviceManager.isIE = (function () {
        var isIE = false;
        // @ts-ignore
        if (!!window.MSInputMethodContext && !!document.documentMode && (window.chrome === undefined)) {
            isIE = true;
        }
        return isIE;
    })();
    /**
     * Checks if the browser is Firefox 1+.
     * @returns `boolean`
     */
    DeviceManager.isFirefox = (function () {
        var isFirefox = false;
        // @ts-ignore
        if (typeof InstallTrigger !== 'undefined') {
            isFirefox = true;
        }
        return isFirefox;
    })();
    /**
     * Checks if the browser is Safari 3+.
     * @returns `boolean`
     */
    DeviceManager.isSafari = (function () {
        var isSafari = false;
        // @ts-ignore
        if (/constructor/i.test(window.HTMLElement) || (function (p) { return p.toString() === "[object SafariRemoteNotification]"; })(!window['safari'] || (typeof safari !== 'undefined' && safari.pushNotification))) {
            isSafari = true;
        }
        return isSafari;
    })();
    /**
     * Checks if the browser is Opera 8+.
     * @returns `boolean`
     */
    DeviceManager.isOpera = (function () {
        var isOpera = false;
        // @ts-ignore
        if ((!!window.opr && !!opr.addons) || !!window.opera || navigator.userAgent.indexOf(' OPR/') >= 0) {
            isOpera = true;
        }
        return isOpera;
    })();
    /**
     * Checks if the browser is using the Blink Engine.
     * @see https://en.wikipedia.org/wiki/Blink_(browser_engine)
     * @returns `boolean`
     */
    DeviceManager.isBlinkEngine = (function () {
        var isBlink = false;
        // @ts-ignore
        if ((DeviceManager.isChrome || DeviceManager.isOpera) && !!window.CSS) {
            isBlink = true;
        }
        return isBlink;
    })();
    /**
     * Checks if the browser supports touch input.
     * @returns `boolean`
     */
    DeviceManager.supportsTouch = (function () {
        var isTouchSupported = false;
        if (('ontouchstart' in window) || (navigator.maxTouchPoints > 0) || (navigator.msMaxTouchPoints > 0)) {
            isTouchSupported = true;
        }
        return isTouchSupported;
    })();
    return DeviceManager;
}());
exports.default = DeviceManager;
//# sourceMappingURL=DeviceManager.js.map

/***/ }),
/* 15 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

Object.defineProperty(exports, "__esModule", { value: true });
var DeviceManager = /** @class */ (function () {
    function DeviceManager(debug, setStatusClasses) {
        var _this = this;
        /**
         * Called when the `touchstart` event fires on an element that has a `js-touch` class.
         */
        this.userTouchedElement = function (e) {
            var target = e.currentTarget;
            target.setAttribute('data-touching', "true");
        };
        /**
         * Called when the `touchend` or `touchcancel` or `touchleave` event(s) fire on
         * an element with the `js-touch` class.
         */
        this.userReleasedTouchedElement = function (e) {
            var target = e.currentTarget;
            target.setAttribute('data-touching', "false");
        };
        /**
         * Called when the `mouseover` event is fired on the body.
         * Sets a status class confirming that the user is using a pointer device (mouse).
         */
        this.handleMouseEvent = function (e) {
            _this._body.removeEventListener('mouseover', _this.handleMouseEvent);
            _this._html.classList.add('is-pointer-device');
            _this._html.classList.remove('is-not-pointer-device');
            if (_this._isDebug) {
                console.log('%c[Device Manager] ' + "%cUser is using a pointer device", 'color:#35ffb8', 'color:#eee');
            }
        };
        /**
         * Called when the `touchstart` event is fired on the body.
         * Sets a status class confirming that the user is using touch input.
         */
        this.handleTouchEvent = function (e) {
            _this._body.removeEventListener('touchstart', _this.handleTouchEvent);
            _this._html.classList.add('has-touched');
            if (_this._isDebug) {
                console.log('%c[Device Manager] ' + "%cUser has touched their device", 'color:#35ffb8', 'color:#eee');
            }
        };
        this._isDebug = (debug) ? debug : false;
        this._html = document.documentElement;
        this._body = document.body;
        if (setStatusClasses) {
            this.setStatusClasses();
        }
        this._trackedElements = [];
        this.getTouchElements();
    }
    /**
     * Called when the page has changed and `DeviceManager` needs to handle the new/old touch tracked elements.
     */
    DeviceManager.prototype.reinit = function () {
        this.purgeTouchElements();
        this.getTouchElements();
    };
    /**
     * Get all the elements that require touch tracking if they're not already tracked.
     */
    DeviceManager.prototype.getTouchElements = function () {
        var _this = this;
        // Do nothing on non-touch devices
        if (!DeviceManager.supportsTouch) {
            return;
        }
        // Create an array of elements with the `.js-touch` class if they're not already tracked
        var elements = Array.from(document.body.querySelectorAll('.js-touch:not([data-touch-tracked="true"])'));
        elements.forEach(function (el) {
            // Sets tracking attribute
            el.setAttribute('data-touch-tracked', 'true');
            // Sets event listeners
            el.addEventListener('touchstart', _this.userTouchedElement);
            el.addEventListener('touchend', _this.userReleasedTouchedElement);
            el.addEventListener('touchleave', _this.userReleasedTouchedElement);
            el.addEventListener('touchcancel', _this.userReleasedTouchedElement);
            // Places element in the arrray
            _this._trackedElements.push(el);
        });
    };
    /**
     * Grabs all the current touch elements and removes any that are missing in the DOM.
     */
    DeviceManager.prototype.purgeTouchElements = function () {
        // Do nothing on non-touch devices
        if (!DeviceManager.supportsTouch) {
            return;
        }
        // Check if there are elements to check
        if (this._trackedElements.length === 0) {
            return;
        }
        var currentElements = Array.from(document.body.querySelectorAll('.js-touch'));
        var deadElements = [];
        // Loop through all tracked touch elements
        for (var i = 0; i < this._trackedElements.length; i++) {
            var survived = false;
            // Compare aginst all current touch elements
            for (var k = 0; k < currentElements.length; k++) {
                if (this._trackedElements[i] === currentElements[k]) {
                    survived = true;
                }
            }
            // Prepare dead elements for the purge
            if (!survived) {
                deadElements.push(this._trackedElements[i]);
            }
        }
        // Verify we have elements to remove
        if (deadElements.length !== 0) {
            // Loop though all the elements we need to remove
            for (var k = 0; k < deadElements.length; k++) {
                // Loop through all the current elements
                for (var i = 0; i < this._trackedElements.length; i++) {
                    // Check if the current element matches the element marked for death
                    if (this._trackedElements[i] === deadElements[i]) {
                        // Remove event listeners
                        deadElements[i].removeEventListener('touchstart', this.userTouchedElement);
                        deadElements[i].removeEventListener('touchend', this.userReleasedTouchedElement);
                        deadElements[i].removeEventListener('touchleave', this.userReleasedTouchedElement);
                        deadElements[i].removeEventListener('touchcancel', this.userReleasedTouchedElement);
                        // Get the elements index
                        var index = this._trackedElements.indexOf(this._trackedElements[i]);
                        // Splice the array at the index and shift the remaining elements
                        this._trackedElements.splice(index, 1);
                    }
                }
            }
        }
    };
    /**
     * Sets custom status classes on the HTML Document.
     */
    DeviceManager.prototype.setStatusClasses = function () {
        this._html.classList.add('has-js');
        this._html.classList.remove('has-no-js');
        if (this._isDebug) {
            console.log('%c[Device Manager] ' + "%cSetting status classes", 'color:#35ffb8', 'color:#eee');
        }
        // Listen for basic device event types
        this._body.addEventListener('mouseover', this.handleMouseEvent);
        this._body.addEventListener('touchstart', this.handleTouchEvent);
        // Set a status class if the device supports touch
        if (DeviceManager.supportsTouch) {
            this._html.classList.add('is-touch-device');
            this._html.classList.remove('is-not-touch-device');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cSupports Touch: %c" + DeviceManager.supportsTouch), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
        // Sets a status class if the browser is using the Blink engine
        if (DeviceManager.isBlinkEngine) {
            this._html.classList.add('is-blink');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cUsing Blink Engine: %c" + DeviceManager.isBlinkEngine), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
        // Sets a status class if the browser is Chrome
        if (DeviceManager.isChrome) {
            this._html.classList.add('is-chrome');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cChrome: %c" + DeviceManager.isChrome), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
        // Sets a status class if the browser is IE 11
        if (DeviceManager.isIE) {
            this._html.classList.add('is-ie');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cInternet Explorer: %c" + DeviceManager.isIE), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
        // Sets a status class if the browser is Edge
        if (DeviceManager.isEdge) {
            this._html.classList.add('is-edge');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cEdge: %c" + DeviceManager.isEdge), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
        // Sets a status class if the browser is Firefox
        if (DeviceManager.isFirefox) {
            this._html.classList.add('is-firefox');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cFirefox: %c" + DeviceManager.isFirefox), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
        // Sets a status class if the browser is Safari
        if (DeviceManager.isSafari) {
            this._html.classList.add('is-safari');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cSafari: %c" + DeviceManager.isSafari), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
        // Sets a status class if the browser is Opera
        if (DeviceManager.isOpera) {
            this._html.classList.add('is-opera');
            if (this._isDebug) {
                console.log('%c[Device Manager] ' + ("%cOpera: %c" + DeviceManager.isOpera), 'color:#35ffb8', 'color:#eee', 'color:#68e5ff');
            }
        }
    };
    /**
     * Checks if the browser is Chrome 1 - 71.
     * @returns `boolean`
     */
    DeviceManager.isChrome = (function () {
        var isChrome = false;
        // @ts-ignore
        if (!!window.chrome && (window.StyleMedia === undefined)) {
            isChrome = true;
        }
        return isChrome;
    })();
    /**
     * Checks if the browser is Edge 20+.
     * @returns `boolean`
     */
    DeviceManager.isEdge = (function () {
        var isEdge = false;
        // @ts-ignore
        if (!!window.StyleMedia && !!window.chrome) {
            isEdge = true;
        }
        return isEdge;
    })();
    /**
     * Checks if the browser is Internet Explorer 6 - 11.
     * @returns `boolean`
     */
    DeviceManager.isIE = (function () {
        var isIE = false;
        // @ts-ignore
        if (!!window.MSInputMethodContext && !!document.documentMode && (window.chrome === undefined)) {
            isIE = true;
        }
        return isIE;
    })();
    /**
     * Checks if the browser is Firefox 1+.
     * @returns `boolean`
     */
    DeviceManager.isFirefox = (function () {
        var isFirefox = false;
        // @ts-ignore
        if (typeof InstallTrigger !== 'undefined') {
            isFirefox = true;
        }
        return isFirefox;
    })();
    /**
     * Checks if the browser is Safari 3+.
     * @returns `boolean`
     */
    DeviceManager.isSafari = (function () {
        var isSafari = false;
        // @ts-ignore
        if (/constructor/i.test(window.HTMLElement) || (function (p) { return p.toString() === "[object SafariRemoteNotification]"; })(!window['safari'] || (typeof safari !== 'undefined' && safari.pushNotification))) {
            isSafari = true;
        }
        return isSafari;
    })();
    /**
     * Checks if the browser is Opera 8+.
     * @returns `boolean`
     */
    DeviceManager.isOpera = (function () {
        var isOpera = false;
        // @ts-ignore
        if ((!!window.opr && !!opr.addons) || !!window.opera || navigator.userAgent.indexOf(' OPR/') >= 0) {
            isOpera = true;
        }
        return isOpera;
    })();
    /**
     * Checks if the browser is using the Blink Engine.
     * @see https://en.wikipedia.org/wiki/Blink_(browser_engine)
     * @returns `boolean`
     */
    DeviceManager.isBlinkEngine = (function () {
        var isBlink = false;
        // @ts-ignore
        if ((DeviceManager.isChrome || DeviceManager.isOpera) && !!window.CSS) {
            isBlink = true;
        }
        return isBlink;
    })();
    /**
     * Checks if the browser supports touch input.
     * @returns `boolean`
     */
    DeviceManager.supportsTouch = (function () {
        var isTouchSupported = false;
        if (('ontouchstart' in window) || (navigator.maxTouchPoints > 0) || (navigator.msMaxTouchPoints > 0)) {
            isTouchSupported = true;
        }
        return isTouchSupported;
    })();
    return DeviceManager;
}());
exports.default = DeviceManager;
//# sourceMappingURL=DeviceManager.js.map

/***/ })
]]);
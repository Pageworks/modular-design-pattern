import Env from './Env';
var App = (function () {
    function App() {
        var _this = this;
        this.handlePageLoad = function () {
            _this.reinit();
        };
        this._deviceManager = null;
        this.init();
    }
    App.prototype.init = function () {
        new Env();
        document.addEventListener('pjax:complete', this.handlePageLoad);
    };
    App.prototype.reinit = function () {
        if (this._deviceManager !== null) {
            this._deviceManager.reinit();
        }
    };
    return App;
}());
(function () {
    new App();
})();

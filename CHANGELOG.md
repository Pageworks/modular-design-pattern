# 0.0.2 - 2019-03-27

### Adds

- Adds: `Env` class sets the `isDebug` status if the `window.location.hostname` contains `.local`
- Adds: `Env` class checks for a `debug` attribute on the `document`
- Adds: `App` class inits the `Env` class
- Adds: `App` class adds the `pjax:complete` event listener to the `document`
- Adds: `App` class calls it's public `reinit()` method when Pjax fires the `pjax:complete` event

### Fixes

- Fixes: moves transition CSS into a `<style>` tag in the `<head>` since it's critical CSS

# 0.0.1 - 2019-03-26

### Adds

- Adds: initial clone of [papertrain](https://github.com/Pageworks/papertrain)

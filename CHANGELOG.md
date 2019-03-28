# 0.0.1 - 2019-03-30

### Adds

- Adds: initial clone of [papertrain](https://github.com/Pageworks/papertrain)
- Adds: `Env` class sets the `isDebug` status if the `window.location.hostname` contains `.local`
- Adds: `Env` class checks for a `debug` attribute on the `document`
- Adds: `App` class inits the `Env` class
- Adds: `App` class adds the `pjax:complete` event listener to the `document`
- Adds: `App` class calls it's public `reinit()` method when Pjax fires the `pjax:complete` event
- Adds: `manifest.json` to the `public` directory
- Adds: [DeviceManager](https://github.com/codewithkyle/device-manager)

### Fixes

- Fixes: moves transition CSS into a `<style>` tag in the `<head>` since it's critical CSS
- Fixes: updates `base.twig` to use modern tags in the `<head>` so websites follow the new PWA standards

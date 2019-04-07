# 0.0.3 - 2019-04-07

### Adds

- Adds: reworks base SASS structure
- Adds: splits SASS imports into seperate files
- Adds: splits `main.css` into several smaller files
- Adds: `BaseModule` class
- Adds: generic `Header` component
- Adds: components dynamically add themselves to the global `modules` object

### Removes

- Removes: purges old objects/components SCSS files

# 0.0.2 - 2019-04-01

### Adds

- Adds: begins testing using Crafts `view.registerJsFile` as a dynamic module loader
- Adds: `components` and `objects` folder to the `templates` directory
- Adds: basic file structure for a new `component` or `object`
- Adds: webpack bundles everything into seperate files within the `public/assets` directory

### Removes

- Removes: webpack and webpack-cli

# 0.0.1 - 2019-03-30

### Adds

- Adds: initial (partial) clone of [papertrain](https://github.com/Pageworks/papertrain)
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

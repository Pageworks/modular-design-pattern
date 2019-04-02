const path = require('path');
const glob = require("glob");

let entries = {
    app: './_compiled/app/script/App.js'
};

// Components
const components = glob.sync('./_compiled/templates/components/**/*.js');
for(let i = 0; i < components.length; i++){
    const name = components[i].match(/[ \w-]+?(?=\.)/)[0];
    entries[name] = components[i];
}

// Objects
const objects = glob.sync('./_compiled/templates/objects/**/*.js');
for(let i = 0; i < objects.length; i++){
    const name = objects[i].match(/[ \w-]+?(?=\.)/)[0];
    entries[name] = objects[i];
}

module.exports = {
    mode: 'none',
    entry: entries,
    output: {
        filename: '[name].js',
        path: path.resolve(__dirname, './public/assets/scripts')
    },
    optimization: {
        runtimeChunk: 'single',
        splitChunks: {
          chunks: 'all',
          name: 'globals',
          maxInitialRequests: Infinity,
          minSize: 0,
          cacheGroups: {
            vendor: {
              test: /[\\/]node_modules[\\/]/,
              name(module) {
                // get the name. E.g. node_modules/packageName/not/this/part.js
                // or node_modules/packageName
                const packageName = module.context.match(/[\\/]node_modules[\\/](.*?)([\\/]|$)/)[1];

                // npm package names are URL-safe, but some servers don't like @ symbols
                return `npm.${packageName.replace('@', '')}`;
              },
            },
          },
        },
    }
};

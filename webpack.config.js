const FriendlyErrorsWebpackPlugin = require('friendly-errors-webpack-plugin');
const path = require('path');
const glob = require('glob');

module.exports = {
    mode:  process.env.NODE_ENV === 'production' ? "production" : "none",
    optimization: {
        removeAvailableModules: false,
        removeEmptyChunks: false
    },
    resolve: {
        extensions: ['.js']
    },
    entry: glob.sync("./public/assets/templates/**/*.js"),
    output: {
        path: path.resolve(__dirname, "public/assets/templates"),
        filename: '[name].js',
        pathinfo: false
    },
    plugins: [
        new FriendlyErrorsWebpackPlugin()
    ]
  };

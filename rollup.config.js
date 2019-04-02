export default {
    input: ['./public/assets/app/script/App.js', './public/assets/app/script/Env.js'],
    output: [
      // ES module version, for modern browsers
      {
        dir: "./public/assets/app/script",
        format: "es",
        sourcemap: true
      },
      // SystemJS version, for older browsers
      {
        dir: "public/nomodule",
        format: "system",
        sourcemap: true
      }
    ]
  };

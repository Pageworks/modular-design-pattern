export default[
    {
        input: './public/assets/app/script/App.js',
        output: [
          // ES module version, for modern browsers
          {
            dir: "./public/assets/app/script",
            format: "esm",
            sourcemap: true
          }
        ]
    },
    {
        input:[ './public/assets/templates/components/object1/object1.js'],
        output: [
          // ES module version, for modern browsers
          {
            dir: "./public/assets/templates/components/object1",
            format: "esm",
            sourcemap: true
          }
        ]
    }
];

const sass = require('node-sass');
const glob = require("glob");
const fs = require('fs');
const rimraf = require("rimraf");

// Get all the base SCSS files from the base global scss directory
const globalFiles = glob.sync('./global/sass/*.scss');

// Get all the SCSS files from the templates directory
const templateFiles = glob.sync('./templates/**/*.scss');

// Concat the arrays
const files = [...globalFiles, ...templateFiles];

if(fs.existsSync('./public/assets/styles')){
    rimraf.sync('./public/assets/styles');
}

fs.mkdirSync('./public/assets/styles');

// Create a timestamp for cache busting
const timestamp = Date.now().toString().match(/.{8}$/g)[0];

// Write the timestamp to Crafts general config file
var data = fs.readFileSync('./config/general.php', 'utf-8');
var newValue = data.replace(/'cssCacheBustTimestamp'.*/g, "'cssCacheBustTimestamp' => '"+ timestamp +"',");
fs.writeFileSync('./config/general.php', newValue, 'utf-8');

// Generate the files
files.forEach((file)=>{
    sass.render(
        {
            file: file,
            outputStyle: 'compressed',
            includePaths: ['./global/sass/settings', './global/sass/tools']
        },
        function(error, result){
            if (error) {
                console.log(error);
            }else{
                const fileName = result.stats.entry.match(/[ \w-]+?(?=\.)/gi)[0];
                if(fileName){
                    const newFile = './public/assets/styles/' + fileName + '.' + timestamp + '.css';
                    fs.writeFile(newFile, result.css.toString(), function (err) {
                        if(err){ throw err };
                    });
                }else{
                    console.log('Something went wrong with the file name of ' + result.stats.entry);
                }
            }
        }
    );
});

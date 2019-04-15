const watch = require('watch');
const sass = require('node-sass');
const glob = require("glob");
const fs = require('fs');
const rimraf = require("rimraf");
const chalk = require('chalk');
const ora = require('ora');

if(process.env.NODE_ENV === 'watch'){
    console.log('Watching for SASS changes');
    let initial = true
    watch.watchTree('../', (file, curr, prev)=>{

        if(!initial){
            const fileName = file.match(/\.([^.]*?)(?=\?|#|$)/gi)[0];
            if(fileName.toLowerCase() === '.scss'){
                compileSASS();
            }
        }

        if(initial){
            initial = false;
        }
    });
}else{
    compileSASS();
}

function compileSASS(){
    console.log(chalk.white('Compiling SASS'));

    // Get all the base SCSS files from the base global scss directory
    const globalFiles = glob.sync('./global/sass/*.scss');

    // Get all the SCSS files from the templates directory
    const templateFiles = glob.sync('./templates/**/*.scss');

    const globalObjects = glob.sync('./global/sass/objects/*.scss');

    // Concat the arrays
    const files = [...globalFiles, ...templateFiles, ...globalObjects];

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
                        console.log(chalk.hex('#ffffff').bold(file), chalk.hex('#8cf57b').bold(' [compiled]'));
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
}

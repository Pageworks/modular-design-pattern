const sass = require('node-sass');
const glob = require("glob");
const fs = require('fs');

// Get all the SCSS files from the templates directory
const templateFiles = glob.sync('./templates/**/*.scss');

// Get all the base SCSS files from the base global scss directory
const globalFiles = glob.sync('./global/sass/*.scss');

// Concat the arrays
const files = [...globalFiles, ...templateFiles];

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
                    const newFile = './public/assets/styles/' + fileName + '.css';
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

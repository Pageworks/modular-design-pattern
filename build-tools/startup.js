const fs = require('fs');
const ora = require('ora');

const readme = ora();
readme.spinner = 'dots';
readme.text = 'Removing readme file';
readme.start();
if(fs.existsSync('./README.md')){
    fs.unlink('./README.md', (err)=>{
        if(err){
            readme.text = 'Failed to remove the readme file';
            readme.fail();
        }
        readme.text = 'Readme has been removed';
        readme.succeed();
    });
}

const changelog = ora();
changelog.spinner = 'dots';
changelog.text = 'Removing changelog file';
changelog.start();
if(fs.existsSync('./CHANGELOG.md')){
    fs.unlink('./CHANGELOG.md', (err)=>{
        if(err){
            changelog.text = 'Failed to remove the changelog file';
            changelog.fail();
        }
        changelog.text = 'Changelog has been removed';
        changelog.succeed();
    });
}

const license = ora();
license.spinner = 'dots';
license.text = 'Removing license file';
license.start();
if(fs.existsSync('./LICENSE')){
    fs.unlink('./LICENSE', (err)=>{
        if(err){
            license.text = 'Failed to remove the license file';
            license.fail();
        }
        license.text = 'License has been removed';
        license.succeed();
    });
}

const gitignore = ora();
gitignore.spinner = 'dots';
gitignore.text = 'Removing license file';
gitignore.start();
if(fs.existsSync('./.gitignore')){
    var data = fs.readFile('./.gitignore', 'utf-8', (err, file)=>{
        if(err){
            gitignore.text = 'Failed to open the gitignore file';
            gitignore.fail();
            throw err;
        }
        
        var newValue = file.replace(/vendor/g, '');
        fs.writeFile('./.gitignore', newValue, 'utf-8', (err)=>{
            gitignore.text = 'Vendors directory has been removed from the gitignore file';
            gitignore.succeed();
        });
    });
}
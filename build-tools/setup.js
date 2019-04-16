const fs = require('fs');
const ora = require('ora');
const clear = require('clear');
const figlet = require('figlet');
const chalk = require('chalk');

const questions = require('./startup-questions');
const projectDetails = {};

clear();
figlet.text('The Box', {
    kerning: 'full'
}, (err, data)=>{
    console.log(chalk.blue('----------------------------------------'));
    console.log(chalk.cyan(data));
    console.log(chalk.blue('----------------------------------------'));
    askQuestions();
});

askQuestions = (async ()=>{
    const question1 = await questions.getProjectDetails();
    projectDetails.projectName = question1.projectName;

    const question2 = await questions.getProjectURL(projectDetails.projectName);
    projectDetails.devUrl = `${ question2.defaultUrl }`;

    const question3 = await questions.getDatabaseDetails(projectDetails.projectName);
    projectDetails.driver = question3.driver;
    projectDetails.serverIp = question3.serverIp;
    projectDetails.user = question3.user;
    projectDetails.password = question3.password;
    projectDetails.port = question3.port;
    projectDetails.database = question3.database;

    const envGenSpinner = ora();
    envGenSpinner.spinner = 'dots';
    envGenSpinner.text = 'Generating enviroment file';
    envGenSpinner.start();

    if(fs.existsSync('.env')){
        envGenSpinner.text = 'The enviroment file already exists';
        envGenSpinner.fail();
    }else{
        fs.copyFile('.env.example', '.env', (err)=>{
            if(err){
                envGenSpinner.text = 'Failed to generate enviroment file';
                envGenSpinner.fail();
            }

            fs.readFile('.env', 'utf-8', (err, file)=>{
                if(err){
                    envGenSpinner.text = 'Failed to open the enviroment file';
                    envGenSpinner.fail();
                }

                let modifiedFile = file.replace(/SECURITY_KEY=""/, 'SECURITY_KEY="supersecurekey123"');
                modifiedFile = modifiedFile.replace(/DB_DRIVER="mysql"/, `DB_DRIVER="${ projectDetails.driver }"`);
                modifiedFile = modifiedFile.replace(/DB_SERVER="localhost"/, `DB_SERVER="${ projectDetails.serverIp }"`);
                modifiedFile = modifiedFile.replace(/DB_USER="root"/, `DB_USER="${ projectDetails.user }"`);
                modifiedFile = modifiedFile.replace(/DB_PASSWORD=""/, `DB_PASSWORD="${ projectDetails.password }"`);
                modifiedFile = modifiedFile.replace(/DB_DATABASE=""/, `DB_DATABASE="${ projectDetails.database }"`);

                let port;
                if(projectDetails.driver === 'mysql' && projectDetails.port === ''){
                    port = 3306;
                }
                else if(projectDetails.driver === 'mysql' && projectDetails.port !== ''){
                    port = projectDetails.port;
                }
                else if(projectDetails.driver === 'pgsql' && projectDetails.port === ''){
                    port = 5432;
                }
                else if(projectDetails.driver === 'pgsql' && projectDetails.port !== ''){
                    port = projectDetails.port;
                }

                modifiedFile = modifiedFile.replace(/DB_PORT=""/, `DB_PORT="${ port }"`);
                modifiedFile = modifiedFile.replace(/DEV_URL=""/, `DEV_URL="http://${ projectDetails.devUrl }/"`);
                modifiedFile = modifiedFile.replace(/SYSTEM_NAME="REPLACE_ME"/, `SYSTEM_NAME="${ projectDetails.projectName }"`);
                modifiedFile = modifiedFile.replace(/SYSTEM_EMAIL_NAME="REPLACE_ME"/, `SYSTEM_EMAIL_NAME="${ projectDetails.projectName }"`);
                modifiedFile = modifiedFile.replace(/SYSTEM_EMAIL_ADDRESS="REPLACE_ME"/, `SYSTEM_EMAIL_ADDRESS="no-reply@${ projectDetails.devUrl }"`);

                fs.writeFile('.env', modifiedFile, (err)=>{
                    if(err){
                        envGenSpinner.text = 'Failed to save the enviroment file';
                        envGenSpinner.fail();
                    }

                    envGenSpinner.text = 'Enviroment file successfully created';
                    envGenSpinner.succeed();
                });
            });
        });
    }
});

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
}else{
    readme.stop();
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
}else{
    changelog.stop();
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
}else{
    license.stop();
}

const gitignore = ora();
gitignore.spinner = 'dots';
gitignore.text = 'Removing license file';
gitignore.start();
if(fs.existsSync('./.gitignore')){
    fs.readFile('./.gitignore', 'utf-8', (err, file)=>{
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
}else{
    gitignore.stop();
}

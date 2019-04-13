const fs = require('fs');

if(fs.existsSync('../README.md')){
    fs.unlink('../README.md', (err)=>{
        if(err){
            throw err;
        }
    });
}

if(fs.existsSync('../CHANGELOG.md')){
    fs.unlink('../CHANGELOG.md', (err)=>{
        if(err){
            throw err;
        }
    });
}

if(fs.existsSync('../LICENSE')){
    fs.unlink('../LICENSE', (err)=>{
        if(err){
            throw err;
        }
    });
}

if(fs.existsSync('../.gitignore')){
    var data = fs.readFileSync('../.gitignore', 'utf-8');
    var newValue = data.replace(/vendor/g, '');
    fs.writeFileSync('../.gitignore', newValue, 'utf-8');
}
const shell = require('shelljs');
const archiver = require('archiver');
const path = require('path');
const fs = require('fs');

const buildDirPath = path.join(__dirname, '.build');
const outputZipPath = path.join(__dirname, 'prestashop-theme-1.7.7.zip');
const loggerTag = '[ZIPPER]';


const clean = () => {
  shell.rm('-R', buildDirPath);
  console.info(`${loggerTag} CLEANED`);
}

const postinstall = () => {
  if (fs.existsSync(buildDirPath)) {
    if (fs.existsSync(outputZipPath)) shell.rm(outputZipPath);
  
    const output = fs.createWriteStream(outputZipPath);
    output.on('close', () => {
      console.info(`${loggerTag} Your archive is available here : ${outputZipPath}`);
      clean();
    });
  
    output.on('error', (e) => {
      console.error(`${loggerTag} ${e.message}`);
      clean();
    })
  
    const archive = archiver('zip');
  
    archive.pipe(output);
    archive.directory(buildDirPath, false);
    archive.finalize();
    return;  
  } 
  
  console.error(`${loggerTag} NO DIR TO ZIP`);
  clean();
}

console.info(`${loggerTag} BUILD YOUR FILES`);
shell.exec('webpack --env mode=zip', { silent: true });
postinstall();




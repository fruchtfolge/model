const fs = require('fs')
const child_process = require('child_process')
const os = require('os')
const path = require('path')
const {promisify} = require('util')

const readFile = promisify(fs.readFile)
const exec = promisify(child_process.exec)
const unlink = promisify(fs.unlink)
const writeFile = promisify(fs.writeFile)

async function asyncForEach(array, callback) {
  for (let index = 0; index < array.length; index++) {
    await callback(array[index], index, array) 
  }
}

readFile('fruchtfolge.gms','utf8')
  .then(async input => {
    let model = ''
    await asyncForEach(input.match(/[^\r\n]+/g), async line => {
      if (line.includes('$include ')) {
        const statement = line.split('$include ')
        const includePath = statement[1].replace('%WORKDIR%',__dirname + path.sep + '..' + path.sep).replace(/'/g,'').replace(/"/g,'')
        console.log(includePath);
        model += await readFile(includePath,'utf8')
      } else {
        model += line + '\n'
      }
    })
    const index = 'module.exports = ' + JSON.stringify(model)
    await writeFile('index.js', index)
  })
  .catch(e => {
    console.log(e)
  })

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
        model += await readFile(includePath,'utf8') + '\n'
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


/*
async function runGams(file,random) {
  try {
    const filePath = __dirname  + path.sep + '..' + path.sep + 'fruchtfolge.gms'
    const resultPath = __dirname + path.sep + '..' + path.sep
    
    let call
    if (os.platform() === 'win32') {
      call = `N:/soft/GAMS25.0/gams.exe ${filePath} lo=0 --WORKDIR="${__dirname + path.sep + '..' + path.sep}" dumpOpt=11`
    } else if (os.platform() === 'darwin') {
      call = `/Applications/GAMS25.1/sysdir/gams ${filePath} o=dev/null lo=0 --WORKDIR="${__dirname + path.sep + '..' + path.sep}" dumpOpt=11`
    }
    // call GAMS
    await exec(call)
  } catch (e) {
    // we expect the GAMS call to fail, because no include file is present
    if (!e.code === 2) {
      throw new Error(e)
    }
  }
}  

runGams()
  .then(async () => {
    const model = await readFile('fruchtfolge.dmp','utf8')
    const index = 'module.exports = ' + JSON.stringify(model)
    await writeFile('index.js', index)
    await unlink('fruchtfolge.dmp')
    await unlink('fruchtfolge.lst')
  })
  .catch(e => {
    console.log(e)
  })
*/

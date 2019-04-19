const fs = require('fs')
const path = require('path')
const child_process = require('child_process')
const os = require('os')
const {promisify} = require('util')
const assert = require('assert')

const readDir = promisify(fs.readdir)
const readFile = promisify(fs.readFile)
const exec = promisify(child_process.exec)
const unlink = promisify(fs.unlink)

async function asyncForEach(array, callback) {
  for (let index = 0; index < array.length; index++) {
    await callback(array[index], index, array) 
  }
}

async function runGams(file,fileBase) {
  try {
    const filePath = __dirname  + path.sep + 'test.gms'
    const resultPath = __dirname + path.sep + '..' + path.sep + 'tmp' + path.sep + fileBase + '.json'
    const listingPath = __dirname + path.sep + '..' + path.sep + 'tmp' + path.sep + fileBase + '.lst'
    
    let call
    if (os.platform() === 'win32') {
      call = `N:/soft/GAMS25.0/gams.exe ${filePath} o="${listingPath}" lo=0 --WORKDIR="${__dirname + path.sep + '..' + path.sep}" --FARM="${file}" --RANDOM="${resultPath}"`
    } else if (os.platform() === 'darwin') {
      call = `/Applications/GAMS25.1/sysdir/gams ${filePath} o="${listingPath}" lo=0 --WORKDIR="${__dirname + path.sep + '..' + path.sep}" --FARM="${file}" --RANDOM="${resultPath}"`
    } else {
  
    }
    // call GAMS
    await exec(call)
  } catch (e) {
    console.log(e)
  }
}  

async function testFarms() {
  files = await readDir('test/include')
  await asyncForEach(files, async (file) => {
    try {
      const fileBase = path.basename(file, '.gms')
      await runGams(file, fileBase)
      // check results
      const expected = await readFile('test/results/' + fileBase + '.json')
      const actual = await readFile('tmp/' + fileBase + '.json')
      assert.deepEqual(expected,actual)
      await unlink('tmp/' + fileBase + '.json')
      await unlink('tmp/' + fileBase + '.lst')
    } catch (e) {
      console.log(file)
      throw new Error(e)
    }
  })
}

// start test
testFarms()
  .then(() => {
    console.log('Done with no errors');
  })
  .catch(e => {
    console.log()
    console.log(e)
  })

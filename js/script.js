const fs = require('fs')

/*
const txt = fs.readFileSync('results.txt','utf-8')
var test  = txt.split(/\r?\n/g).map(str => {
  return str.split(/,/g)
})

function createObject(arr) {
  const obj = {}
  arr.forEach(el => {
    if (el.length === 2) {
      obj[el[0]] = el[1]
    } else if (el.length < 2) {
      return
    } else {
      var object = {};
      el.reduce(function(o, s) { if (!o[s]) return o[s] = {}; }, object);
      console.log(object);
    }
  })
  return obj
}
//console.log(createObject(test));
*/
var json = JSON.parse(fs.readFileSync('results.json','utf-8'))
function trimObj(obj) {
  if (!Array.isArray(obj) && typeof obj != 'object') return obj;
  return Object.keys(obj).reduce(function(acc, key) {
    acc[key.trim()] = typeof obj[key] == 'string'? obj[key].trim() : trimObj(obj[key]);
    return acc;
  }, Array.isArray(obj)? []:{});
}

const trunc = trimObj(json)

fs.writeFileSync('results.json', JSON.stringify(trunc), 'utf-8')

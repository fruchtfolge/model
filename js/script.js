const fs = require('fs')

var json = JSON.parse(fs.readFileSync('results.json','utf-8'))

// trim unncessary whitespace from object properties and values
function trimObj(obj) {
  if (!Array.isArray(obj) && typeof obj != 'object') return obj;
  return Object.keys(obj).reduce(function(acc, key) {
    acc[key.trim()] = typeof obj[key] == 'string'? obj[key].trim() : trimObj(obj[key]);
    return acc;
  }, Array.isArray(obj)? []:{});
}

var trunc = trimObj(json)

// reformat the recommendation object, so that recommendet crop is easier to find
Object.keys(trunc.recommendation).forEach(plot => {
  let selectCrop = ''
  Object.keys(trunc.recommendation[plot]).forEach(crop => {
    console.log(plot,crop);
    if (trunc.recommendation[plot][crop] > 0) selectCrop = crop
  })
  trunc.recommendation[plot] = selectCrop
})

fs.writeFileSync('results.json', JSON.stringify(trunc), 'utf-8')

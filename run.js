const fs = require('fs')
var token;

fs.readFile('./req', 'utf-8' , (err, data) => {
  if (err) {
    console.error(err)
    return
  }
  token = JSON.parse(data).token
  console.log("curl -X GET https://https.ghs.wiki:7002/API?type=signIn^&token="+token+" > req2")
})

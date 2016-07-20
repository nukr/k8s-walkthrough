var https = require('https')
var http = require('http')
var path = require('path')
var fs = require('fs')

var options = {
  key: fs.readFileSync(path.join(__dirname, '../tls/key.pem')),
  cert: fs.readFileSync(path.join(__dirname, '../tls/cert.pem'))
}

var https_server = https.createServer(options, function (req, res) {
  res.writeHead(200)
  res.end('Hello World\n')
})

var http_server = http.createServer(function (res, res) {
  res.writeHead(200)
  res.end('ok')
})

https_server.listen(3001, () => {
  console.log('https_server listening on port 3001')
})

http_server.listen(3000, () => {
  console.log('http_server listening on port 3000')
})

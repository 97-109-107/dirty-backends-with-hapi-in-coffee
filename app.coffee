Hapi = require("hapi")
Fs = require("fs")
server = new Hapi.Server()
server.connection
  port: 3000
  routes: cors: true

server.start ->
  console.log "Server running at:", server.info.uri
  return

server.route
  method: "GET"
  path: "/"
  handler: (request, reply) ->
    reply "Hello, world!"
    return

server.route
  method: "GET"
  path: "/api/disco"
  handler: (request, reply) ->
    jsonFileAsObject = JSON.parse(Fs.readFileSync("./sample.json", "utf8"))
    reply jsonFileAsObject

server.route
  method: "POST"
  path: "/api/testpost"
  handler: (request, reply) ->
    console.log request.payload
    reply request.payload
    return

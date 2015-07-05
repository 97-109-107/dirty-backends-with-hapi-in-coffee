Hapi = require("hapi")
server = new Hapi.Server()
server.connection port: 3000
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
    reply.file "./sample.json"

server.route
  method: "POST"
  path: "/api/testpost"
  handler: (request, reply) ->
    console.log request.payload
    reply request.payload
    return

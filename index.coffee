express = require("express")
app = express()

http = require("http").Server(app)
io = require('socket.io')(http)

app.use '/public', express.static __dirname + '/public'

app.get "/", (request, response) ->
  response.sendfile 'index.html'

io.on 'connection', (socket) ->
  console.log 'a user connected'

  socket.on 'chat message', (message) ->
    console.log 'received message: ' + message
    io.emit 'chat message', message

  socket.on 'disconnect', ->
    console.log 'user disconnected'

http.listen 3000, ->
  console.log "listening on *:3000"

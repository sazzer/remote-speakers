restify = require("restify")
url = require("url")

# Wrapper around the REST server
class RestServer
    # Construct the server
    # @param port The port to run the server on
    constructor: (@port) ->
        @server = restify.createServer({
            name: "RemoteSpeakers"
        })
        
    # Actually start the server
    start: () ->
        self = this
        @server.listen(@port, () ->
            parsedUrl = url.parse(self.server.url)
            self.port = parsedUrl.port
            console.log("Server %s listening at %s", self.server.name, parsedUrl.port)
        )

module.exports = RestServer

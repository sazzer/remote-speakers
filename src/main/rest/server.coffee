restify = require("restify")
url = require("url")
Q = require("q")

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
        deferred = Q.defer()
        self = this
        @server.listen(@port, () ->
            parsedUrl = url.parse(self.server.url)
            self.port = parsedUrl.port
            deferred.resolve(self.port)
        )
        return deferred.promise

module.exports = RestServer

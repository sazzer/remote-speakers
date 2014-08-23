var restify = require("restify"),
    url = require("url");

var server = restify.createServer({
    name: "RemoteSpeakers"
});

server.listen(0, function() {
    var parsedUrl = url.parse(server.url);
    console.log("Server %s listening at %s", server.name, parsedUrl.port);
});
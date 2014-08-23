var restify = require("restify"),
    url = require("url");

var port = process.env.PORT || 0;

var server = restify.createServer({
    name: "RemoteSpeakers"
});

server.listen(process.env.PORT, function() {
    var parsedUrl = url.parse(server.url);
    console.log("Server %s listening at %s", server.name, parsedUrl.port);
});
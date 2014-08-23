require("coffee-script/register");

var RestServer = require("./main/rest/server");
var port = process.env.PORT || 0;

var restServer = new RestServer(port);
restServer.start().then(function() {
    console.log("Server listening on port %s", restServer.port)
});

require("coffee-script/register");

var RestServer = require("./main/rest/server");
var port = process.env.PORT || 0;

var restServer = new RestServer(port);
restServer.start();

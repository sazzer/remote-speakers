ssdp = require("node-ssdp")
ip = require("ip")
Server = ssdp.Server

class SsdpServer
    constructor: (restPort) ->
        @server = new Server({
            logLevel: "INFO",
            location: "http://" + ip.address() + ":" + restPort
        })
        @server.addUSN('urn:grahamcox.co.uk:device:RemoteSpeakers:1');
        
    start: () ->
        @server.start()
        console.log("SSDP Server running");
        
        
module.exports = SsdpServer
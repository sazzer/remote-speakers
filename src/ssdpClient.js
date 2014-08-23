var Client = require('node-ssdp').Client,
    client = new Client(),
    util = require("util");

client.on('response', function (headers, statusCode, rinfo) {
  console.log('Got a response to an m-search: ' + util.inspect(rinfo) + ", " + util.inspect(headers));
});

client.search('urn:grahamcox.co.uk:device:RemoteSpeakers:1');

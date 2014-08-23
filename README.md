Remote Controlled Speakers
==========================

Design
------

### Speaker Software

Script running a RESTful API on a randomly selected port number. The script also acts as an SSDP server and announces itself on the local network using SSDP, allowing for the speaker software - and thus the RESTful API endpoint - to be discovered by anything else looking for it on the same network.

#### RESTful API

RESTful API has the following resources:

* GET /config - Gets the configuration document for the speaker. 
* GET /config/name - Gets the current name of the speaker.
* GET /config/streams - Gets the current collection of streams that the speaker knows about.
* GET /config/streams/[stream] - Gets the configuration of a specific stream that the speaker knows about.

* PUT /config/name - Changes the name of the speaker.
* PUT /config/streams/[stream] - Changes the configuration of a specific stream.
* DELETE /config/streams/[stream] - Deletes a specific stream.
* POST /config/streams - Creates a new stream.

* GET /playing - Gets the stream that is currently playing.
* PUT /playing - Changes the stream that is currently playing.
* DELETE /playing - Stops the stream that is currently playing without starting a new one.

#### Playing streams

Streams can be played by shelling out to the mpg123 program. This should be called with the "-@" parameter to play playlists, which is how Shoutcast streams are served up.

#### Implementation Details
Node.js can be used to implement all of this. 
The SSDP protocol is supported easily by the use of the node-ssdp module.
The shelling out to run mpg123 is supported easily by the use of the built in child_process module, using the spawn command.
The RESTful API can be supported by any number of modules. Restify is a simple solution that fits well.
Persistence can be supported by Nedb

### Client Software

Client software can be written for a large number of platforms, including webapps and Android/iOS devices. All that is needed is an application that can use SSDP to discover the speakers to work with, and then use the appropriate RESTful APIs to get the configuration in order to display the names of the speakers, to list the configured streams and to display/change the stream that is currently playing.

Golf Cart routing API
=====================

Using Graphhopper
-----------------

The [Graphhopper API](https://github.com/graphhopper/directions-api/blob/master/docs-routing.md) explains each parameters.

Here's an example with TheVillages routing API.

http://52.5.34.35:8888/route?point=28.938158,-82.007446&point=28.915922,-81.999893&vehicle=bike&locale=en-US&type=json&points_encoded=false

- sourcelat, sourcelng = **(point=28.938158,-82.007446)**
- destlat, destlng = **(point=28.915922,-81.999893)**

API Testing
-----------

[OSM Tasking Manager](http://tasks.osmcanada.ca/project/12)

- [Test 1 - Path behind Golf Course](http://52.5.34.35:8888/?point=28.939026%2C-81.964225&point=28.936848%2C-81.958013&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 2 - Parking lot](http://52.5.34.35:8888/?point=28.935562%2C-81.971344&point=28.934763%2C-81.971709&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 3 - Add more Parking aisle](http://52.5.34.35:8888/?point=28.843283%2C-82.021512&point=28.845397%2C-82.023861&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 4 - Crossing over Golf Course](http://52.5.34.35:8888/?point=28.938885%2C-81.957643&point=28.93751%2C-81.958131&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 5 - Decorative Shortcut Path](http://52.5.34.35:8888/?point=28.939176%2C-81.952541&point=28.93989%2C-81.951646&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 6 - Add Parking lot aisles](http://52.5.34.35:8888/?point=28.936524%2C-81.94435&point=28.937407%2C-81.943454&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
Build the API
-------------

All the files to build at latest Graphhopper build for the Golf cart routing can be found here:

https://github.com/osmottawa/Golf-Cart-Path

You would simply do the following Makefile commands.

```bash
$ git clone https://github.com/osmottawa/Golf-Cart-Path
$ cd Golf-Cart-Path
$ make init
$ make download
$ make setup
$ make start
```

This will initiate a new Graphhopper instance on port 8888.

All of the commands are based on an Ubuntu OS, so CentOS will have a few issues running this.

Amazon Server
-------------

We set up an Amazon Test Server dedicated for Graphhopper (http://52.5.34.35:8888/).

You should be able to log in using this Private Key.

```bash
$ sudo chmod 700 TheVillages.pem
$ ssh -i TheVillages.pem ubuntu@52.5.34.35
```

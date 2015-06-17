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

- [Test 1 (FIXED) - Path behind Golf Course](http://52.5.34.35:8888/?point=28.939026%2C-81.964225&point=28.936848%2C-81.958013&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 2 (FIXED) - Parking lot](http://52.5.34.35:8888/?point=28.935562%2C-81.971344&point=28.934763%2C-81.971709&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 3 (FIXED) - Add more Parking aisle](http://52.5.34.35:8888/?point=28.843283%2C-82.021512&point=28.845397%2C-82.023861&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 4 (FIXED) - Crossing over Golf Course](http://52.5.34.35:8888/?point=28.938885%2C-81.957643&point=28.93751%2C-81.958131&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 5 (FIXED) - Decorative Shortcut Path](http://52.5.34.35:8888/?point=28.939176%2C-81.952541&point=28.93989%2C-81.951646&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 6 (FIXED) - Add Parking lot aisles](http://52.5.34.35:8888/?point=28.936524%2C-81.94435&point=28.937407%2C-81.943454&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 7 - Store to Store (Parking)](http://52.5.34.35:8888/?point=28.939702%2C-81.945246&point=28.938561%2C-81.943932&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 8 - Bichara Boulevard allowed?](http://52.5.34.35:8888/?point=28.938975%2C-81.945176&point=28.936763%2C-81.942354&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 9 (FIXED) - Shay Boulevard allowed?](http://52.5.34.35:8888/?point=28.937979%2C-81.939796&point=28.93859%2C-81.939774&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 10 (FIXED) - Going to Bank](http://52.5.34.35:8888/?point=28.937162%2C-81.940295&point=28.937895%2C-81.939849&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 11 (FIXED) - Road behind building](http://52.5.34.35:8888/?point=28.937914%2C-81.941764&point=28.938651%2C-81.942827&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 12 (FIXED) - Shortcut threw Golf Course](http://52.5.34.35:8888/?point=28.931125%2C-81.917726&point=28.931266%2C-81.922147&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 13 (FIXED) - Add parking aisles](http://52.5.34.35:8888/?point=28.937022%2C-81.935778&point=28.937172%2C-81.933728&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 14 (FIXED) - Jeffrey Drive allowed?](http://52.5.34.35:8888/?point=28.937857%2C-81.933374&point=28.938463%2C-81.933342&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 15 (FIXED) - Shortcut threw Golfcourse parking](http://52.5.34.35:8888/?point=28.945209%2C-81.939447&point=28.946124%2C-81.940702&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 16 (FIXED) - Zip threw parking lot](http://52.5.34.35:8888/?point=28.953513%2C-81.941716&point=28.954104%2C-81.941389&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 17 (FIXED) - Country Club parking](http://52.5.34.35:8888/?point=28.950964%2C-81.946437&point=28.95149%2C-81.946657&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 18 (FIXED) - How to get to mall?](http://52.5.34.35:8888/?point=28.950654%2C-81.954736&point=28.951452%2C-81.957386&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 19 (FIXED) - Shortcut behind building](http://52.5.34.35:8888/?point=28.94811%2C-81.949591&point=28.948232%2C-81.951082&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 20 (FIXED) - Lets go in the Golf Club](http://52.5.34.35:8888/?point=28.96543%2C-81.960513&point=28.966735%2C-81.96113&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 21 (FIXED) - Missing residential Road](http://52.5.34.35:8888/?point=28.960995%2C-81.960792&point=28.960638%2C-81.962122&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 22 (FIXED) - Shortcut to Walmart](http://52.5.34.35:8888/?point=28.961248%2C-81.964654&point=28.962238%2C-81.962943&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 23 (FIXED) - Really rich farm house](http://52.5.34.35:8888/?point=28.956559%2C-81.957107&point=28.959394%2C-81.953239&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 24 (FIXED) - Back road shortcut](http://52.5.34.35:8888/?point=28.973845%2C-81.96091&point=28.973986%2C-81.962396&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 25 (FIXED) - Shortcut threw golf course](http://52.5.34.35:8888/?point=28.969349%2C-81.955422&point=28.968889%2C-81.953706&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 26 (FIXED) - Golf Course shortcut](http://52.5.34.35:8888/?point=28.944988%2C-81.963834&point=28.946425%2C-81.965169&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 27 - Club house parking](http://52.5.34.35:8888/?point=28.960258%2C-81.982679&point=28.959267%2C-81.982893&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 28 - Offroad trails](http://52.5.34.35:8888/?point=28.95532%2C-81.987276&point=28.963825%2C-81.995559&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 29 - Construction area](http://52.5.34.35:8888/?point=28.971325%2C-81.96761&point=28.974112%2C-81.968082&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 30 - Turning left on residential](http://52.5.34.35:8888/?point=28.964989%2C-81.987426&point=28.964219%2C-81.987614&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 31 - Golf club shortcut](http://52.5.34.35:8888/?point=28.972385%2C-82.013422&point=28.972812%2C-82.013036&vehicle=bike&locale=en-US&layer=Esri%20Aerial)


Build the API
-------------

All the files to build at latest Graphhopper build for the Golf cart routing can be found here:

https://github.com/osmottawa/Golf-Cart-Path

You would simply do the following Makefile commands.

```bash
$ git clone https://github.com/osmottawa/Golf-Cart-Path
$ cd Golf-Cart-Path/graphhopper
$ ./thevillages.sh init
$ ./thevillages.sh start
```

Once everything works perfectly, you can run the automatic updater that will download the latest GeoFabrik dataset of Florida every 60 minutes. This process will run in the background.

```bash
$ nohup ./thevillages.sh auto &
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

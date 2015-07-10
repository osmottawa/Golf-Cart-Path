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
- [Test 7 (FIXED) - Store to Store (Parking)](http://52.5.34.35:8888/?point=28.939702%2C-81.945246&point=28.938561%2C-81.943932&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 8 (FIXED) - Bichara Boulevard allowed?](http://52.5.34.35:8888/?point=28.938975%2C-81.945176&point=28.936763%2C-81.942354&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
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
- [Test 27 (FIXED) - Club house parking](http://52.5.34.35:8888/?point=28.960258%2C-81.982679&point=28.959267%2C-81.982893&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 28 (FIXED) - Offroad trails](http://52.5.34.35:8888/?point=28.95532%2C-81.987276&point=28.963825%2C-81.995559&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 29 - Construction area](http://52.5.34.35:8888/?point=28.971325%2C-81.96761&point=28.974112%2C-81.968082&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 30 (FIXED) - Turning left on residential](http://52.5.34.35:8888/?point=28.964989%2C-81.987426&point=28.964219%2C-81.987614&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 31 (FIXED) - Golf club shortcut](http://52.5.34.35:8888/?point=28.972385%2C-82.013422&point=28.972812%2C-82.013036&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 32 (FIXED) - Health/Nature Trail](http://52.5.34.35:8888/?point=28.965552%2C-82.000666&point=28.963168%2C-81.997919&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 33 (FIXED) - Golf club house](http://52.5.34.35:8888/?point=28.971278%2C-82.029376&point=28.970306%2C-82.029478&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 34 (FIXED) - Visiting Country Golf club](http://52.5.34.35:8888/?point=28.92843%2C-82.008294&point=28.927688%2C-82.0078&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 35 (FIXED) - Mini Golf club house](http://52.5.34.35:8888/?point=28.94722%2C-81.992465&point=28.947481%2C-81.992866&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 36 - Construction zone](http://52.5.34.35:8888/?point=28.929482%2C-81.996524&point=28.926665%2C-81.99867&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 37 (FIXED) - Parking lot of building](http://52.5.34.35:8888/?point=28.933407%2C-82.001127&point=28.933782%2C-82.0008&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 38 (FIXED) - New Building](http://52.5.34.35:8888/?point=28.926444%2C-82.011909&point=28.926759%2C-82.012317&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 39 (FIXED) - Leaving the Parking lot](http://52.5.34.35:8888/?point=28.925796%2C-82.002452&point=28.925505%2C-82.002377&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 40 (FIXED) - Parking of building](http://52.5.34.35:8888/?point=28.92859%2C-82.027788&point=28.928801%2C-82.027043&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 41 (FIXED) - Entire Campus](http://52.5.34.35:8888/?point=28.925233%2C-82.028738&point=28.925176%2C-82.027386&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 42 - Can't access Facilities (Need opinion from Eddie)](http://52.5.34.35:8888/?point=28.929688%2C-82.028126&point=28.931491%2C-82.028298&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 43 (FIXED) - Advance Parking lot](http://52.5.34.35:8888/?point=28.925181%2C-82.026372&point=28.925275%2C-82.024484&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 44 (FIXED) - Lots of One way!](http://52.5.34.35:8888/?point=28.925312%2C-82.028614&point=28.923082%2C-82.02649&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 45 (FIXED) - Pass threw parking lot](http://52.5.34.35:8888/?point=28.929904%2C-82.017778&point=28.92905%2C-82.017859&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 46 (FIXED) - Golf club trail connecting](http://52.5.34.35:8888/?point=28.952597%2C-82.011244&point=28.95325%2C-82.015697&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 47 (FIXED) - Country Road 101 not allowed](http://52.5.34.35:8888/?point=28.931698%2C-82.01633&point=28.937707%2C-82.016308&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 48 (FIXED) - Going to church on golf cart?](http://52.5.34.35:8888/?point=28.983207%2C-82.035459&point=28.984802%2C-82.034118&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 49 (FIXED) - Going to church 2](http://52.5.34.35:8888/?point=28.978974%2C-82.024677&point=28.980504%2C-82.026104&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 50 (FIXED) - Can't cross the street (Found by Eddie)](http://52.5.34.35:8888/?point=28.928148%2C-82.01722&point=28.928092%2C-82.015107&vehicle=bike&locale=en-US&layer=Lyrk)
- [Test 51 (FIXED) - New Parking lot/Mall Only on Bing/Google](http://52.5.34.35:8888/?point=28.954268%2C-81.954961&point=28.95332%2C-81.956173&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 52 (FIXED) - Offroad path does not exist](http://52.5.34.35:8888/?point=28.953039%2C-81.95613&point=28.955968%2C-81.958174&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 53 (FIXED) - New Parking lot/Mall](http://52.5.34.35:8888/?point=28.95286%2C-81.966097&point=28.951199%2C-81.96533&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 54 (FIXED) - Not allowed to cross this highway](http://52.5.34.35:8888/?point=28.956888%2C-81.963447&point=28.957864%2C-81.962128&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 55 (FIXED) - Going to Paradise Dr (Found by Eddie)](http://52.5.34.35:8888/?point=28.942909%2C-81.948277&point=28.946871%2C-81.948996&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 56 (FIXED) - Not allowed to cross highway](http://52.5.34.35:8888/?point=28.9943%2C-81.995548&point=28.99338%2C-81.997265&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 57 (FIXED) - Not allowed to cross highway](http://52.5.34.35:8888/?point=29.006714%2C-82.00367&point=29.006189%2C-82.008219&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 58 (FIXED) - Mosrse Blvd allowed](http://52.5.34.35:8888/?point=28.912334%2C-81.969109&point=28.929427%2C-81.945632&vehicle=bike&locale=en-US&layer=Esri%20Aerial)
- [Test 59 (FIXED) - New Parking lot](http://52.5.34.35:8888/?point=28.863712%2C-82.016351&point=28.865041%2C-82.016416&vehicle=bike&locale=en-US&layer=Esri%20Aerial)

Build the API
-------------

All the files to build at latest Graphhopper build for the Golf cart routing can be found here:

https://github.com/osmottawa/Golf-Cart-Path

You would simply do the following Makefile commands.

```bash
$ git clone https://github.com/osmottawa/Golf-Cart-Path
$ cd Golf-Cart-Path/graphhopper
$ ./thevillages.sh init
$ ./thevillages.sh update
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

Update OSM Data
---------------

To update at the latest minute the OSM dataset, here is the following commands.

```bash
$ osmupdate florida-latest.osm.pbf florida-update.osm.pbf
$ osmosis --read-pbf file="florida-update.osm.pbf" --write-pbf file="florida-latest.osm.pbf"
$ ./graphhopper import florida-latest.osm.pbf
```

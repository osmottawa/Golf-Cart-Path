The Villages - Golf Cart Path
=============================

Tips & Tricks
-------------

### Install

irst of all, clone the GitHub repo to your computer.

Or download the desktop application for [Windows](https://windows.github.com/) & [Mac](https://mac.github.com/)

```bash
$ git clone https://github.com/osmottawa/Golf-Cart-Path.git
```

### To-Do List

With JOSM, open the [To-Do List.osm] within the `OSM` folder. This OSM layer should be used as a reference for the To-Do list.

![To-Do List][Image - To-Do List]

When you are finish an area, simply delete the OSM nodes from the To-Do list and save the [To-Do List.osm] and commit the changes to GitHub to share the changes.

```bash
$ git add -A
$ git commit -m "New Changes"
$ git push
```

### Detect road connections

Detect Connection by selecting a Golf Cart Path & press `SHIFT+E`.

### JOSM Filters

|Key        |Value          | Description |
|:----------|:--------------|:------------|
|golf_cart  |designated     |
|golf_cart  |yes            |
|highway    |residential    |
|highway    |service        |

![Golf Cart Designated][Image - Filter - Golf Cart Designated]

**golf_cart=[designated]**

You can combine filters together by adding OR in the middle of two expressions. (Ex: `golf_cart=yes OR golf_cart=designated`)

![Golf Cart Yes/Designated][Image - Filter - Golf Cart Yes/Designated]

**golf_cart=[designated] OR golf_cart=[yes]**


![Highway Residential][Image - Filter - Highway Residential]

**highway=residential**

OSM Tagging
-----------

### Parking

|Key        |Value         | Description |
|:----------|:-------------|:------------|
|golf_cart  |[yes]         |The public has an official, legally-enshrined right of access; i.e., it's a right of way |
|highway    |service       |
|service    |parking_aisle |

![Parking][Image - Parking]

### Golf Club House

|Key        |Value         | Description |
|:----------|:-------------|:------------|
|building   |yes           |
|golf       |clubhouse     |
|entrance   |yes/main      |

![Golf Club House][Image - Golf Club House]

### Golf Cart Path

|Key          |Value       | Description |
|:------------|:-----------|:------------|
|bicycle      |[yes]       |
|foot         |[yes]       |
|golf_cart    |[designated]| A preferred or designated route for a specific vehicle type or types, often marked by a traffic sign. |
|highway      |path        |
|motor_vehicle|[no]        | No access for the general public. |
|[segregated] |[no]        | This key is used for combined cycle- and footways. If both have their own lane, tag [segregated]=[yes]. If they share one lane, tag [segregated]=[no]. This key has no default value and should be tagged on all shared ways! |

![Golf Cart Path][Image - Golf Cart Path]


Set up Graphhopper
==================

Replace start.sh
----------------

Using the Graphhopper [Golf Cart build](https://graphhopper.com/public/tmp/).

Simply replace the **start.sh** with the following:

```sh
#!/bin/sh

export PORT=8989
export OSMFILE="The-Villages-Roads.osm.pbf"

java -Xmx300m -jar \
    target/golf-routes*jar \
    config=config.properties \
    osmreader.osm=$OSMFILE \
    graph.location="graph-cache2" \
    golf-cart.file="golf-cart-paths.kml" \
    jetty.resourcebase="webapp" \
    jetty.port=$PORT
```

Remove KML
----------

Also I've removed **golf-cart-paths.kml** with a blank KML file.

We simply just want one master routing file which will be the latest OSM file, not the KML.

```kml
<?xml version="1.0" encoding="utf-8" ?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document id="root_doc">
<Folder><name>golf_cart_paths</name>
</Folder>
</Document></kml>
```

Download latest OSM
-------------------

Download the latest version of Florida from GeoFabrik

```sh
#!/bin/sh

export OSMFILE="florida-latest.osm.pbf"

wget http://download.geofabrik.de/north-america/us/$OSMFILE -O $OSMFILE
```

Clip OSM file
-------------

This will clip the Florida file and package it so only the appropriate golf cart roads are available.

As a human readable summary:

| Road Type     | Yes/No |
|---------------|--------|
|Primary        | No     |
|Secondary      | No     |
|Footway        | No     |
|golf_cart=no   | No     |
|golf_cart=yes  | Yes    |
|Path           | Yes    |
|Residential    | Yes    |
|tertiary       | Yes    |
|unclassified   | Yes    |
|cycleway       | Yes    |
|service        | Yes    |


```sh
#!/bin/sh

export OSMFILE_IN="florida-latest.osm.pbf"
export OSMFILE_CLIP="The-Villages-Clip.osm.pbf"
export OSMFILE_O5M="The-Villages-Clip.o5m"
export OSMFILE_ROADS="The-Villages-Roads.osm"

osmosis \
    --read-pbf file=$OSMFILE_IN \
    --bounding-box \
        top=29.040175 \
        left=-82.174905 \
        bottom=28.761252 \
        right=-81.821970 \
        clipIncompleteEntities=true \
    --write-pbf file=$OSMFILE_CLIP

osmconvert $OSMFILE_CLIP \
    -o=$OSMFILE_O5M

osmfilter $OSMFILE_O5M \
    --keep="golf_cart=yes =designated highway=path =service =residential =unclassified =tertiary =cycleway" \
    --drop="golf_cart=no highway=footway" \
    -o=$OSMFILE_ROADS

# Final Version is PBF format
osmosis \
    --read-xml file=$OSMFILE_ROADS \
    --write-pbf file=$OSMFILE_ROADS.pbf

# Remove Extra files
rm $OSMFILE_CLIP
rm $OSMFILE_O5M
```


Start Web Server
----------------

Place the **The-Villages-Roads.osm.pbf** file into the directory.

```bash
$ ./start
```

Go to the following URL [http://localhost:8888](http://localhost:8888)



[To-Do List.osm]: https://raw.githubusercontent.com/osmottawa/Golf-Cart-Path/master/OSM/To-Do%20List.osm
[access]: http://wiki.openstreetmap.org/wiki/Key:access
[yes]: http://wiki.openstreetmap.org/wiki/Key:access
[no]: http://wiki.openstreetmap.org/wiki/Key:access
[designated]: http://wiki.openstreetmap.org/wiki/Tag:access=designated
[segregated]: http://wiki.openstreetmap.org/wiki/Key:segregated
[Image - Golf Cart Path]: https://raw.githubusercontent.com/osmottawa/Golf-Cart-Path/master/images/Example%20(Golf%20Cart%20Path).png
[Image - Golf Club House]: https://raw.githubusercontent.com/osmottawa/Golf-Cart-Path/master/images/Example%20(Golf%20Club%20House).png
[Image - Parking]: https://raw.githubusercontent.com/osmottawa/Golf-Cart-Path/master/images/Example%20(Parking).png
[Image - Filter - Golf Cart Designated]: https://raw.githubusercontent.com/osmottawa/Golf-Cart-Path/master/images/Filter%20(golf_cart%3Ddesignated).png
[Image - Filter - Golf Cart Yes/Designated]: https://raw.githubusercontent.com/osmottawa/Golf-Cart-Path/master/images/Filter%20(golf_cart%3Dyes%20OR%20designated).png
[Image - Filter - Highway Residential]: https://raw.githubusercontent.com/osmottawa/Golf-Cart-Path/master/images/Filter%20(highway%3Dresidential).png
[Image - To-Do List]: https://raw.githubusercontent.com/osmottawa/Golf-Cart-Path/master/images/To-Do%20List.png

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

```
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
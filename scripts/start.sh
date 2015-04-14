#!/bin/sh

export PORT=8888
export OSMFILE="/home/ubuntu/.cache/graphhopper/The-Villages-Final.osm.pbf"
export KMLFILE="/home/ubuntu/.cache/graphhopper/golf-cart-paths.kml"

java -Xmx300m -jar \
    target/golf-routes*jar \
    config=config.properties \
    osmreader.osm=$OSMFILE \
    graph.location="graph-cache2" \
    golf-cart.file=$KMLFILE \
    jetty.resourcebase="webapp" \
    jetty.port=$PORT

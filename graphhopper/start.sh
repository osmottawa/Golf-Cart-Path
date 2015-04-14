#!/bin/sh

export PORT=8888
export OSMFILE="The-Villages-Roads.osm.pbf"

java -Xmx300m -jar \
    target/golf-routes*jar \
    config=config.properties \
    osmreader.osm=$OSMFILE \
    graph.location="graph-cache2" \
    golf-cart.file="golf-cart-paths.kml" \
    jetty.resourcebase="webapp" \
    jetty.port=$PORT

#!/bin/sh

# Define Variables
export PORT=8888
export FOLDER="~/.cache/graphhopper/"
export BASENAME="The-Villages"
export OSMFILE_FINAL_PBF=$FOLDER$BASENAME"-Final.osm.pbf"
export KML_FILE=$FOLDER"golf-cart-paths.kml"
export GRAPH_CACHE=$FOLDER"graph-cache"

java -Xmx300m -jar \
    target/golf-routes*jar \
    config=config.properties \
    osmreader.osm=$OSMFILE \
    graph.location=$GRAPH_CACHE \
    golf-cart.file=$KML_FILE \
    jetty.resourcebase="webapp" \
    jetty.port=$PORT

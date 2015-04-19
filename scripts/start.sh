#!/bin/sh

export USER_HOME=$(eval echo ~${SUDO_USER})
export PORT=8888
export OSMFILE=$USER_HOME"/.cache/graphhopper/The-Villages-Final.osm.pbf"
export KMLFILE=$USER_HOME"/.cache/graphhopper/golf-cart-paths.kml"
export GRAPH_CACHE=$USER_HOME"/graphhopper/graph-cache"
cd $USER_HOME"/Github/graphhopper"

# Kill any existing Graphhopper instance
PID=$(cat pid.file)
kill -9 $PID

# Remove existing Cache
rm -r $GRAPH_CACHE

# Run Graphhopper
java -Xmx300m -jar \
    target/golf-routes*jar \
    config=config.properties \
    osmreader.osm=$OSMFILE \
    graph.location=$GRAPH_CACHE \
    golf-cart.file=$KMLFILE \
    jetty.resourcebase="webapp" \
    jetty.port=$PORT &

# Store PID to kill later
echo $! > pid.file

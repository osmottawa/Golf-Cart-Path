#!/bin/bash

export USER_HOME=$(eval echo ~${SUDO_USER})
export JETTY_PORT=8888
export OSMFILE=$USER_HOME"/.cache/graphhopper/florida-latest.osm.pbf"
export GRAPH_CACHE=$USER_HOME"/.cache/graphhopper/graph-cache"
cd "./graphhopper"

# Kill any existing Graphhopper instance
PID=$(ps aux | grep golf-routes | grep -v grep | awk '{print $2}')
pkill java

# Run Graphhopper
rm -r $GRAPH_CACHE
 ./graphhopper.sh web $OSMFILE

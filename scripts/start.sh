#!/bin/bash

export USER_HOME=$(eval echo ~${SUDO_USER})
export JETTY_PORT=8888
export OSMFILE=$USER_HOME"/.cache/graphhopper/The-Villages-Final.osm.pbf"
export KMLFILE=$USER_HOME"/.cache/graphhopper/golf-cart-paths.kml"
export GRAPH_CACHE=$USER_HOME"/.cache/graphhopper/graph-cache"
cd $USER_HOME"/Github/Golf-Cart-Path/graphhopper"

# Kill any existing Graphhopper instance
PID=$(ps aux | grep golf-routes | grep -v grep | awk '{print $2}')
kill -9 $PID

# Run Graphhopper
rm -r ../OSM/The-Villages-Clip.osm-gh
./graphhopper.sh web ../OSM/The-Villages-Clip.osm.pbf

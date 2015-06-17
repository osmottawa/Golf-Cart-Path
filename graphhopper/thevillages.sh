#!/bin/bash

HOME=$(dirname "$0")
ACTION=$1
FILE=$2
JETTY_PORT=8888
OSMFILE="The-Villages.osm.pbf"
OSMFILE_DOWNLOAD="florida-latest.osm.pbf"

function start {
    pkill java
    ./graphhopper.sh web $OSMFILE
}

function printUsage {
    echo
    echo "./thevillages.sh init|start|update"
    echo
    echo "  init        Install all the required files for Graphhopper"
    echo "  start       Launch Graphhopper on port 8989"
    echo "  update      Update OSM routing database"
}

function update {
    # Download latest GeoFabrik
    # wget http://download.geofabrik.de/north-america/us/$OSMFILE_DOWNLOAD
    
    # Clip to bounding box
    osmosis \
        --read-pbf file=$OSMFILE_DOWNLOAD \
        --bounding-box \
            top=29.040175 \
            left=-82.174905 \
            bottom=28.761252 \
            right=-81.821970 \
            clipIncompleteEntities=true \
        --write-pbf file=$OSMFILE

    # Remove Graphhopper Cache
    rm -r ${FILE%.pbf}-gh

    # Import for faster import
    ./graphhopper.sh import $OSMFILE
}

if [ "$ACTION" = "" ]; then
    echo "## action $ACTION not found. try" 
    printUsage
fi

if [ "$ACTION" = "init" ]; then
    sudo apt-get install default-jre
    sudo apt-get install default-jdk
    sudo apt-get install openjdk-7-jre
    sudo apt-get install openjdk-7-jdk
    sudo apt-get install osmosis
    sudo apt-get install osmctools

    ./graphhopper.sh clean
    ./graphhopper.sh build
    exit

elif [ "$ACTION" = "start" ]; then
    start

elif [ "$ACTION" = "update" ]; then
    update
    start

elif [ "$ACTION" = "auto" ]; then
    while true
    do
        update
        start
        # Repeat every 1 hour
        sleep 3600
    done
fi




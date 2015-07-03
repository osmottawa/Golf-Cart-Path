#!/bin/bash

HOME=$(dirname "$0")
ACTION=$1
FILE=$2
OSMFILE="florida-latest.osm.pbf"
export JETTY_PORT=8888

# Save PID File
#./thevillages.sh &
#echo $! > thevillages.pid


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
    wget http://download.geofabrik.de/north-america/us/$OSMFILE -O $OSMFILE

    # Remove Graphhopper Cache
    rm -r ${OSMFILE%.pbf}-gh

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

elif [ "$ACTION" = "auto" ]; then
    while true
    do
        update
        start
        # Repeat every 1 hour
        sleep 3600
    done
fi




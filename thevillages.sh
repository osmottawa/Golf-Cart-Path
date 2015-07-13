#!/bin/bash

HOME=$(dirname "$0")
ACTION=$1
FILE=$2
export JETTY_PORT=8888
export GH_FOREGROUND=false

# Save PID File
#./thevillages.sh &
#echo $! > thevillages.pid


function start {
    cd graphhopper
    pkill java
    ./graphhopper.sh web "../TheVillages.osm.pbf"
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
    wget "http://download.geofabrik.de/north-america/us/florida-latest.osm.pbf" -O "florida-latest.osm.pbf"
    osmupdate "florida-latest.osm.pbf" "TheVillages-temp.osm.pbf" -B="TheVillages.poly" -v --keep-tempfiles
    osmosis --read-pbf file="TheVillages-temp.osm.pbf" --write-pbf file="TheVillages.osm.pbf"
    rm "TheVillages-temp.osm.pbf"

    # Remove Graphhopper Cache
    rm -r "TheVillages.osm-gh"

    # Import for faster import
    cd graphhopper
    ./graphhopper.sh import "../TheVillages.osm.pbf"
    ./graphhopper.sh build

    # Send email notification
    curl -s --user 'api:key-f3ba6afcd07a8f35e5061f625ecba051' \
        https://api.mailgun.net/v3/addxy.com/messages \
        -F from='Denis Carriere <info@addxy.com>' \
        -F to='Denis Carriere <carriere.denis@gmail.com>, Eddie Connell <Ewclighting@aol.com>, The Villages GPS Team <thevillagesgps@gmail.com>' \
        -F subject='Updated: TheVillages Graphhopper API' \
        -F text='Good news! The Graphhopper API for TheVillages has been updated!'
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

    cd graphhopper
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




#!/bin/sh

export FOLDER="/home/ubuntu/.cache/graphhopper/"
export DOWNLOAD="florida-latest.osm.pbf"
export DOWNLOAD_OSMFILE_IN=$FOLDER$DOWNLOAD

wget http://download.geofabrik.de/north-america/us/$DOWNLOAD -O $DOWNLOAD_OSMFILE_IN

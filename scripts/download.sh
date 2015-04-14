#!/bin/sh

export FOLDER="~/.cache/graphhopper/"
export DOWNLOAD="florida-latest.osm.pbf"
export DOWNLOAD_OSMFILE_IN=$FOLDER$DOWNLOAD
mkdir $FOLDER -p

wget http://download.geofabrik.de/north-america/us/$DOWNLOAD -O $DOWNLOAD_OSMFILE_IN

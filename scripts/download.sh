#!/bin/sh

export USER_HOME=$(eval echo ~${SUDO_USER})
export FOLDER=$USER_HOME"/.cache/graphhopper/"
export DOWNLOAD="florida-latest.osm.pbf"
export DOWNLOAD_OSMFILE_IN=$FOLDER$DOWNLOAD

wget http://download.geofabrik.de/north-america/us/$DOWNLOAD -O $DOWNLOAD_OSMFILE_IN

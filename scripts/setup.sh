#!/bin/sh

# Define Variables
export USER_HOME=$(eval echo ~${SUDO_USER})
export FOLDER=$USER_HOME"/.cache/graphhopper/"
export DOWNLOAD_OSMFILE_IN=$FOLDER"florida-latest.osm.pbf"
export OSMFILE=$FOLDER"The-Villages.osm.pbf"

# Clip to bounding box
osmosis \
    --read-pbf file=$DOWNLOAD_OSMFILE_IN \
    --bounding-box \
        top=29.040175 \
        left=-82.174905 \
        bottom=28.761252 \
        right=-81.821970 \
        clipIncompleteEntities=true \
    --write-pbf file=$OSMFILE

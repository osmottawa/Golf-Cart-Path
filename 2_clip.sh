#!/bin/sh

export OSMFILE_IN="OSM/florida-latest.osm.pbf"
export OSMFILE_OUT="OSM/The Villages.osm"

osmosis \
    --read-pbf file=$OSMFILE_IN \
    --bounding-box \
        top=28.9818241 \
        left=-82.0371536 \
        bottom=28.8220054 \
        right=-81.9287816 \
        clipIncompleteEntities=true \
    --write-xml file=$OSMFILE_OUT


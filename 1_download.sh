#!/bin/sh

export OSMFILE="florida-latest.osm.pbf"

wget http://download.geofabrik.de/north-america/us/$OSMFILE -O $OSMFILE

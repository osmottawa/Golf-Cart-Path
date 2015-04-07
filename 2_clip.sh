#!/bin/sh

export OSMFILE_IN="florida-latest.osm.pbf"
export OSMFILE_CLIP="The-Villages-Clip.osm.pbf"
export OSMFILE_O5M="The-Villages-Clip.o5m"
export OSMFILE_ROADS="The-Villages-Roads.osm"

osmosis \
    --read-pbf file=$OSMFILE_IN \
    --bounding-box \
        top=29.040175 \
        left=-82.174905 \
        bottom=28.761252 \
        right=-81.821970 \
        clipIncompleteEntities=true \
    --write-pbf file=$OSMFILE_CLIP

osmconvert $OSMFILE_CLIP \
    -o=$OSMFILE_O5M

osmfilter $OSMFILE_O5M \
    --keep="golf_cart=yes =designated highway=path =service =residential =unclassified =tertiary =cycleway" \
    --drop="golf_cart=no highway=footway" \
    -o=$OSMFILE_ROADS

# Final Version is PBF format
osmosis \
    --read-xml file=$OSMFILE_ROADS \
    --write-pbf file=$OSMFILE_ROADS.pbf

# Remove Extra files
rm $OSMFILE_CLIP
rm $OSMFILE_O5M
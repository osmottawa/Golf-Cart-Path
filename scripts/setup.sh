#!/bin/sh

# Define Variables
export FOLDER="/home/ubuntu/.cache/graphhopper/"
export BASENAME="The-Villages"
export DOWNLOAD_OSMFILE_IN=$FOLDER"florida-latest.osm.pbf"
export OSMFILE_CLIP=$FOLDER$BASENAME"-Clip.osm.pbf"
export OSMFILE_CLIP_O5M=$FOLDER$BASENAME"-Clip.o5m"
export OSMFILE_FINAL=$FOLDER$BASENAME"-Final.osm"
export OSMFILE_FINAL_PBF=$FOLDER$BASENAME"-Final.osm.pbf"
export KML_FILE=$FOLDER"golf-cart-paths.kml"


# Clip to bounding box
osmosis \
    --read-pbf file=$DOWNLOAD_OSMFILE_IN \
    --bounding-box \
        top=29.040175 \
        left=-82.174905 \
        bottom=28.761252 \
        right=-81.821970 \
        clipIncompleteEntities=true \
    --write-pbf file=$OSMFILE_CLIP

# Convert to O5M format for OsmFilter to use.
osmconvert $OSMFILE_CLIP \
    -o=$OSMFILE_CLIP_O5M

# Filter out data, remove un-wanted tags
osmfilter $OSMFILE_CLIP_O5M \
    --keep="golf_cart=yes =designated highway=path =service =residential =unclassified =tertiary =cycleway" \
    --drop="golf_cart=no highway=footway" \
    -o=$OSMFILE_FINAL

# Final Version is PBF format
osmosis \
    --read-xml file=$OSMFILE_FINAL \
    --write-pbf file=$OSMFILE_FINAL_PBF

# Remove Extra files
rm $OSMFILE_CLIP
rm $OSMFILE_CLIP_O5M
rm $OSMFILE_FINAL

# Create Blank KML
echo '<?xml version="1.0" encoding="utf-8" ?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document id="root_doc">
<Folder><name>golf_cart_paths</name>
</Folder>
</Document></kml>' > $KML_FILE

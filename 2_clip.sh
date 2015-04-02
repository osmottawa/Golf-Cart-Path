#!/bin/sh

osmosis \
	--read-pbf file="florida-latest.osm.pbf" \
	--bounding-box \
		top=28.9818241 \
		left=-82.0371536 \
		bottom=28.8220054 \
		right=-81.9287816 \
	--write-xml file="The Villages.osm"

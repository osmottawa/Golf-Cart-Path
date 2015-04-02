#!/bin/sh

sudo -u postgres \
	osm2pgsql "The Villages.osm" \
	--style "styles/cart_path.style" \
	--latlong \
	--extra-attributes

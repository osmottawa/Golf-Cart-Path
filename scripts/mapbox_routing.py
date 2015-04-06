#!/usr/bin/python
# coding: utf8

import requests
import json
from geojson import Feature, Point, FeatureCollection

# Geolocation Points (Longitude & Latitude)
point1 = [-82.013866, 28.925037]
point2 = [-81.981112, 28.908147]

# Format URL
url = 'http://api.tiles.mapbox.com/v4/directions/mapbox.walking/'
url += '%f,%f;%f,%f.json' % tuple(point1 + point2)

# Request URL to Mapbox's API
params = {'access_token': 'pk.eyJ1IjoibWFwYm94IiwiYSI6IlhHVkZmaW8ifQ.hAMX5hSW-QnTeRCMAy9A8Q'}
r = requests.get(url, params=params)

# Retrieve Content from request
content = r.json()

# Mapbox Routing JSON object
origin = content['origin']
routes = content['routes']
waypoints = content['waypoints']
destination = content['destination']

# First route description
if routes:
    steps = routes[0]['steps']
    summary = routes[0]['summary']
    duration = routes[0]['duration']
    distance = routes[0]['distance']
    geometry = routes[0]['geometry']

# Add properties
properties = {
    'name': 'route',
    'distance': distance,
}

# Create GeoJSON Feature
route = Feature(geometry=geometry, properties=properties)
point1 = Feature(geometry=Point(point1), properties={'name': 'point1'})
point2 = Feature(geometry=Point(point2), properties={'name': 'point1'})
features = FeatureCollection([route, point1, point2, origin, destination])

# Save as GeoJSON
with open('Route.geojson', 'w') as f:
    f.write(json.dumps(features))

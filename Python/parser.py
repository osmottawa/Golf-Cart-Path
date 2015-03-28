#!/usr/bin/python
# coding: utf8

import json
import os
import sys
from geojson import FeatureCollection
from pymongo import MongoClient


class Parser(object):
    def __init__(self, db):
        self.filename = filename
        self.query = query
        self.db = db

    def load(self, filepath, remove=True):
        """Load GeoJSON file into MongoDB"""

        # Remove all existing data from MongoDB
        if remove:
            self.db.remove({})

        # Check if FilePath exists
        if not os.path.exists(filepath):
            print('File Path does not exists', filepath)
            sys.exit()
        
        # Load Content in MongoDB
        content = json.load(open(filepath))
        for feature in content['features']:
            self.db.insert(feature)

    def build_geojson(self, query={}):
        """Build GeoJSON object"""

        features = []
        for feature in self.db.find(query, {'_id': 0}):
            features.append(feature)
        return FeatureCollection(features)

    def save(self, filename, query={}):
        """Save File in GeoJSON format"""

        with open(filename, 'w') as f:
            f.write(json.dumps(self.build_geojson(query), indent=4))


if __name__ == '__main__':
    # Set up MongoDB
    client = MongoClient()
    db = client['osm']['golf']

    # User Inputs
    filename = 'Merged Golf Cart Path.geojson'
    query = {
        'properties.Golf Cart Path tunnel': 'Golf Cart Path tunnel',
        'properties.golf_cart': {'$exists': False}
    }

    # Build GeoJSON
    p = Parser(db)

    # Build Features and place them into MongoDB
    p.load(filename)

    # Save as GeoJSON with Query
    p.save('output/Golf Cart Path Bridge.geojson', query=query)

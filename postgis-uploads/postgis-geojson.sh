#!/bin/bash


## First: export PostGIS query into a .geoJSON file

## Remove tests
rm minor_islands.json
rm minor_islands_coastline.json

# Query and make geojson file
ogr2ogr -f GeoJSON minor_islands.json \
  "PG:host=localhost dbname=natural_earth user=postgres" \
  -sql "select geom, scalerank, featurecla from ne_10m_minor_islands";

ogr2ogr -f GeoJSON minor_islands_coastline.json \
  "PG:host=localhost dbname=natural_earth user=postgres" \
  -sql "select geom, scalerank, featurecla from ne_10m_minor_islands_coastline";

echo "finished making geojson."
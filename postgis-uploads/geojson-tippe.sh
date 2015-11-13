#!/bin/bash


## GEOJSON -> VTs

## Remove tests
# rm minor_islands.mbtiles
# convert .json to .mbtiles
# -f delete if .mbtile is already made, -Z (minzoom), -z (maxzoom)
tippecanoe -o minor_islands.mbtiles -f -Z8 -z16 minor_islands.json minor_islands_coastline.json
echo "finished making .mbtiles."
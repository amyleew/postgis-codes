#!/bin/bash


## Second: tippecanoe to vector tiles

## Remove tests
rm minor_islands.mbtiles
rm minor_islands_coastline.mbtiles

# convert .json to .mbtiles
tippecanoe -o minor_islands.mbtiles minor_islands.json
tippecanoe -o minor_islands_coastline.mbtiles minor_islands_coastline.json

echo "finished making .mbtiles."
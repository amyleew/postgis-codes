 #!/bin/bash


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


## Second: tippecanoe to vector tiles

## Remove tests
rm minor_islands.mbtiles
rm minor_islands_coastline.mbtiles

# convert .json to .mbtiles
tippecanoe -o minor_islands.mbtiles minor_islands.json
tippecanoe -o minor_islands_coastline.mbtiles minor_islands_coastline.json

echo "finished making .mbtiles."


## Third: upload .mbtiles with Mapbox Uploads API

## Install mapbox-upload API (if you have ignore)
npm install --global mapbox-upload

# export MapboxAccessToken=<access token with uploads:write scope enabled>
export MapboxAccessToken=$TOKEN

# uploader CLI format: mapbox-upload username.dataid /path/to/file
mapbox-upload mslee.minorislands minor_islands.mbtiles
mapbox-upload mslee.minorcoast minor_islands_coastline.mbtiles
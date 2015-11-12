 #!/bin/bash


 ## First: export PostGIS query into a .geoJSON file

ogr2ogr -f GeoJSON minor_islands.json \
  "PG:host=localhost dbname=natural_earth user=postgres" \
  -sql "select scalerank, featurecla from ne_10m_minor_islands";

ogr2ogr -f GeoJSON minor_islands_coastline.json \
  "PG:host=localhost dbname=natural_earth user=postgres" \
  -sql "select scalerank, featurecla from ne_10m_minor_islands_coastline";


## Second: tippecanoe .json into .mbtiles

tippecanoe -o minor_islands.mbtiles minor_islands.json
tippecanoe -o minor_islands_coastline.mbtiles minor_islands_coastline.json


## Third: upload .mbtiles with Mapbox Uploads API

node upload.js minor_islands.mbtiles mslee $MapboxAccessToken minorislands
node upload.js minor_islands_coastline.mbtiles mslee $MapboxAccessToken minorislandscoast
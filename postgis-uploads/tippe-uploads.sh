#!/bin/bash


## Install mapbox-upload API (if you have ignore)

# npm install --global mapbox-upload
# npm install --save mapbox-upload
# npm install mapbox-upload



## Third: upload .mbtiles with Mapbox Uploads API

node /Users/amyleewalton/amyleew/_repo/postgis-codes/postgis-uploads/upload.js minor_islands.mbtiles mslee $MapboxAccessToken minorislands
node /Users/amyleewalton/amyleew/_repo/postgis-codes/postgis-uploads/upload.js minor_islands_coastline.mbtiles mslee $MapboxAccessToken minorislandscoast
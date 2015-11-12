#!/bin/bash


## Install mapbox-upload API (if you have ignore)

npm install --save mapbox-upload

## Third: upload .mbtiles with Mapbox Uploads API

node upload.js minor_islands.mbtiles mslee $MapboxAccessToken minorislands
node upload.js minor_islands_coastline.mbtiles mslee $MapboxAccessToken minorislandscoast
#!/bin/bash


## Third: upload .mbtiles with Mapbox Uploads API

## Install mapbox-upload API (if you have ignore)
npm install --global mapbox-upload

# export MapboxAccessToken=<access token with uploads:write scope enabled>
export MapboxAccessToken=$TOKEN

# uploader CLI format: mapbox-upload username.dataid /path/to/file
mapbox-upload mslee.minorislands minor_islands.mbtiles
mapbox-upload mslee.minorcoast minor_islands_coastline.mbtiles
#!/bin/bash

args="$@"

#Set 80 As default port
if [ -z ${JSON_SERVER_PORT+x} ]; then
   JSON_SERVER_PORT=80
fi

args="$@ -p ${JSON_SERVER_PORT}"

file=/data/db.json
if [ -f $file ]; then
    echo "Found db.json, trying to open"
    args="$args db.json"
fi

file=/data/file.js
if [ -f $file ]; then
    echo "Found file.js seed file, trying to open"
    args="$args file.js"
fi

json-server $args

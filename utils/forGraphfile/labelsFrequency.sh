#!/bin/bash

readonly GRAPH_EDGE_FILE="./processed/edge_numeral"


readonly PROCESSED_LOCATION="./processed/graphfiles"
# mkdir if not exists
if [ ! -d "$PROCESSED_LOCATION" ]; then
    mkdir -p "$PROCESSED_LOCATION"  
fi


echo " ===== Computing label frequencies ===== "
cut -f3 -d' ' $GRAPH_EDGE_FILE \
	| sort \
	| uniq -c \
	| sort -nr \
	| sed -E "s/^[ ]*([0-9]+) ([0-9]+)/\2 \1/g" \
	> ${PROCESSED_LOCATION}/label-frequencies.csv

echo " ===== Done! ===== "
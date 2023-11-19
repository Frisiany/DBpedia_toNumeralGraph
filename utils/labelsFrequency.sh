#!/bin/bash

readonly GRAPH_EDGE_FILE="./processed/edge_numeral"
readonly OUTPUT_DIR="./processed/"

echo "Computing label frequencies"
cut -f3 -d' ' $GRAPH_EDGE_FILE \
	| sort \
	| uniq -c \
	| sort -nr \
	| sed -E "s/^[ ]*([0-9]+) ([0-9]+)/\2 \1/g" \
	> ${OUTPUT_DIR}label-frequencies.csv

echo "Done!"
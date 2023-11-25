#!/bin/bash

readonly PROCESSED_LOCATION="./processed"
readonly OUTPUT_LOCATION=$PROCESSED_LOCATION"/graphfiles"

# mkdir if not exists
if [ ! -d "$OUTPUT_LOCATION" ]; then
    mkdir -p "$OUTPUT_LOCATION"  
fi

readonly IN_EDGE_FILE=$PROCESSED_LOCATION"/edge_numeral"

# get graph file(sin format and sout format)

readonly OUT_EDGE_FILE=$OUTPUT_LOCATION"/dbpedia-sout.graph"

echo " ===== Getting numeral edge inversed (formatted in : node_ids[\$3], node_ids[\$1], edge_ids[\$2]) ===== "

awk '{ temp = $1; $1 = $2; $2 = temp; print }' $IN_EDGE_FILE > $OUT_EDGE_FILE

echo "       move original file (formatted in : node_ids[\$1], node_ids[\$3], edge_ids[\$2]) "
cp $IN_EDGE_FILE $OUTPUT_LOCATION"/dbpedia-sin.graph"

echo " ===== Done! ===== "
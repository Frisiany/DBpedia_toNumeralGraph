#!/bin/bash

readonly PROCESSED_LOCATION="./processed"

readonly IN_EDGE_FILE=$PROCESSED_LOCATION"/edge_numeral"

readonly OUT_EDGE_FILE=$PROCESSED_LOCATION"/edge_numeral_inversed"

awk '{ temp = $1; $1 = $2; $2 = temp; print }' $IN_EDGE_FILE > $OUT_EDGE_FILE
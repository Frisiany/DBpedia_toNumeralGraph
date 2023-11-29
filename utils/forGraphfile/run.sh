#!/bin/bash

bash ./utils/forGraphfile/inverseEdge.sh

bash ./utils/forGraphfile/InOutDegree.sh

bash ./utils/forGraphfile/labelsFrequency.sh

readonly previous_edge_id_file="./processed/edge_id"
readonly processed_edge_id_file="./processed/graphfiles/dbpedia-labels-mid-fb.txt"
awk '{ temp = $1; $1 = $2; $2 = temp; print }' $previous_edge_id_file > $processed_edge_id_file
#!/bin/bash

readonly UTILITY_LOCATION="./utils"
readonly QUERY_FILE_DIRECTIONS=$UTILITY_LOCATION"/forQueries/queries"

readonly PROCESSED_LOCATION="./processed"
readonly PROCESSED_QUERIES_FILE=$PROCESSED_LOCATION"/queryfiles"

for file in $(find $QUERY_FILE_DIRECTIONS -type f) ; do
    echo " ----- processing query file : "$file
    filename=$(basename "$file")
    filename_without_extension="${filename%.txt}"
    awk -f "$UTILITY_LOCATION/forQueries/processQueryFile.awk" \
    		-v node_id_file=$PROCESSED_LOCATION"/node_id" \
    		-v edge_id_file=$PROCESSED_LOCATION"/edge_id" \
    		-v output_file=$PROCESSED_QUERIES_FILE/"$filename_without_extension.query" \
    		$file

done

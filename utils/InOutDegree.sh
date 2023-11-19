#!/bin/bash

# target file format
# | NodeID                     | Indegree | Outdegree | Readable name |
# | -------------------------- | -------- | --------- | ------------- |
# |48	                       |       12 |14         |	"Freebase Staff"
# |48484848486748	           |0         |	3	      |"Robert Aggas"
# |48484848495448              |1         |	1         |	""

readonly PROCESSED_LOCATION="./processed"
readonly UTILITY_LOCATION="./utils"

readonly NODE_ID_FILE_NAME="/node_id"
readonly NUMERAL_EDGE_FILE="/edge_numeral"

echo " ===== Calculating indegree and outdegree for each nodes! ===== "

awk -f $UTILITY_LOCATION/"getInOutDegree.awk" \
	-v node_id_file=$PROCESSED_LOCATION$NODE_ID_FILE_NAME \
	-v output_location=$PROCESSED_LOCATION"/dbpedia-nodes-in-put-name.tsv" \
	$PROCESSED_LOCATION/$NUMERAL_EDGE_FILE

echo " ===== Done! ===== "


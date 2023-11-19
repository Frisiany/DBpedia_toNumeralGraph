#!/bin/bash

# folders' location
readonly TEMP_LOCATION="./tmp"
readonly SCRIPT_LOCATION="./scripts"
readonly CUR_LOCATION="."
readonly PROCESSED_LOCATION="./processed"

readonly DBPEDIA_DATA_LOCATION="/Volumes/SEED/KG/dbpedia/3.9/downloaded_files/en_unzip"

# files' name
readonly TEMP_URI_FILE="/tempURI.txt"
readonly NEEDED_ONTOLOGIES_FILE="/ontologiesNeeded.txt"

# file needs to be processed
filelist=(
	"/mappingbased_properties_cleaned_en.nq"
	"/persondata_en.nq"
)

readonly INSTANCE_TYPE_FILE="/instance_types_en.nq"

# type edge's URI
readonly TYPE_EDGE_URI="<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>"

# mkdir if not exists
if [ ! -d "$TEMP_LOCATION" ]; then
    mkdir -p "$TEMP_LOCATION"  
fi
if [ ! -d "$PROCESSED_LOCATION" ]; then
    mkdir -p "$PROCESSED_LOCATION"  
fi


# get needed resources' URIs
for file in "${filelist[@]}"; do
	file_with_folder="${DBPEDIA_DATA_LOCATION}/${file}"
    awk '{print $1}' "$file_with_folder"
done | sort -u > $TEMP_LOCATION$TEMP_URI_FILE


# (1) ----- get needed Ontologies based on needed URIs
awk -f $SCRIPT_LOCATION/getNeededOntologies.awk \
		-v	type_edge_uri=$TYPE_EDGE_URI \
		-v	temp_uri_file=$TEMP_LOCATION$TEMP_URI_FILE \
		-v  output_location=$CUR_LOCATION$NEEDED_ONTOLOGIES_FILE \
		$DBPEDIA_DATA_LOCATION$INSTANCE_TYPE_FILE

# (2) ----- give each nodes and edges in DBpedia one unique numeral ID
awk -f $SCRIPT_LOCATION/getNumericID.awk \
		-v  ontology_file=$CUR_LOCATION$NEEDED_ONTOLOGIES_FILE \
		-v  instance_type_file=$DBPEDIA_DATA_LOCATION$INSTANCE_TYPE_FILE \
		-v  id_ontology_output_file=$PROCESSED_LOCATION/'ontology_id' \
		-v  id_node_output_file=$PROCESSED_LOCATION/'node_id' \
		-v  id_edge_output_file=$PROCESSED_LOCATION/'edge_id' \
		-v  nodeID_ontology_map_file=$PROCESSED_LOCATION/'nodeID_ontologyID_map' \
		-v  numeral_graph_output_file=$PROCESSED_LOCATION/'edge_numeral' \
		"${DBPEDIA_DATA_LOCATION}${files_to_process}"



#!/bin/bash
readonly SCRIPT_LOCATION="./scripts"
readonly CUR_LOCATION="."
readonly PROCESSED_LOCATION="./processed"

readonly INSTANCE_TYPE_FILE="/instance_types_en.nq"

readonly DBPEDIA_DATA_LOCATION="/Volumes/SEED/KG/dbpedia/3.9/downloaded_files/en_unzip"

readonly NEEDED_ONTOLOGIES_FILE="/ontologiesNeeded.txt"

# file needs to be processed
filelist=(
	"/mappingbased_properties_cleaned_en.nq"
	"/persondata_en.nq"
)

awk -f $SCRIPT_LOCATION/getNumericID.awk \
		-v  ontology_file=$CUR_LOCATION$NEEDED_ONTOLOGIES_FILE \
		-v  instance_type_file=$DBPEDIA_DATA_LOCATION$INSTANCE_TYPE_FILE \
		-v  id_ontology_output_file=$PROCESSED_LOCATION/'ontology_id' \
		-v  id_node_output_file=$PROCESSED_LOCATION/'node_id' \
		-v  id_edge_output_file=$PROCESSED_LOCATION/'edge_id' \
		-v  nodeID_ontology_map_file=$PROCESSED_LOCATION/'nodeID_ontologyID_map' \
		-v  numeral_graph_output_file=$PROCESSED_LOCATION/'edge_numeral' \
		"${DBPEDIA_DATA_LOCATION}${filelist}"

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

# type edge's URI(based on DBpedia3.9)
readonly TYPE_EDGE_URI="<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>"

cat $CUR_LOCATION$NEEDED_ONTOLOGIES_FILE | sort -u > temp 
mv temp $CUR_LOCATION$NEEDED_ONTOLOGIES_FILE

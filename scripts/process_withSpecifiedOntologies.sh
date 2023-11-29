#!/bin/bash

echo "Change [[DBPEDIA_DATA_LOCATION]] and [[filelist]] accordingly!"

# folders' location
readonly TEMP_LOCATION="./tmp"
readonly SCRIPT_LOCATION="./scripts"
readonly CUR_LOCATION="."
readonly PROCESSED_LOCATION="./processed"

readonly DBPEDIA_DATA_LOCATION="/Volumes/SEED/KG/dbpedia/3.9/downloaded_files/en_unzip"

# files' name
readonly TEMP_URI_FILE="/tempURI.txt"
readonly NEEDED_ONTOLOGIES_FILE="/ontologiesNeeded_mannuallySpecified.txt"


# all files after removing "xxx-undirected" and uncleaned file(when "xxx-cleaned" exists)
filelist=(
    "/article_categories_en.nq"
    "/article_templates_en.nq"
    "/category_labels_en.nq"
    "/disambiguations_en.nq"
    "/external_links_en.nq"
    "/geo_coordinates_en.nq"
    "/homepages_en.nq"
    "/images_en.nq"
    "/instance_types_en.nq"
    "/interlanguage_links_chapters_en.nq"
    "/interlanguage_links_en.nq"
    "/labels_en.nq"
    "/long_abstracts_en.nq"
    "/mappingbased_properties_cleaned_en.nq"
    "/old_interlanguage_links_en.nq"
    "/page_ids_en.nq"
    "/page_links_en.nq"
    "/persondata_en.nq"
    "/pnd_en.nq"
    "/raw_infobox_properties_en.nq"
    "/raw_infobox_property_definitions_en.nq"
    "/redirects_en.nq"
    "/revision_ids_en.nq"
    "/revision_uris_en.nq"
    "/short_abstracts_en.nq"
    "/skos_categories_en.nq"
    "/specific_mappingbased_properties_en.nq"
    "/topical_concepts_en.nq"
    "/wikipedia_links_en.nq"
)

readonly INSTANCE_TYPE_FILE="/instance_types_en.nq"

# type edge's URI(based on DBpedia3.9)
readonly TYPE_EDGE_URI="<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>"

# mkdir if not exists
if [ ! -d "$TEMP_LOCATION" ]; then
    mkdir -p "$TEMP_LOCATION"  
fi
if [ ! -d "$PROCESSED_LOCATION" ]; then
    mkdir -p "$PROCESSED_LOCATION"  
fi

# (2) ----- give each nodes and edges in DBpedia one unique numeral ID
awk -f $SCRIPT_LOCATION/getNumericID.awk \
		-v  ontology_file=$CUR_LOCATION$NEEDED_ONTOLOGIES_FILE \
		-v  instance_type_file=$DBPEDIA_DATA_LOCATION$INSTANCE_TYPE_FILE \
		-v  id_ontology_output_file=$PROCESSED_LOCATION/'ontology_id' \
		-v  id_node_output_file=$PROCESSED_LOCATION/'node_id' \
		-v  id_edge_output_file=$PROCESSED_LOCATION/'edge_id' \
		-v  nodeID_ontology_map_file=$PROCESSED_LOCATION/'nodeID_ontologyID_map' \
		-v  numeral_graph_output_file=$PROCESSED_LOCATION/'edge_numeral' \
		"${DBPEDIA_DATA_LOCATION}${filelist}"
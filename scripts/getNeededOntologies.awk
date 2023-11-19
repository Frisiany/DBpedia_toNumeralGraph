#!/usr/bin/awk -f

BEGIN {

    # Read the temporary URI file into an array
    while ((getline < temp_uri_file) > 0) {
        tempURIs[$0] = 1
    }
    close(temp_uri_file)
}

# Process each line in the INSTANCE_TYPE_FILE
{
    # Check if the line meets the specified conditions
    if ($1 in tempURIs && $2 == type_edge_uri && $3 ~ /^<http:\/\/dbpedia\.org\/ontology/) {
        # Print the third URI to the output file
        print $3 > output_location
    }
}

END {
    # Clean up and close the output file
    close(output_location)
}

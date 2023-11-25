#!/usr/bin/awk -f

BEGIN {

	while ((getline < node_id_file) > 0 ){
		node_ids[$2]=$1
	}

	while ((getline < edge_id_file) > 0 ){
		edge_ids[$2]=$1
	}

}

{
	print "" > output_file  # Create or clear the output file

    if ($0 ~ /^#/ ) {  # Check if the line starts with #
    	print $0 >> output_file
        next;        
    }
    if( NF == 0 ){
    	next;
    }

	if(!node_ids[$1]){
		print "node ID not found for node " $1
	}
	if(!node_ids[$3]){
		print "node ID not found for node " $3
	}
	if(!edge_ids[$2]){
		print "edge ID not foud for edge " $2
	}
	printf "# %s 's node id: %s \n", $1, node_ids[$1] >> output_file
	printf "# %s 's node id: %s \n", $3, node_ids[$3] >> output_file
	printf "# %s 's edge id: %s \n\n", $2, edge_ids[$2] >> output_file
	printf "%s\t%s\t%s\t\n\n", node_ids[$1], node_ids[$3], edge_ids[$2] >> output_file
}

END {
	close(node_id_file)
	close(edge_id_file)
}
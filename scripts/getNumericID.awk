#!/usr/bin/awk -f

BEGIN { 

    while ((getline < ontology_file) > 0) {
    	if(!onto_Labels[$0]){
	        onto_Labels[$0] = ++label
        	print label, $0 > id_ontology_output_file
    	}
    }

    while ((getline < instance_type_file) > 0){

    	if(onto_Labels[$3] && !node_ids[$1]) {
			node_ids[$1] = ++node_id

			print node_id, $1 > id_node_output_file
			print node_id, onto_Labels[$3] > nodeID_ontology_map_file
    	}
    }
}


{

	if(node_ids[$1] && node_ids[$3]){

		if(!node_ids[$1]){
			node_ids[$1] = ++node_id
			print node_id, $1 > id_node_output_file
		}

		if(!node_ids[$3]){
			node_ids[$3] = ++node_id
			print node_id, $1 > id_node_output_file
		}

		if(!edge_ids[$2]){
		
			edge_ids[$2] = ++edge_id
			print edge_id, $2 > id_edge_output_file
		}

		# print node_ids[$1], edge_ids[$2], node_ids[$3] > numeral_graph_output_file
		print node_ids[$1], node_ids[$3], edge_ids[$2] > numeral_graph_output_file
	} 
}

END {
    # Clean up and close the output file
    close(id_ontology_output_file)
    close(id_node_output_file)
    close(id_edge_output_file)
    close(nodeID_ontology_map_file)
    close(numeral_graph_output_file)
}
#!/usr/bin/awk -f

BEGIN{
	while ((getline < node_id_file) > 0) {
        node_id_name_map[$1] = $2
    }
    close(node_id_file)
}


# Process each line in edge 
{
	if(!node_id_name_map[$1] && !node_id_name_map[$2]){
		outdegree[$1] = outdegree[$1]+1
		indegree[$2] = indegree[$2]+1
	}
}

END{
	for (nodeid in node_id_name_map){
		print nodeid, indegree[nodeid], outdegreep[nodeid], node_id_name_map[nodeid] \
			> output_location
	}

	close(output_location)
}

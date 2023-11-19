#!/usr/bin/awk -f

BEGIN{
	while ((getline < node_id_file) > 0) {
        node_id_name_map[$1] = $2
    }
    close(node_id_file)

    print "|	Loaded node's ID_NAME map!"
}


# Process each line in edge 
{
	if(node_id_name_map[$1] && node_id_name_map[$2]){
		outdegree[$1]++
		indegree[$2]++
	}
}

END{
	print "|	In/Out degree info getting process finished, writing in/out degree info into: ", output_location
	for (nodeid in node_id_name_map){
		 printf("%s %d %d \"%s\"\n", nodeid, indegree[nodeid], outdegree[nodeid], node_id_name_map[nodeid]) \
		 	> output_location
	}

	close(output_location)
}

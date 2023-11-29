## 1. Process Graph $ Queries
### 1.1 Graph
1. change variable `[[DBPEDIA_DATA_LOCATION]]` in `./scripts/process.sh` accordingly.
2. runs `./scripts/process.sh`.(outputs stores in `./processed`)
3. runs `./utils/forGraphfile/run.sh`.(outputs stores in `./processed/graphfiles`)

### 1.2 Query
1. specify query graph in RDF format, stores in `./utils/forQueries/queries`
2. runs `./utils/for Queries/run.sh`

## 2. Output Docs
- in `./processed`
	- `edge_id`, stores edge labels' ID.(formatted in labelID -> edgeLabel)(e.g. 9 <http://dbpedia.org/ontology/birthYear>)
	- `node_id`, stores nodes' ID.(formatted in nodeID -> nodeURIs)(e.g 4 <http://dbpedia.org/resource/Abraham_Lincoln>)
	- `ontology_id`, stores ontologies' ID.(formatted in ontologyID -> ontology's URIs)(e.g. 3 <http://dbpedia.org/ontology/Actor>)
	- `edge_numeral`, used nodeID and edgeLabelID to represent an edge.(formatted startNodeID endNodeID edgeLabelID)(e.g. 1 3243479 2)

- in `./processed/graphfiles`
	- `dbpedia-sin.graph` numeral edge (node_ids[1], node_ids[3], edge_ids[2])(it's content is equals to `./processed/edge_numeral`)
	- `dbpedia-sout.graph` numeral edge (node_ids[3], node_ids[1], edge_ids[2])
	- `dbpedia-nodes-in-out-name.tsv`, stores indegree and outdegree for each nodes.(formatted in NodeID Indegree Outdegree ReadableName)(e.g. 1820984 13 4 "<http://dbpedia.org/resource/Harry_Liedtke>")
	- `label-frequencies.csv`, stores frequency for each edge labels.(formatted in edgeLabelID frequency)(e.g. 8 2262599)
	- `dbpedia-labels-mid.txt`, stores mapping infos about edge labels' ID.(formatted in edgeLabel -> labelID)(e.g. <http://dbpedia.org/ontology/deathYear> 10)(generated from `./processed/edge_id`)

- in `./processsed/queryfiles`
	- processed query file(ends with `.query`), each edge in one line with format like (startNodeID endNodeID edgeLabelID)



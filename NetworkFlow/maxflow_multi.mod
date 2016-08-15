/**********************/
/* Declare index sets */
/**********************/


set NODES;
set SOURCES within NODES;
set SINKS within NODES;
set EDGES within (NODES cross NODES);
set BUSES;
set ROUTE{BUSES} within EDGES;


/**********************/
/* Declare parameters */
/**********************/

/* Source and sink */

/*param s, symbolic, in SOURCES;  # source nodes*/
/*param t, symbolic, in SINKS;  # sink nodes*/

/* Capacity */

/* Compute capacity of each edge using freq and load of buses */
param freq{BUSES};          # number of buses per hour
param load{BUSES};          # number of passengers per bus

param capacity{(i,j) in EDGES} :=
    sum{b in BUSES : (i,j) in ROUTE[b] or (j,i) in ROUTE[b]} 
        freq[b] * load[b];  # number of passengers per hour

/* Coordinates */

param coord{NODES, {'long', 'lat'}};


/***************************************/
/* Form and solve optimization problem */
/***************************************/

/* Declare variables */
var Flow{(i,j) in EDGES} >=0, <= capacity[i,j];
var f >=0;

/* Declare objective function */
maximize total_flow: f;

/* Declare constraints */
subject to source_flow:
    + sum{(j,i) in EDGES : i in SOURCES} Flow[j,i]  # Flow entering source node s
    - sum{(i,j) in EDGES : i in SOURCES} Flow[i,j]  # Flow leaving source node s
    == -f;
subject to sink_flow:
    + sum{(j,i) in EDGES : i in SINKS} Flow[j,i]  # Flow entering sink node t
    - sum{(i,j) in EDGES : i in SINKS} Flow[i,j]  # Flow leaving sink node t
    == f;
subject to flow_conservation {i in NODES diff {SOURCES union SINKS}}:
    + sum{(j,i) in EDGES} Flow[j,i]  # Flow entering i
    - sum{(i,j) in EDGES} Flow[i,j]  # Flow leaving i
    == 0;

/* Solve the optimization problem */
solve;


/****************/
/* Print output */
/****************/

/* Output solution to sol.txt */

printf "%20s%20s%16s%16s\n", 'i', 'j', 'Flow', 'capacity' > "sol.txt";
printf{(i,j) in EDGES}: "%20s%20s%16.0f%16.0f\n", 
    i, j, Flow[i,j], capacity[i,j] >> "sol.txt";
printf "Wrote solution to sol.txt\n";

/* Output node information to nodes.txt */

printf "%20s%16s%16s\n", 'Node', 'Longitude', 'Latitude' > "nodes.txt";
printf{n in NODES}: 
    "%20s%16f%16f\n", n, coord[n,'long'], coord[n,'lat'] >> "nodes.txt";
printf "Wrote node information to nodes.txt\n";

/* Output total flow into each sink and out of each source */

printf "SOURCE flow:\n";
printf{i in SOURCES}: "%20s%16.0f\n", i, -sum{(i,j) in EDGES} Flow[i,j]; 

printf "SINK flow:\n";
printf{i in SINKS}: "%20s%16.0f\n", i, sum{(j,i) in EDGES} Flow[j,i]; 

/* Output total flow */

printf "Total flow: %d passengers/hour\n", total_flow;


/****************/
/* End of model */
/****************/
end;

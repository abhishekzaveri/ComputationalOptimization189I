
/**********************/
/* Declare index sets */
/**********************/
set NODES;
set EDGES within (NODES cross NODES);
set BUSES;
set ROUTE{BUSES} within EDGES;


/**********************/
/* Declare parameters */
/**********************/

/* Source and sink */

param s, symbolic, in NODES;  # source node
param t, symbolic, in NODES;  # sink node
param unitcost;

/* Capacity */

/* Compute capacity of each edge using freq and load of buses */
param freq{BUSES};          # number of buses per hour
param load{BUSES};          # number of passengers per bus

param capacity{(i,j) in EDGES} :=
    sum{b in BUSES : (i,j) in ROUTE[b] or (j,i) in ROUTE[b]} 
        freq[b] * load[b];  # number of passengers per hour

/* Coordinates */

param coord{NODES, {'long', 'lat'}};

/****  Haversine function edge lengths ****/
param pi := 3.14159265358979;
param R := 6371; # mean radius of the Earth in km
param a{(i,j) in EDGES} :=
    sin(pi*( (coord[i,'lat'] - coord[j,'lat'])/2 )/180)^2 +
        (
        cos(pi*coord[i,'lat']/180) *
        cos(pi*coord[j,'lat']/180) *
        sin(pi*( (coord[i,'long'] - coord[j,'long'])/2 )
        /180)^2
        );
param dist{(i,j) in EDGES} :=
    2*R*atan( sqrt(a[i,j]), sqrt(1-a[i,j]) );
/*********************************************************/

param cost{(i,j) in EDGES} := 
                unitcost * dist[i,j];



/***************************************/
/* Form and solve optimization problem */
/***************************************/

/* Declare variables */
var Flow{(i,j) in EDGES} >=0, <= capacity[i,j];
var f >=0;



/* Declare objective function */
minimize total_cost: sum{(i,j) in EDGES} cost[i,j] * Flow[i,j];


/* Declare constraints */

param demand {NODES} default 0;

subject to flow_conservation {i in NODES}:
    + sum{(j,i) in EDGES} Flow[j,i]  # Flow entering i
    - sum{(i,j) in EDGES} Flow[i,j]  # Flow leaving i
    == demand[i];
    




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
printf "%20s%16.0f\n", s, -sum{(s,j) in EDGES} Flow[s,j]; 

printf "SINK flow:\n";
printf "%20s%16.0f\n", t, sum{(j,t) in EDGES} Flow[j,t]; 

/* Output total flow */

printf "Min Cost: %d  \n", total_cost;

/*Output Dual Multipliers */

/* printf{(i,j) in EDGES}: "%20s,%20s, Dual: %f \n", i,j,Flow[i,j].dual; */

/****************/
/* End of model */
/****************/
end;

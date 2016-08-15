In this project, I solved the max-flow, min-cost flow, and min-cost multi-commodity flow optimization problems in a transportation network using linear programming. 

maxflow.mod implements the optimization problem for max flow in a linear program and calculates the optimal route. 

mincost.mod uses the haversine formula to compute the length of each edge in KM from the longitude/latitude coordinates of its endpoints. 

maxflow_multi.mod finds the maximum total flow from a set of nine source nodes subject to the same capacity constraints defined in mincost and max flow. 


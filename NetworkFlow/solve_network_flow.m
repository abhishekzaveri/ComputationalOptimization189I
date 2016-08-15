function solution = solve_network_flow(prob)

% Solve the network flow problem -- generates nodes.txt and sol.txt
cmd = sprintf('glpsol -m %s -d %s', prob.model, prob.data);
system(cmd);

% Load the data
nodeinfo = importdata('nodes.txt');
sol = importdata('sol.txt');

% Parse the data
solution.nodes = nodeinfo.textdata(2:end,1);
solution.coord = nodeinfo.data;
solution.edges = sol.textdata(2:end,1:2);
solution.flow = sol.data(:,1);
solution.cap = sol.data(:,2);

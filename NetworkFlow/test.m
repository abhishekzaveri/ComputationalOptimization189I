prob.model = 'multicommodity.mod';
prob.data = 'multicommodity.dat';
solution = solve_network_flow(prob);

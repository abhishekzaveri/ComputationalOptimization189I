
% 1.
!glpsol;
%%
% 2.
prob.model = 'maxflow.mod';
prob.data = 'maxflow.dat';
solution = solve_network_flow(prob);
h = plot_flow(solution, 'Max Flow');
%%
% 3.
% The bottleneck is highlighted in purple:
imshow('bottle.png');
%%
% 4.
!glpsol -m maxflow.mod -d maxflow.dat -o maxflow.sol;

% The edges with largest marginal value are:
% 1 Flow[KingswayBoundary,KingswayKnight]
 %                   NU           300             0           300             1 
 %    2 Flow[KingswayBoundary,Knight41st]
 %                   NU           600             0           600             1 
 %    3 Flow[KingswayBoundary,LougheedBoundary]
 %                   NU           200             0           200             1 
 %    4 Flow[KingswayBoundary,MarineBoundary]
 %                  NS             0             0             =             1 
 %
 % These edges correspond to the exact bottleneck I identified.

%%
% 5.
prob.model = 'maxflow_multi.mod';
prob.data = 'maxflow_multi.dat';
solution = solve_network_flow(prob);
d = plot_flow(solution,'maxflow multi');
%%
% 6.
prob.model = 'maxflow.mod';
prob.data = 'maxflow_skytrain.dat';
solution = solve_network_flow(prob);
f = plot_flow(solution,'maxflow skytrain');
%% 4.2
% 1. and 2.
prob.model = 'mincost.mod';
prob.data = 'mincost.dat';
solution = solve_network_flow(prob);
k = plot_flow(solution, 'Min Cost');
%
%%
% 3.
%          *MarineGranville, Marine41st     Dual: -0.426233* 
%  We can increase the capacity of the route with this edge( route 480) and
%  decrease the capacity of another route (say route 99).
prob.model = 'mincost.mod';
prob.data = 'mincost2.dat';
solution = solve_network_flow(prob);
%
%% 4.3
% 1.
prob.model = 'multicommodity.mod';
prob.data = 'multicommodity.dat';
solution = solve_network_flow(prob);

%
%% 
% 2.
% It seems like all the dual multipliers are positive, so increasing or
% decreasing an edge capacity would only increase cost?

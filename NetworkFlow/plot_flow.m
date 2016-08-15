function h = plot_flow(solution, pltname)
%PLOT_FLOW  Plots the flow obtained from solve_network_flow.
%
% h = plot_flow(SOLUTION, PLTNAME) plots the flow described in the
% structure SOLUTION, obtained from solve_network_flow; PLTNAME is the name
% used for the title of the figure.

nodes = solution.nodes;
coord = solution.coord;
edges = solution.edges;
flow = solution.flow;
cap = solution.cap;

n = length(nodes); % number of nodes

xmin = -123.26; xmax = -123.01;
ymin =   49.20; ymax =   49.29;

maxflowval = max(flow);

h = figure;
cmap = colormap(flipud(hot));
plot(coord(:,1), coord(:,2), 'o');
hold on
for ii = 1:n-1
    for jj = ii+1:n
        % Find the index of the edge (ii,jj)
        k1 = strcmp(nodes(ii), edges(:,1)) & strcmp(nodes(jj), edges(:,2));
        % Check that edge exists
        if any(k1)
            % Find the index of the edge in the opposite direction
            k2 = strcmp(nodes(jj), edges(:,1)) & strcmp(nodes(ii), edges(:,2));
            % Sum the flow in both directions
            maxedgeflow = max(flow(k1), flow(k2));
            xx = coord([ii jj], 1);  yy = coord([ii jj], 2);
            if round(maxedgeflow) > 0
                edgecolor = cmap(round(63*maxedgeflow/maxflowval)+1,:);
                plot(xx, yy, 'Color', edgecolor, 'LineWidth', 8);
            end
            % If edge at capacity, draw a red line, otherwise black dots
            if maxedgeflow == cap(k1)
               atcap = plot(xx, yy, 'r', 'LineWidth', 2);
            else
               notatcap = plot(xx, yy, 'k:', 'LineWidth', 2);
            end 
        end

    end
end
x = coord(:,1);  y = coord(:,2);
plot(x, y, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
axis equal
axis([xmin xmax ymin ymax]);
xlabel('Longitude'); ylabel('Latitude'); title('Vancouver');
colorbar; caxis([0 maxflowval]);
legend([atcap, notatcap], 'at capacity', 'not at capacity', ...
    'Location', 'SouthWest');
title(pltname);
hold off

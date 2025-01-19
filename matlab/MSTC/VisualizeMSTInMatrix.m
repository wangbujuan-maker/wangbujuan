function VisualizeMSTInMatrix(adjMatrix, mstMatrix)
    % Find the coordinates of all the '1's in the original adjMatrix
    [rows, cols] = find(adjMatrix == 1);
    
    % Generate node positions corresponding to the matrix layout
    n = length(rows);
    positions = [cols, -rows]; % Using cols as x and -rows as y for plotting

    % Create a graph from the MST matrix
    G = graph(mstMatrix);

    % Plot the MST in a matrix-like layout
    figure;
    gplot(mstMatrix, positions, '-o'); % Plot the edges with nodes in a matrix layout
    hold on;
    
    % Plot the nodes (1's in the original adjMatrix)
    scatter(positions(:, 1), positions(:, 2), 100, 'filled', 'r'); % Red dots for the nodes
    
    % Annotate the nodes with their indices
    for i = 1:n
        text(positions(i, 1) + 0.1, positions(i, 2), sprintf('(%d,%d)', rows(i), cols(i)), ...
            'FontSize', 10, 'Color', 'blue');
    end
    
    title('Minimum Spanning Tree (MST) with Matrix-like Layout');
    axis equal;
    hold off;
end



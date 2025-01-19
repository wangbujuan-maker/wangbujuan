% Example usage:
% Original adjacency matrix representing connectivity
adjMatrix = [999 1 1 999 999 999 999 999 999 999 999 999 1 999;%1-3
             1 1 1 999 999 1 1 1 1 1 1 1 1 1;%4-15
             1 1 1 1 1 1 1 1 1 1 1 1 1 1;%16-29
             999 999 1 1 1 1 1 1 1 1 1 1 1 1;%30-41
             1 1 1 1 1 1 1 1 1 1 1 1 1 999;%42-55
             999 1 1 1 1 1 1 999 1 1 1 999 999 999;%56-64
             1 1 1 999 1 1 1 999 1 1 1 999 999 999;%65-73
             1 1 1 999 1 1 1 1 1 1 999 999 999 999;%74-79
             999 1 1 999 1 999 1 1 1 1 999 999 999 999;%80-85
             999 999 999 999 1 999 1 1 1 999 999 999 999 999;%86-89
             999 999 999 999 999 999 1 1 999 999 999 999 999 999;%90-91
             999 999 999 999 999 999 1 1 1 999 999 999 999 999;%92-93
             999 999 999 999 999 999 1 1 999 999 999 999 999 999];%94-96

% Convert the original matrix to a cost matrix for the algorithms
% Inf represents no connection, 1 remains as a valid connection with a cost value
costMatrix = adjMatrix;
costMatrix(costMatrix == 999) = Inf;  % Change 999 to Inf for non-selectable points
costMatrix(costMatrix == 1) = 1;      % Ensure valid connections have a cost of 1 or another desired value
costMatrix=PosChangeDis(costMatrix);
% Run Prim and Kruskal algorithms using the cost matrix
mstprim = primAlgorithm(costMatrix);
mstkruskal = kruskalAlgorithm(costMatrix);

VisualizeMSTInMatrix(adjMatrix, mstprim);

disp('Minimum Spanning Tree Prim Adjacency Matrix:');
disp(mstprim);
disp('Minimum Spanning Tree Kruskal Adjacency Matrix:');
disp(mstkruskal);

% Plot the resulting MST using Prim's algorithm
Gprim = graph(mstprim, 'upper');
figure;
plot(Gprim, 'Layout', 'force');
title('Minimum Spanning Tree (Prim Algorithm)');

% Plot the resulting MST using Kruskal's algorithm
Gkruskal = graph(mstkruskal, 'upper');
figure;
plot(Gkruskal, 'Layout', 'force');
title('Minimum Spanning Tree (Kruskal Algorithm)');

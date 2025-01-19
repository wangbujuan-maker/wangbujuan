function mst = primAlgorithm(adjMatrix)
    % adjMatrix: n x n adjacency matrix representing the graph
    % mst: n x n matrix representing the minimum spanning tree

    n = size(adjMatrix, 1);          % Number of vertices
    selected = false(1, n);          % Tracks which vertices are included in the MST
    selected(1) = true;              % Start with the first vertex
    mst = zeros(n);                  % Initialize the MST adjacency matrix

    for edgeCount = 1:(n-1)
        minWeight = Inf;
        x = 0;
        y = 0;

        % Find the minimum weight edge from the set of selected vertices
        for i = 1:n
            if selected(i)
                for j = 1:n
                    if ~selected(j) && adjMatrix(i, j) < minWeight
                        minWeight = adjMatrix(i, j);
                        x = i;
                        y = j;
                    end
                end
            end
        end

        % Include this edge in the MST
        mst(x, y) = minWeight;
        mst(y, x) = minWeight;
        selected(y) = true;  % Mark the vertex as included
    end
end
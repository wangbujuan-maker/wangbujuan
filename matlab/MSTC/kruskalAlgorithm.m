function mst = kruskalAlgorithm(adjMatrix)
    % adjMatrix: n x n adjacency matrix representing the graph
    % mst: n x n matrix representing the minimum spanning tree

    n = size(adjMatrix, 1);          % Number of vertices
    edges = [];                      % Array to store edges and their weights
    parent = 1:n;                    % Union-Find structure to detect cycles

    % Extract all edges from the adjacency matrix
    for i = 1:n
        for j = i+1:n
            if adjMatrix(i, j) > 0 && adjMatrix(i, j) < Inf
                edges = [edges; i, j, adjMatrix(i, j)];
            end
        end
    end

    % Sort edges by weight
    edges = sortrows(edges, 3);
    mst = zeros(n);  % Initialize the MST adjacency matrix

    % Kruskal's algorithm
    for k = 1:size(edges, 1)
        u = edges(k, 1);
        v = edges(k, 2);
        w = edges(k, 3);

        % Find the root of the sets to which u and v belong
        root_u = findRoot(parent, u);
        root_v = findRoot(parent, v);

        % If they are in different sets, add this edge to the MST
        if root_u ~= root_v
            mst(u, v) = w;
            mst(v, u) = w;
            parent = union(parent, root_u, root_v);
        end
    end
end



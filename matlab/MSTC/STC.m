

% Example usage:
adjMatrix = [ 999 1 1 999 999 999 999 999 999 999 999 999 1 999;
              999 1 1 999 999 1 1 1 1 1 1 1 1 1;
              1 1 1 1 1 1 1 1 1 1 1 1 1 1;
              999 999 1 1 1 1 1 1 1 1 1 1 1 1;
              1 1 1 1 1 1 1 1 1 1 1 1 1 999;
              999 1 1 1 1 1 1 999 1 1 1 999 999 999;
              1 1 1 999 1 1 1 999 1 1 1 999 999 999;
              1 1 1 999 1 1 1 1 1 1 999 999 999 999;
              999 1 1 999 1 999 1 1 1 1 999 999 999 999;
              999 999 999 999 1 999 1 1 1 999 999 999 999 999;
              999 999 999 999 999 999 1 1 999 999 999 999 999 999;
              999 999 999 999 999 999 1 1 1 999 999 999 999 999;
              999 999 999 999 999 999 1 1 999 999 999 999 999 999];

mstprim = primAlgorithm(adjMatrix);
mstkruskal = kruskalAlgorithm(adjMatrix);

disp('Minimum Spanning Tree prim Adjacency Matrix:');
disp(mstprim);
disp('Minimum Spanning Tree kruskal Adjacency Matrix:');
disp(mstkruskal);

function UpdatedMatrix = EmbedMSTInAdjMatrix(adjMatrix, mstMatrix)
    % Initialize the updated matrix with the original adjMatrix
    UpdatedMatrix = adjMatrix;

    % Find the coordinates of all the '1's in the original matrix
    [rows, cols] = find(adjMatrix == 1);

    % Initialize a zero matrix of the same size as adjMatrix
    EmbeddedMatrix = zeros(size(adjMatrix));

    % Replace the '1's in EmbeddedMatrix with the corresponding MST values
    for i = 1:length(rows)
        if mstMatrix(rows(i), cols(i)) ~= 0  % Check if there is an edge in MST
            EmbeddedMatrix(rows(i), cols(i)) = mstMatrix(rows(i), cols(i));
            EmbeddedMatrix(cols(i), rows(i)) = mstMatrix(cols(i), rows(i)); % Ensure symmetry
        end
    end

    % Replace the corresponding positions in the original adjMatrix
    UpdatedMatrix(adjMatrix == 1) = EmbeddedMatrix(adjMatrix == 1);

    % Display the updated matrix
    disp('Updated Position Matrix with MST values:');
    disp(UpdatedMatrix);
end
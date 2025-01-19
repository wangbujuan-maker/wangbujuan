% function DistanceMatrix = PosChangeDis(Matrix)
%     % Find the coordinates of all the '1's in the original matrix
%     [rows, cols] = find(Matrix == 1);
%     n = length(rows); % Number of '1's
% 
%     % Initialize the new distance matrix
%     DistanceMatrix = zeros(n, n);
% 
%     % Calculate the Euclidean distance between each pair of '1's
%     for j = 1:n
%         for i = j+1:n
%             dist = sqrt((rows(i) - rows(j))^2 + (cols(i) - cols(j))^2);
%             DistanceMatrix(i, j) = dist;
%             DistanceMatrix(j, i) = dist; % Symmetric matrix
%         end
%     end
%     end
function DistanceMatrix = PosChangeDis(Matrix)
    % Display the original matrix
    disp('Original Position Matrix:');
    disp(Matrix);

    % Find the coordinates of all the '1's in the original matrix
    [rows, cols] = find(Matrix == 1);
    n = length(rows); % Number of '1's

    % Initialize the new distance matrix
    DistanceMatrix = zeros(n, n);

    % Calculate the Euclidean distance between each pair of '1's
    for i = 1:n
        for j = i+1:n
            dist = sqrt((rows(i) - rows(j))^2 + (cols(i) - cols(j))^2);
            DistanceMatrix(i, j) = dist;
            DistanceMatrix(j, i) = dist; % Symmetric matrix
        end
    end

    % Display the calculated distance matrix
    disp('Euclidean Distance Matrix:');
    disp(DistanceMatrix);
end

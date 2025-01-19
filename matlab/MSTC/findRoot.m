function root = findRoot(parent, i)
    % Find the root of the set in which element i is present
    while parent(i) ~= i
        i = parent(i);
    end
    root = i;
end
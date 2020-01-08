function [A] = indexer(a)
    A = zeros(size(a));
    u = unique(a);
    for i = 1:size(u)
        A(a == u(i)) = i;
    end
end
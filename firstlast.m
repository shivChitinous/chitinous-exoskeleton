function [x,y] = firstlast(PFC)
    splitcells = regexp(PFC, ';', 'split');
    x = [];
    y = [];
    n = size(PFC,1);
    for i = 1:n
        x = vertcat(x, splitcells{i,:}(1,1));
        y = vertcat(y, splitcells{i,:}(1,end));
    end
    x = cellfun(@str2num, x);
    y = cellfun(@str2num, y);
end
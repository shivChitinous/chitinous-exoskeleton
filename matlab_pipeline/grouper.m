function [groups,fNT] = grouper(NT, T)
    x = confusionmat(T, NT);
    [~,idx] = max(x);
    groups = idx;
    fNT = NT;
    for i = 1:size(groups,2)
        fNT(NT==i) = groups(:,i);
    end          
end

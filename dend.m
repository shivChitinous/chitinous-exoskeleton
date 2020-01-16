function dend(data)
    z = linkage(data,'ward');
    dendrogram(z);
end
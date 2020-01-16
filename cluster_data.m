function T = cluster_data(data,n)
    z = linkage(data,'ward','euclidean');
    T = cluster(z,'maxclust',n);
end

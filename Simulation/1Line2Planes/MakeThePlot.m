% i: the number of clusters
i=5;
idx1=spectral_clustering(A,i);
idx1=kmeans(idx1,i);
scatter3(D(:,1),D(:,2),D(:,3),3,idx1,'filled')
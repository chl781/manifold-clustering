scatter3(D(:,1),D(:,2),D(:,3),3,idx,'filled')

idx1=spectral_clustering(A,4);
idx1=kmeans(idx1,4);
scatter3(D(:,1),D(:,2),D(:,3),3,idx1,'filled')
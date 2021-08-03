scatter(D(:,1),D(:,2),3,YourColor2(idx,:),'filled')

%i is number of clusters
i=3;
idx1=spectral_clustering(A,i);
idx1=kmeans(idx1,i);
scatter(D(:,1),D(:,2),3,YourColor2(idx,:),'filled')
function d=dis_pca_path(path)
% compute the average distance between each point to the pca line for a
% path
% path is n*m, here m is the dimension, n is the number of points 
w=pca(path);
bar=mean(path)';
[n,~]=size(path);
d=0;
for i=1:n
    pt=path(i,:)';
    d=d+dis_pca_point(pt,w,bar);
end
d=d/n;
end


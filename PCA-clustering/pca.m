function w=pca(XY)
%compute eigenvector corresponding to the largest eigenvalue
%data is n*m, here m is the dimension, n is the number of data
[~,n]=size(XY);
V=(XY-mean(XY))'*(XY-mean(XY));
[w1,~]=eig(V);
w=w1(:,n);
end
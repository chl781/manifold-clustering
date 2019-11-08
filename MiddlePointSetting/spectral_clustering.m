function eigenvec=spectral_clustering(A)
% The function is used to produce the eigenvectors of the laplacian
% l: the number of eigenvectors we choose
n1=size(A,1)-rank(A);
D=diag(sum(A));
L=D-A;
[W,~]=eig(L);

eigenvec=W(:,n1+2);
end
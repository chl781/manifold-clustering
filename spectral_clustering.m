function eigenvec=spectral_clustering(A,l)
% The function is used to produce the eigenvectors of the laplacian
% l: the number of eigenvectors we choose
[n,~]=size(A);
D=zeros(n,n);
D2=D;
for i=1:n
    D(i,i)=sum(A(i,:));
    D2(i,i)=1/sqrt(D(i,i));
end
L=diag(ones(1,n))-D2*A*D2;
[~,~,W]=eig(L);

eigenvec=W(:,1:l);
end
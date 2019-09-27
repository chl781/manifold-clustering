function eigenvec=spectral_clustering(A,l)
% produve the eigenvector of A
%l shows the number of eigenvectors we choose
[n,~]=size(A);
D=zeros(n,n);
D2=D;
for i=1:n
    D(i,i)=sum(A(i,:));
    D2(i,i)=1/sqrt(D(i,i));
end
L=diag(ones(1,n))-D2*A*D2;
[eigenvector,eigenvalue]=eig(L);

[~,ord]=sort(diag(eigenvalue));
eigenvec=eigenvector(:,ord(1:l));
end
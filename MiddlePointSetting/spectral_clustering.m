function eigenvec=spectral_clustering(A)
% The function is used to produce the eigenvectors of the laplacian
% l: the number of eigenvectors we choose
%%%%%%%%% There is a problem!
%n1=sum(sum(A)==0);
D=diag(sum(A));
D1=zeros(size(A,1));
for i=1:size(A,1)
    D1(i,i)=1/sqrt(D(i,i));
    if D(i,i)==0
        D1(i,i)=1;
    end
end
L=D-A;
L1=D1*(D-A)*D1;
[W,s]=eig(L);
[W1,s1]=eig(L1);

%eigenvec=W(:,n1+2);
eigenvec=W(:,2);
end
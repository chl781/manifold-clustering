function eigenvec=spectral_clustering(A,s)
% The function is used to produce the eigenvectors of the laplacian
% l: the number of eigenvectors we choose
%%%%%%%%% There is a problem!
%n1=sum(sum(A)==0);
D=sparse(diag(sum(A)));
D1=sparse(size(A,1),size(A,1));
for i=1:size(A,1)
    D1(i,i)=1/sqrt(D(i,i));
    if D(i,i)==0
        D1(i,i)=1;
    end
end
%L=D-A;
L1=D1*(D-A)*D1;
L1new=speye(size(A,1))-L1;
%[W,s]=eigs(L,2);
[W1,s1]=eigs(L1new,10);
for i=1:10
    if abs(s1(i,i))<0.999999
        break
    end
end

%eigenvec=W(:,n1+2);
eigenvec=W1(:,i:i+s-2);
end
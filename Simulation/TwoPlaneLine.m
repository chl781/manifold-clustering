n1=4000;
P1=zeros(n1,3);
P1(:,1)=2-4*rand(n1,1);
P1(:,2)=2-4*rand(n1,1);
P1(:,3)=0;

P2=zeros(n1,3);
P2(:,1)=2-4*rand(n1,1);
P2(:,2)=0;
P2(:,3)=2-4*rand(n1,1);

n2=2000;
L1=zeros(n2,3);
L1(:,1)=0;
L1(:,2)=3-6*rand(n2,1);
L1(:,3)=1.2;

XY=[P1;P2;L1];
[A,~] = main_PBC2(XY,180,90,30,10,3);
% This example needs to modify the spectral clustering algorithm.

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
[W1,s1]=eigs(L1new,100);
for i=1:100
    if abs(s1(i,i))<0.99999
        break
    end
end

idx=kmeans(W1(:,i:(i+2)),3);
scatter3(XY(:,1),XY(:,2),XY(:,3),3,idx,'filled')
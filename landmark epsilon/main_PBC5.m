function [A,idx1]=main_PBC5(X,r,alpha,s1,m)
%
%
%
[n,~] = size(X);

landmark=unidrnd(m,1,n);


DD=zeros(n,n);
for i=1:n
    for j=i+1:n
        s=norm(X(i,:)-X(j,:));
        if s<r && s>0
            DD(i,j)=s;
            DD(j,i)=DD(i,j);
        end
    end
end


   A = zeros(n,m);

for i=1:m
    M=findepsilon1(X,DD,landmark(i),alpha);
    t=length(M);
    if any(M~=0)
       A(M,i)=ones(t,1);
    end
end

idx1=kmeans(A,s1);
%gscatter(X(:,1),X(:,2),idx);
end
function degree=CheckDegree(a)

[m,n]=size(a);

deg1=zeros(m-2,1);
for i=1:m-2
    deg1(i)=sum(a(i,:).*a(i+1,:))/norm(a(i,:),2)/norm(a(i+1,:),2);
end
degree=sum(deg1);


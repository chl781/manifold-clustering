function t1Iter=Itert1(t1,path)
[m,n]=size(path);
a=ones(m-1,n);
for i=1:m-1
    a(i,:)=t1(i)*path(i,:)+(1-t1(i))*path(i+1,:);
end
t1Iter=t1;

for i=1:m-3
    b=a(i+2,:)-a(i+1,:);
    t=(b(1)*path(i+1,2)-path(i+1,1)*b(2))/(b(2)*(path(i+1,1)-path(i,1))-b(1) ...
    *(path(i+1,2)-path(i,2)));
    if t<1&&t>0
        t1Iter(i)=t;
        a(i,:)=t*path(i,:)+(1-t)*path(i+1,:);
    end

    if t>=1
        t1Iter(i)=1;
        a(i,:)=path(i,:);
    end

    if t<=0
        t1Iter(i)=0.0001;
        a(i,:)=0.0001*path(i,:)+0.9999*path(i+1,:);
    end
end

%i=m-2
b=a(m-1,:)-a(m-3,:);
t=(b(1)*path(m-1,2)-path(m-2,1)*b(2))/(b(2)*(path(m-1,1)-path(m-2,1))-b(1) ...
    *(path(m-1,2)-path(m-2,2)));
if t<1&&t>0
    t1Iter(m-2)=t;
    a(m-2,:)=t*path(m-2,:)+(1-t)*path(m-1,:);
end

if t>=1
    t1Iter(m-2)=1;
    a(m-2,:)=path(m-2,:);
end

if t<=0
    t1Iter(m-2)=0.0001;
    a(m-2,:)=0.9999*path(m-1,:)+0.0001*path(m-2,:);
end

%i=m-1
b=a(m-2,:)-a(m-3,:);
t=(b(1)*path(m,2)-path(m,1)*b(2))/(b(2)*(path(m,1)-path(m-1,1))-b(1) ...
    *(path(m,2)-path(m-1,2)));
if t<1&&t>0
    t1Iter(m-1)=t;
    a(m-1,:)=t*path(m-1,:)+(1-t)*path(m,:);
end

if t>=1
    t1Iter(m-1)=1;
    a(m-1,:)=path(m-1,:);
end

if t<=0
    t1Iter(m-1)=0;
    a(m-1,:)=path(m,:);
end
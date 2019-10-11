function M=findkNN(X,D,k,k1,i,epsilon)
%This is for finding index of the nearest k nodes of i-th nodes which are
%according to the constrain.
%output is the connected point to i-th node.
%This is for 'or'.
M=0;
s1=D(i,:);
[~,I]=mink(s1,k+1);% the smallest one corresponds to 0 distance.
Dt=D(I,I);
p=1;
for s=2+k1:k+1
    [~,geodesic]=dijkstra(Dt,s,1);
    path=X(I(geodesic),:); 
    pathLength=length(geodesic);
    flag=1;
    for j=2:pathLength-1
        if (sum((path(j,:)-path(1,:)).*(path(end,:)-path(j,:)))/ ...
            norm(path(j,:)-path(1,:),2)/norm(path(end,:)-path(j,:),2))<epsilon
            flag=0;
            break
        end
    end
    if flag==1
        M(p)=I(s);
        p=p+1;
    end
end
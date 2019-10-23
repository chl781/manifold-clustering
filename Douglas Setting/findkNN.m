function M=findkNN(X,D,k,k1,i,epsilon,epsilon1)
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
    if pathLength<=4 % Set if two nodes are not far away, we drop the connection.
        break
    end
    if pathLength>=5 % These two parameters 4 and 5 can be changed
        a=dpsimplify(path,epsilon1);
    end
    while size(a,1)<=2 && epsilon1>=0.001 % Ensure at least has one angle.
        epsilon1=epsilon1/2;
        a=dpsimplify(path,epsilon1);
    end
    aDirection=a(2:end,:)-a(1:end-1,:);
    if determineifcontrain(aDirection,epsilon)
        M(p)=I(s);
        p=p+1;
    end
end
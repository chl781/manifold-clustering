function M=findkNN(X,D,k,i,epsilon)
%This is for finding index of the nearest k nodes of i-th nodes which are
%according to the constrain.
%output is the connected point to i-th node.
%This is for 'or'.
M=0;
s=D(i,:);
[~,I]=mink(s,k+1);% the smallest one corresponds to 0 distance.
Dt=D(I,I);
p=1;
for s=2:k+1
    [~,geodesic]=dijkstra(Dt,s,1);
    path=showgdirection(X,geodesic); 
    if determineifcontrain(path,epsilon)==1
        M(p)=I(s);
        p=p+1;
    end
end
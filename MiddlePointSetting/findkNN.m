function M=findkNN(X,D,k,k1,i,epsilon,epsilon1)
%This is for finding index of the nearest k nodes of i-th nodes which are
%according to the constrain.
%output is the connected point to i-th node.
%This is for 'or'.
[~,n]=size(X);
M=zeros(1,k-k1);
s1=D(i,:);
[~,I]=mink(s1,k+1);% the smallest one corresponds to 0 distance.
Dt=D(I,I);
for s=2+k1:k+1
    [~,geodesic]=dijkstra(Dt,s,1);
    path=X(I(geodesic),:); 
    pathLength=length(geodesic);
    if pathLength<=4 % Set if two nodes are too close, we drop the connection.
        continue
    end
    if pathLength>=5 % These two parameters 4 and 5 can be changed
        t1=SmoothTheCurve(path,epsilon1);
    end
    a=ones(pathLength-1,n);
    for i=1:pathLength-1
        a(i,:)=t1(i)*path(i,:)+(1-t1(i))*path(i+1,:);
    end
    aDirection=a(2:end,:)-a(1:end-1,:);
    if determineifcontrain(aDirection,epsilon)
        M(s-k1-1)=I(s);
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %still just trying though
    %if ~all(M) %add a modification step to prevent the singular situation.
    %    M(1)=I(2);
    %end
end
M=M(M~=0);
function M=findkNN(X,D,k,k1,i,epsilon)
%,max_iter,num_step)
%This is for finding index of the nearest k nodes of i-th nodes which are
%according to the constrain.
%output is the connected point to i-th node.
%This is for 'or'.
[~,n]=size(X);
M=0;
s1=D(i,:);
[~,I]=mink(s1,k+1);% the smallest one corresponds to 0 distance.
Dt=D(I,I);
p=1;
for s=k1:k
    [~,geodesic]=dijkstra(Dt,s,1);
    realI=I(wrev(geodesic));
    path=X(realI,:); 
    pathLength=length(geodesic);
    if pathLength<=4 % Set if two nodes are far away, we drop the connection.
        break
    end
   % if pathLength>=5
  %      smooth_path=smooth(path,max_iter,num_step);
   % end
    if determineifcontrain(path,epsilon)
        M(p)=I(s);
        p=p+1;
    end
end
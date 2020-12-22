function M=findkNN2(X,nearnodes,k,k1,r,i,alpha,ratio)
% This is for the distancing version path algorithm to find the neighbor
%
%

%%%%%%%%%% Construct the form that fit the algorithm.

[nearnodes1,Distance1]=knnsearch(X(nearnodes(i,:),:),X(nearnodes(i,:),:),'K' ...
,r+1,'Distance','euclidean');

%[ Binary_matrix,path1] = Constraint_Dijkstra1( X(nearnodes(i,:),:),nearnodes1( ...
%:,2:r+1),Distance1(:,2:r+1),1,alpha);

%M=nearnodes(i,logical([zeros(1,k1+1),Binary_matrix(k1+2:k+1)']));

G=zeros(k+1);
t=zeros(k+1,1);
for j1=1:k+1
    for j2=1:k+1
        if j1~=j2
            if ismember(j2,nearnodes1(j1,:))
                G(j1,j2)=Distance1(j1,nearnodes1(j1,:)==j2);
            end
        end
    end
end
for j1=k1+2:k+1
    [e,~] = dijkstra1(X(nearnodes(i,:),:),G,1,j1,alpha);
    [e1,~]= dijkstra(G,1,j1);
    if e~=inf && e/e1<=ratio
        t(j1)=1;
    end
end
M=nearnodes(i,logical([zeros(1,k1+1),t(k1+2:k+1)']));
    
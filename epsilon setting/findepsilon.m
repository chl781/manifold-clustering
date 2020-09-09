function M=findepsilon(X,nearnodes,closenodes,epsilonminusepsilonplusnodes,i,alpha)
%
%
%

n=length(nearnodes)+1;
n1=length(epsilonminusepsilonplusnodes);
s=[i,nearnodes];
G=zeros(n,n);
M=[];

for j1=1:n
    for j2=j1+1:n
        if ismember(s(j2),closenodes{s(j1)})
            G(j1,j2)=norm(X(s(j1),:)-X(s(j2),:));
            G(j2,j1)=G(j1,j2);
        end
    end
end
for j1=1:n1
    
    [e,~] = dijkstra(X(s,:),G,1, ...
            find(nearnodes==epsilonminusepsilonplusnodes(j1))+1,alpha);
    if e~=inf
        M=[M,epsilonminusepsilonplusnodes(j1)];
    end
end
    
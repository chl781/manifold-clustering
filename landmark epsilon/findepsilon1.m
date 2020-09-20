function M=findepsilon1(X,DD,landmark,alpha)
%
%
%

M=[];
[n,~] = size(X);

for j1=1:n
    if j1~=landmark
        [e,~] = dijkstra(X,DD,landmark, ...
              j1,alpha);
        if e~=inf
            M=[M,j1];
        end
    end
end
    
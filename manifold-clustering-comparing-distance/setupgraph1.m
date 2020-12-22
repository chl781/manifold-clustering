function G = setupgraph1(X,G,b,s,u,alpha)
% Set as constrained version
% X is data matrix 
% G is distance matrix of X
% b is imputed number
% s is mode
% u is a direction vector
if s==1
    for i=1 : size(G,1)
        for j=1 :size(G,1)
            v=X(j,:)-X(i,:);
            if G(i,j)==0 || acos(((v*u')/(norm(v)*norm(u))))>(alpha*pi)/180
                G(i,j)=b;
            end
        end
    end
end
if s==2
    for i=1 : size(G,1)
        for j=1 : size(G,1)
            if G(i,j)==b
                G(i,j)=0;
            end
        end
    end
end
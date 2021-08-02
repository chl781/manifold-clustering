function [A,idx1]=main_PBC2(X,k,k1,r,alpha,s)
%
%
%
[n,~] = size(X);

[nearnodes,Distance]=knnsearch(X,X,'K',k+1,'Distance','euclidean');
%[nearnodes1,Distance1]=knnsearch(X,X,'K',r+1,'Distance','euclidean');
A = sparse(n,n);

for i=1:n
    if(mod(i,n/10)==0)
        %message = sprintf('%d % is complete, connection: %d. \n',i/n*10,sum(sum(A)));
        fprintf('%g percent is complete. \n',i/n*100)
        fprintf('connection: %g. \n',full(sum(sum(A))))
    end
    M=findkNN2(X,nearnodes,k,k1,r,i,alpha);
    t=length(M);
    if any(M~=0)
       A(i,M)=ones(1,t);
       A(M,i)=ones(t,1);
    end
end

idx =spectral_clustering(A,s);
idx1=kmeans(idx,s);
%gscatter(X(:,1),X(:,2),idx);
beep

end
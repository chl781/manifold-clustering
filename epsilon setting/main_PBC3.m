function [A,idx1]=main_PBC3(X,k,k1,r,alpha,s)
%
%
%
[n,~] = size(X);


nearnodes=cell(n,1);
closenodes=cell(n,1);
epsilonminusepsilonplusnodes=cell(n,1);
%construct epsilon_+,epsilon_- graph
for i=1:n
    for j=i+1:n
        a=norm(X(i,:)-X(j,:));
        if a<k && a>0
            nearnodes{i}=[nearnodes{i},j];
            nearnodes{j}=[nearnodes{j},i];
        end
        if a<k && a>k1
            epsilonminusepsilonplusnodes{i}=[epsilonminusepsilonplusnodes{i},j];
            epsilonminusepsilonplusnodes{j}=[epsilonminusepsilonplusnodes{j},i];
        end
        if a<r && a>0
            closenodes{i}=[closenodes{i},j];
            closenodes{j}=[closenodes{j},i];
        end
    end
end
%[nearnodes1,Distance1]=knnsearch(X,X,'K',r+1,'Distance','euclidean');
   A = sparse(n,n);

for i=1:n
    if(mod(i,n/10)==0)
        %message = sprintf('%d % is complete, connection: %d. \n',i/n*10,sum(sum(A)));
        fprintf('%g percent is complete. \n',i/n*100)
        fprintf('connection: %g. \n',full(sum(sum(A))))
    end
    M=findepsilon(X,nearnodes{i},closenodes,epsilonminusepsilonplusnodes{i},i,alpha);
    t=length(M);
    if any(M~=0)
       A(i,M)=ones(1,t);
       A(M,i)=ones(t,1);
    end
end

idx =spectral_clustering(A,s);
idx1=kmeans(idx,s);
%gscatter(X(:,1),X(:,2),idx);
end

function D=pdistancematrix(X,p)

n= size(X,1);
D=zeros(n,n);

for i=1:n
    for j=1:n
        D(i,j)= norm( X(i,:) - X(j,:) )^p;
    end
    
end

end
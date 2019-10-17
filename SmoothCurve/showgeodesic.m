function A=showgeodesic(X,geodesic)

k= length(geodesic);
A=zeros(k,2);

for i=1:k
    A(i,1)= X(geodesic(i),1);
    A(i,2)=X(geodesic(i),2);
end


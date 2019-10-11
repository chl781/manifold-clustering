function X=PointsSphere(n)

X= randn(n,2);
for i=1:n
a=norm(X(i,1:2));    
X(i,1:2) = X(i,1:2)/a;  
end

end


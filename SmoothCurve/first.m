function y=first(n)
y=zeros(n-1,n);
for i=1:(n-1)
    y(i,i)=1/2;
    y(i,i+1)=1/2;
end
end

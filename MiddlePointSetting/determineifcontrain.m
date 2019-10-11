function sign=determineifcontrain(path,epsilon)
% it is for determine if the path follows as constraint
% 'path': direction vector
% sign=1, path works; sign=0, path does not work
sign=1;
[n,~]=size(path);
if n==1
    return
end
for i=1:n-1
    a=sum(path(i,:).*path(i+1,:))/sqrt(sum(path(i,:).^2)*sum(path(i+1,:).^2));
    if a<epsilon
        sign=0;
        return
    end
end
    

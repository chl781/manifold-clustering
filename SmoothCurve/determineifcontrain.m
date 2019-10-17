function sign=determineifcontrain(path,epsilon)
% it is for determine if the path follows as constraint
% 'path': direction vector
% sign=1, path works; sign=0, path does not work
sign=1;
[n,~]=size(path);
if n==1
    return
end
for i=1:n-2
    p1=path(i+1,:)-path(i,:);
    p2=path(i+2,:)-path(i+1,:);
    a=deg(p1,p2);
    a=acos(a);
    if a>epsilon
        sign=0;
        return
    end
end
    

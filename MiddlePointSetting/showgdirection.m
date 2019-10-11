function path=showgdirection(X,geodesic)

path_length=length(geodesic);
[~,m]=size(X);
path=zeros(path_length-1,m);
for s=1:path_length-1
    path(s,:)=X(geodesic(s+1),:)-X(geodesic(s),:);
end

end
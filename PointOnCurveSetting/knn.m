function l=knn(D,k,i)
% this function gives knn of point(index) indexed i 
% D is distance matrix
% k is number of nearest neighbors

l=zeros(1,k);
knnValue=mink(D(i,:),k);
for n=1:length(knnValue)
    l(n)=find(D(i,:)==knnValue(n))
end
end

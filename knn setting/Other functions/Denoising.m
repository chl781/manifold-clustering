% Denoising Steps
% Return for the center of nearest points
function Y=Denoising(X,k)

[nearnodes,Distance]=knnsearch(X,X,'K',k+1,'Distance','euclidean');
Y=X;
for i=1:size(X,1)
    Z=mean(X(nearnodes(i,2:k+1),:));
    [v,~,~]=eig((X(nearnodes(i,2:k+1),:)-Z)'*(X(nearnodes(i,2:k+1),:)-Z));
    v=v(:,end);
    S=Z'+v*(X(i,:)*v-Z*v);
    Y(i,:)=S';
end
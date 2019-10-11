% simulate a plane and obtain its distance matrix, 
% then obtain knn connection matrix for a given index;
% find shortest paths for each knn and plot the path

p=plane(1000);
Dp=pdistancematrix(p,2);
index=1;
indexs=knn(Dp,30,index);
Dknn=Dp(knn1,knn1);
for n = 2:30
    [e L]=dijkstra(Dknn,1,n);
    realI=wrev(indexs(L));
    scatter3(p(:,1),p(:,2),p(:,3),3,'yellow');
    hold on;
    scatter3(p(realI(1),1),p(realI(1),2),p(realI(1),3),5,'blue');
    hold on;
    line(p(realI,1),p(realI,2),p(realI,3),'color','red');
    view(3);
    hold on;
end


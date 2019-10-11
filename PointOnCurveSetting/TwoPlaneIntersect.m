% simulate two intersecting planes and obtain the path from the point on intersecting line, 
% plot the knn of the point also.

p1=plane(2000);
p2=plane(2000);
p3(:,1)=p2(:,3);
p3(:,2)=p2(:,2);
p3(:,3)=p2(:,1);
p=[p1;p3];
scatter3(p(:,1),p(:,2),p(:,3),3,'filled')
a=[0,0,0];
p=[a;p];
Dp=pdistancematrix(p,2);
index=1;
indexs=knn(Dp,30,index);
Dknn=Dp(indexs,indexs);
for n = 2:30
    [e L]=dijkstra(Dknn,1,n);
    realI=wrev(indexs(L));
    scatter3(p(:,1),p(:,2),p(:,3),3,'green');
    hold on;
    scatter3(p(realI(1),1),p(realI(1),2),p(realI(1),3),5,'blue');
    hold on;
    line(p(realI,1),p(realI,2),p(realI,3),'color','red');
    view(3);
    hold on;
end
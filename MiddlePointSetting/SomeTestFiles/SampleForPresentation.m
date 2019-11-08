%Some Presentation plots

%two balls intersecting Fig. 8
ns=2000;
angle1=rand(1,ns)*2*pi;
angle2=acos(rand(1,ns)*2-1);
r=ones(1,ns);
x1=r.*cos(angle1).*sin(angle2);
y1=r.*sin(angle1).*sin(angle2);
z1=r.*cos(angle2);
angle3=rand(1,ns)*2*pi;
angle4=acos(rand(1,ns)*2-1);
x2=sqrt(2)+r.*cos(angle3).*sin(angle4);
y2=r.*sin(angle3).*sin(angle4);
z2=r.*cos(angle4);
X=[x1;y1;z1];
Y=[x2;y2;z2];
XY=[X,Y]';
[A,W] = PBC_main(XY,60,30,0.95,3,0.01);
scatter3(XY(:,1),XY(:,2),XY(:,3),3,W,'filled')
saveas(scatter3(XY(:,1),XY(:,2),XY(:,3),3,'filled'),'PresentationPlot/1/TwoBalls.jpg')
saveas(scatter3(XY(:,1),XY(:,2),XY(:,3),3,W,'filled'),'PresentationPlot/1/TwoBallsManifold.jpg')

%knn 
B=zeros(4000,4000);
for i=1:4000
    a1=knnsearch(XY,XY(i,:),'K',31);
    B(i,a1(2:31))=ones(1,30);
    B(a1(2:31),i)=ones(30,1);
end

W2=spectral_clustering(B);
scatter3(XY(:,1),XY(:,2),XY(:,3),3,W2,'filled')
%scatter(1:4000,W2,3)

saveas(scatter3(XY(:,1),XY(:,2),XY(:,3),3,W2,'filled'),'PresentationPlot/1/TwoBallsKnn.jpg')

kmean2=kmeans(W2,2);
kmean1=kmeans(W,2);
%sum(kmean2(1:2000)==2)+sum(kmean2(2001:4000)==1))
fault1=[find(kmean1(1:2000)==2);find(kmean1(2001:4000)==1)];
fault2=[find(kmean2(1:2000)==1);find(kmean2(2001:4000)==2)];
scatter3(XY(:,1),XY(:,2),XY(:,3),3,'green','filled')
hold on;
scatter3(XY(fault1,1),XY(fault1,2),XY(fault1,3),3,'black','filled')
scatter3(XY(:,1),XY(:,2),XY(:,3),3,'green','filled')
hold on;
scatter3(XY(fault2,1),XY(fault2,2),XY(fault2,3),3,'filled')

figure;
subplot(2,1,1);hold on
scatter3(XY(:,1),XY(:,2),XY(:,3),3,kmean2,'filled')
title("Epsilon Setting");
subplot(2,1,2);hold on
scatter3(XY(:,1),XY(:,2),XY(:,3),3,kmean1,'filled')
title("Path approach")



figure;
subplot(2,2,1);hold on
scatter3(XY(:,1),XY(:,2),XY(:,3),3,'filled')
title("Original Data");
subplot(2,2,3);hold on
scatter3(XY(:,1),XY(:,2),XY(:,3),3,W,'filled')
title("Path approach")
subplot(2,2,4);hold on
scatter3(XY(:,1),XY(:,2),XY(:,3),3,W2,'filled')
title("Epsilon Setting");

%intersecting curve
N=2000;
th=linspace(-pi,2*pi,N);
R=3;
x=R*cos(th)+linspace(0,6,N);
y=R*sin(th)+linspace(0,1,N);
plot(x,y,'b');
X_selfintersect=[x',y'];
[A_selfintersect,W_selfintersect] = PBC_main(X_selfintersect,30,15,0.9,3,0.01);

% W: eigenvector
scatter(X_selfintersect(:,1),X_selfintersect(:,2),3,W_selfintersect)
saveas(scatter(X_selfintersect(:,1),X_selfintersect(:,2),3) ...
,'PresentationPlot/IntersectCurve.jpg')

%epsilon setting
B=zeros(N,N);
epsilon=0.2;
for i=1:N
    for j=i+1:N
        if norm(X_selfintersect(i,:)-X_selfintersect(j,:),2)<=epsilon
            B(i,j)=1;
            B(j,i)=1;
        end
    end
end

W2=spectral_clustering(B);
scatter(X_selfintersect(:,1),X_selfintersect(:,2),3,W2,'filled')
saveas(scatter(X_selfintersect(:,1),X_selfintersect(:,2),3,W2,'filled') ...
    ,'PresentationPlot/IntersectCurveEpsilonSetting.jpg')

figure;
subplot(2,2,1);hold on
scatter(X_selfintersect(:,1),X_selfintersect(:,2),3)
title("Original Data");
subplot(2,2,3);hold on
scatter(X_selfintersect(:,1),X_selfintersect(:,2),3,W_selfintersect)
title("Path approach")
subplot(2,2,4);hold on
scatter(X_selfintersect(:,1),X_selfintersect(:,2),3,W2,'filled')
title("Epsilon Setting");

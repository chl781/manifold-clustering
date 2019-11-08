x=0;y=0;s=2000;r=1;

ang=rand(1,s)*2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
X1=[x+xp;y+yp]';

x=sqrt(2);y=0;r=1;

ang=rand(1,s)*2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
X2=[x+xp;y+yp]';

XY=[X1;X2];

[A1,W1] = PBC_main(XY,30,15,0.995,2.5,0.01);

scatter(XY(:,1),XY(:,2),3,W1,'filled')
scatter(1:4000,W1)
saveas(scatter(XY(:,1),XY(:,2),3,W1,'filled'),'PresentationPlot/2/TwoCirlesPathApproach.jpg')
saveas(scatter(XY(:,1),XY(:,2),3,'filled'),'PresentationPlot/2/TwoCirles.jpg')

sum(W(1:2000)<0)

sum(W(2001:4000)>0)

%knn 
B=zeros(4000,4000);
for i=1:4000
    a1=knnsearch(XY,XY(i,:),'K',31);
    B(i,a1(2:31))=ones(1,30);
    B(a1(2:31),i)=ones(30,1);
end

W2=spectral_clustering(B);
scatter(XY(:,1),XY(:,2),3,W2,'filled')

saveas(scatter(XY(:,1),XY(:,2),3,W2,'filled'),'PresentationPlot/2/TwoCirclessKnn.jpg')

figure;
subplot(2,2,1);hold on
scatter(XY(:,1),XY(:,2),3,'filled')
title("Original Data");
subplot(2,2,3);hold on
scatter(XY(:,1),XY(:,2),3,W1,'filled')
title("Path approach")
subplot(2,2,4);hold on
scatter(XY(:,1),XY(:,2),3,W2,'filled')
title("Epsilon Setting");

kmean2=kmeans(W2,2);
kmean1=kmeans(W,2);

figure;
subplot(2,2,1);hold on
scatter(1:4000,W1,'filled')
title("Path approach Eigenvector");
subplot(2,2,2);hold on
scatter(1:4000,W2,'filled')
title("Knn Eigenvector");
subplot(2,2,3);hold on
scatter(XY(:,1),XY(:,2),3,kmean1,'filled')
title("Path approach kmeans");
subplot(2,2,4);hold on
scatter(XY(:,1),XY(:,2),3,kmean2,'filled')
title("knn kmeans");

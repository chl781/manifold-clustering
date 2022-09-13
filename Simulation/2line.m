ns=2000;
X1=2*(rand(1,ns)-0.5);
Y1=zeros(1,ns);
X=[X1;Y1];

ns=2000;
X2=2*(rand(ns,1)-0.5);
Y2=zeros(ns,1);
Y=[Y2,X2];
XY=[X,Y']';

[A,W] = main_PBC2(XY,90,60,15,10,2);
idx1=spectral_clustering(A,2);
idx=kmeans(idx1,2);
scatter(XY(:,1),XY(:,2),3,idx,'filled')

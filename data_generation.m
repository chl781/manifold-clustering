%This file is for data generating.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%two vertical segments Fig. 4
ns=2000;
X1=2*(rand(1,ns)-0.5);
Y1=zeros(1,ns);
X=[X1;Y1];
X2=2*(rand(ns,1)-0.5);
Y2=zeros(ns,1);
Y=[Y2,X2];
XY=[X,Y']';
%scatter(XY(:,1),XY(:,2),40,'MarkerEdgeColor',[0 .5 .5],...?
%'MarkerFaceColor',[0 .7 .7],...?
%'LineWidth',1.5)
[A,W] = PBC_main(XY,30,0.9,3,2);

scatter(XY(:,1),XY(:,2),2,W(:,1),'filled')
scatter(XY(:,1),XY(:,2),2,W(:,2),'filled')
saveas(scatter(XY(:,1),XY(:,2),2,W(:,1)),'example1eigen1.jpg')
saveas(scatter(XY(:,1),XY(:,2),2,W(:,2)),'example1eigen2.jpg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
x2=1.6+r.*cos(angle3).*sin(angle4);
y2=r.*sin(angle3).*sin(angle4);
z2=r.*cos(angle4);
X=[x1;y1;z1];
Y=[x2;y2;z2];
XY=[X,Y]';
%plot3(XY(1:end,1),XY(1:end,2),XY(1:end,3),'.')
[A,W] = PBC_main(XY,30,0.8,3,2);

scatter3(XY(:,1),XY(:,2),XY(:,3),2,W(:,1),'filled')
scatter3(XY(:,1),XY(:,2),XY(:,3),2,W(:,2),'filled')
saveas(scatter3(XY(:,1),XY(:,2),XY(:,3),2,W(:,1),'filled'),'example2eigen1.jpg')
saveas(scatter3(XY(:,1),XY(:,2),XY(:,3),2,W(:,2),'filled'),'example2eigen2.jpg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%one cone and one plane Fig. 3
ns=2000;
x1=(rand(1,ns)-0.5)*5;
y1=(rand(1,ns)-0.5)*5;
%z1=0.3+0.25*x1;
z1=0.4*ones(1,ns);

a=rand(2,ns);
H= 1;
R= 1;
h= H.*a(1,1:end);
H= H* ones(size(h));
R= R* ones(size(h));
r= (R/H).*(H-h);
P= (2*pi).*a(2,1:end);
x2= r.*cos(P);
y2= r.*sin(P);

X=[x1;y1;z1];
Y=[x2;y2;h];
XY=[X,Y]';
%plot3(XY(1:end,1),XY(1:end,2),XY(1:end,3),'.')
saveas(scatter3(XY(:,1),XY(:,2),XY(:,3),'.'),'example3.jpg')
[A,W] = PBC_main(XY,30,0.95,3,2);

scatter3(XY(:,1),XY(:,2),XY(:,3),2,W(:,1),'filled')
scatter3(XY(:,1),XY(:,2),XY(:,3),2,W(:,2),'filled')
saveas(scatter3(XY(:,1),XY(:,2),XY(:,3),2,W(:,1),'filled'),'example3eigen1.jpg')
saveas(scatter3(XY(:,1),XY(:,2),XY(:,3),2,W(:,2),'filled'),'example3eigen2.jpg')



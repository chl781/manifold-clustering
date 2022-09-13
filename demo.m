clc
clear all

addpath 'knn setting'

ns=8000;

angle1=rand(1,ns)*2*pi;
angle2=acos(rand(1,ns)*2-1);
r=ones(1,ns);
x1=r.*cos(angle1).*sin(angle2);
y1=r.*sin(angle1).*sin(angle2);
z1=r.*cos(angle2);
angle3=rand(1,ns)*2*pi;
angle4=acos(rand(1,ns)*2-1);
x2=1+r.*cos(angle3).*sin(angle4);
y2=r.*sin(angle3).*sin(angle4);
z2=r.*cos(angle4);
X=[x1;y1;z1];
Y=[x2;y2;z2];
XY=[X,Y]';

[A,idx] = main_PBC2(XY,100,60,15,10,2);
scatter3(XY(:,1),XY(:,2),XY(:,3),3,idx,'filled')

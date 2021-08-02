
n=4000;
% Two lines intersect with different angles.

x=rand(n,1)*2-1;
X1=[x,zeros(n,1)];

x=rand(n,1)*2-1;
X2=[x*cos(pi/180*50),x*sin(pi/180*50)];

XY=[X1;X2];

[A,idx]=main_PBC2(XY,20*6,20*4,20,8,2);
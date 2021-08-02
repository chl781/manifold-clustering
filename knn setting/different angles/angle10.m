n=12000;
% Two lines intersect with different angles.

x=rand(n,1)*2-1;
X1=[x,zeros(n,1)];

x=rand(n,1)*2-1;
X2=[x*cos(pi/180*10),x*sin(pi/180*10)];

XY=[X1;X2];

[A,idx]=main_PBC2(XY,30*6,30*4,30,2,2);
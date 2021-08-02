n=8000;
% Two lines intersect with different angles.

x=rand(n,1)*2-1;
X1=[x,zeros(n,1)];

x=rand(n,1)*2-1;
X2=[x*cos(pi/180*30),x*sin(pi/180*30)];

XY=[X1;X2];

[A,idx]=main_PBC2(XY,20*6,20*4,20,4,2);
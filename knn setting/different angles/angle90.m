

n=3000;
% Two lines intersect with different angles.

x=rand(n,1)*2-1;
X1=[x,zeros(n,1)];

x=rand(n,1)*2-1;
X2=[zeros(n,1),x];

XY=[X1;X2];

[A,idx]=main_PBC2(XY,20*6,20*4,20,8,2);

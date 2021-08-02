

% 3 1D + 3 2D

n1=10000;
u=rand(n1,1);
v=rand(n1,1);
r=1;
phi=2*pi*u;
teta=acos(2*v-1);
z=r*cos(teta);
x=sqrt(r^2-z.^2).*cos(phi);
y=sqrt(r^2-z.^2).*sin(phi)+0.5;
D1=[x y z];

u=rand(n1,1);
v=rand(n1,1);
r=1;
phi=2*pi*u;
teta=acos(2*v-1);
z=r*cos(teta);
x=sqrt(r^2-z.^2).*cos(phi);
y=sqrt(r^2-z.^2).*sin(phi)-0.5;
D2=[x y z];

u=rand(n1,1);
v=rand(n1,1);
r=1;
phi=2*pi*u;
teta=acos(2*v-1);
z=r*cos(teta);
x=sqrt(r^2-z.^2).*cos(phi)+0.5*sqrt(3);
y=sqrt(r^2-z.^2).*sin(phi);
D3=[x y z];

D=[D1;D2;D3];

n=2000;
x=rand(n,1)*2-1;
X1=[5*x,zeros(n,2)];

x=rand(n,1)*2-1;
X2=[zeros(n,1),5*x,zeros(n,1)];

x=rand(n,1)*2-1;
X3=[zeros(n,2),5*x];

XY=[D;X1;X2;X3];

[A,idx]=main_PBC2(XY,30*6,30*4,30,8,6);

save('chtcthreetimestwo')
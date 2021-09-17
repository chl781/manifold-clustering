function[D]=Sphere2Line(~)

n1=5000;
u=rand(n1,1);
v=rand(n1,1);
r=0.07;
phi=2*pi*u;
teta=acos(2*v-1);
z=r*cos(teta);
x=sqrt(r^2-z.^2).*cos(phi)-0.12;
y=sqrt(r^2-z.^2).*sin(phi);
D1=[x y z];

u=rand(n1,1);
v=rand(n1,1);
r=0.07;
phi=2*pi*u;
teta=acos(2*v-1);
z=r*cos(teta);
x=sqrt(r^2-z.^2).*cos(phi)+0.12;
y=sqrt(r^2-z.^2).*sin(phi);
D2=[x y z];

n2=2000;
x=0.3-0.6.*rand(n2,1);
y=zeros(n2,1);
z=zeros(n2,1);
L1=[x y z];

x=zeros(n2,1);
y=zeros(n2,1);
z=0.3-0.6.*rand(n2,1);
L2=[x y z];

D=[D1;D2;L1;L2];
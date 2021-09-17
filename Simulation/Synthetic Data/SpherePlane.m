function[D]=SpherePlane(~)

n1=4000;
u=rand(n1,1);
v=rand(n1,1);
r=1;
phi=2*pi*u;
teta=acos(2*v-1);
z=r*cos(teta);
x=sqrt(r^2-z.^2).*cos(phi);
y=sqrt(r^2-z.^2).*sin(phi);
D1=[x y z];

n2=4000;
x=2.5-5.*rand(n2,1);
y=2.5-5.*rand(n2,1);
z=zeros(n2,1);
D2=[x y z];

D=[D1;D2];
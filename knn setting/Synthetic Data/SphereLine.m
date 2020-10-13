function[D]=SphereLine(~)

n1=6000;
u=pi*rand(n1,1);
v=2*pi*rand(n1,1);
r=0.05;
z=r*cos(u);
x=r*sin(u).*cos(v);
y=r*sin(u).*sin(v);
D1=[x y z];

n2=3000;
x=0.5-1.*rand(n2,1);
y=zeros(n2,1);
z=zeros(n2,1);
D2=[x y z];
D=[D1;D2];
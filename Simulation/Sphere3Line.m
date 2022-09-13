n1=20000;
u=rand(n1,1);
v=rand(n1,1);
r=1;
phi=2*pi*u;
teta=acos(2*v-1);
z=r*cos(teta);
x=sqrt(r^2-z.^2).*cos(phi);
y=sqrt(r^2-z.^2).*sin(phi);
D1=[x y z];

n3=8000;
D2=zeros(n3,3);
D2(:,1)=4-8.*rand(n3,1);

D3=zeros(n3,3);
D3(:,2)=4-8.*rand(n3,1);

D4=zeros(n3,3);
D4(:,3)=4-8.*rand(n3,1);


XY=[D1;D2;D3;D4];
[A,idx] = main_PBC2(XY,240,160,40,4,4);
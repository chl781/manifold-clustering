function[D]=BallPlaneLine2()

n1=3000;
u=rand(n1,1);
v=rand(n1,1);
r=rand(n1,1);
phi=2*pi*u;
teta=acos(2*v-1);
z=r.*cos(teta);
x=sqrt(r.^2-z.^2).*cos(phi);
y=sqrt(r.^2-z.^2).*sin(phi);
D1=[x y z];

n2=4000;
D2=zeros(n2,3);
D2(:,1)=2-4.*rand(n2,1);
D2(:,2)=2-4.*rand(n2,1);

D4=zeros(n2,3);
D4(:,1)=2-4.*rand(n2,1);
D4(:,2)=3;
D4(:,3)=2-4.*rand(n2,1);

n3=2000;
D3=zeros(n3,3);
D3(:,2)=1.3;
D3(:,3)=4-8.*rand(n3,1);

D=[D1;D2;D4;D3];
n1=8000;
u=rand(n1,1);
v=rand(n1,1);
r=1;
phi=2*pi*u;
teta=acos(2*v-1);
epsilon=rand(n1,1);
r=r+epsilon*0.03;
z=r.*cos(teta);
x=sqrt(r.^2-z.^2).*cos(phi);
y=sqrt(r.^2-z.^2).*sin(phi);
D1=[x y z];

u=rand(n1,1);
v=rand(n1,1);
r=1;
phi=2*pi*u;
teta=acos(2*v-1);
epsilon=rand(n1,1);
r=r+epsilon*0.03;
z=r.*cos(teta);
x=sqrt(r.^2-z.^2).*cos(phi);
y=sqrt(r.^2-z.^2).*sin(phi)+1;
D2=[x y z];

D=[D1;D2];
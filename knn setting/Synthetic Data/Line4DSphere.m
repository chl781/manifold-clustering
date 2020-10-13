function[D]=Line4DSphere(~)

n1=10000;
u1=pi*rand(n1,1);
u2=pi*rand(n1,1);
u3=2*pi*rand(n1,1);
r=0.2;
x1=r*cos(u1);
x2=r*sin(u1).*cos(u2);
x3=r*sin(u1).*sin(u2).*cos(u3);
x4=r*sin(u1).*sin(u2).*sin(u3);
D1=[x1 x2 x3 x4];

n2=2000;
D2=zeros(n2,4);
D2(:,1)=0.5-1*rand(n2,1);

D=[D1;D2]


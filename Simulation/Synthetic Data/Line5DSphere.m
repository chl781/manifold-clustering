function[D]=Line5DSphere(~)

n1=8000;
u1=pi*rand(n1,1);
u2=pi*rand(n1,1);
u3=pi*rand(n1,1);
u4=2*pi*rand(n1,1);
r=0.2;
x1=r*cos(u1);
x2=r*sin(u1).*cos(u2);
x3=r*sin(u1).*sin(u2).*cos(u3);
x4=r*sin(u1).*sin(u2).*sin(u3).*cos(u4);
x5=r*sin(u1).*sin(u2).*sin(u3).*sin(u4);
D1=[x1 x2 x3 x4 x5];

n2=700;
D2=zeros(n2,5);
D2(:,1)=0.5-1*rand(n2,1);

D=[D1;D2]


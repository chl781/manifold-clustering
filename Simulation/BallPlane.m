
n1=6000;
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

XY=[D1;D2];


[A,idx] = main_PBC2(XY,120,80,20,10,2);

% scatter3(D(:,1),D(:,2),D(:,3),3,idx,'filled') 
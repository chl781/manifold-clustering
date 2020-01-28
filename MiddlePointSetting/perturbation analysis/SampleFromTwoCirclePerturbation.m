x=0;y=0;s=800;r=1;

ang=rand(1,s)*2*pi; 
s1=0.1^2*rand(1,s);
xp=(r+s1).*cos(ang);
yp=(r+s1).*sin(ang);
X1=[x+xp;y+yp]';

x=sqrt(2);y=0;r=1;

ang=rand(1,s)*2*pi; 
s2=0.1^2*rand(1,s);
xp=(r+s2).*cos(ang);
yp=(r+s2).*sin(ang);
X2=[x+xp;y+yp]';

XY=[X1;X2];

[A1,W1] = PBC_main(XY,50,15,0.8,2.5,0.000001);
n1=size(A1,1)-rank(A1);
D=diag(sum(A1));
L=D-A1;
[W,~]=eig(L);

eigenvec=W(:,n1+2);
scatter(W(:,n1+2),W(:,n1+3),3,'filled')

XY1=[W(:,n1+2),W(:,n1+3)];
[A2,W2] = PBC_main(XY1,40,20,0.7,2.5,0.01);

n2=size(A2,1)-rank(A2);
D2=diag(sum(A2));
L2=D2-A2;
[W2,~]=eig(L2);
eigenvec2=W2(:,n2+2);

XY2=[W2(:,n2+2),W2(:,n2+3)];
[A3,W3] = PBC_main(XY2,40,20,0.7,2.5,0.01);
n3=size(A3,1)-rank(A3);
D3=diag(sum(A3));
L3=D3-A3;
[W3,~]=eig(L3);

eigenvec3=W3(:,n3+2);
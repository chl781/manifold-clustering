% High dimensional cases
% 3 dimensional ball + 1 dimensional line + 2 dimensional ball

% Generate the 3D ball
n=60000;
x = 2*pi*rand(3,n);
r = 1;
X = HyperSphere(x,r)';
X1=[X,zeros(n,2)];

% Generate 2D ball

n2=6000;
angle1=rand(1,n2)*2*pi;
angle2=acos(rand(1,n2)*2-1);
r=ones(1,n2);
x1=r.*cos(angle1).*sin(angle2);
y1=r.*sin(angle1).*sin(angle2);
z1=r.*cos(angle2);
X=[x1;y1;z1]';
X2=[zeros(n2,3),X];

% Generate a line

n3=1000;
X3=[zeros(n3,5),4*rand(n3,1)-1];

%

X=[X1;X2;X3];
[A,idx]=main_PBC2(X,40*6,40*4,40,10,3);
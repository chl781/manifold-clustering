% Different dimensions

% Generate line

n1=2000;
X=4*rand(n1,1)-2;
X1=[X,zeros(n1,1),zeros(n1,1)];

% Generate line

n1=2000;
X=4*rand(n1,1)-2;
X2=[zeros(n1,1),X,zeros(n1,1)];

% Generate line

n1=2000;
X=4*rand(n1,1)-2;
X3=[zeros(n1,1),zeros(n1,1),X];


% Generate sphere

ns=20000;
angle1=rand(1,ns)*2*pi;
angle2=acos(rand(1,ns)*2-1);
r=ones(1,ns);
x1=r.*cos(angle1).*sin(angle2);
y1=r.*sin(angle1).*sin(angle2);
z1=r.*cos(angle2);
X4=[x1;y1;z1]';

X=[X1;X2;X3;X4];



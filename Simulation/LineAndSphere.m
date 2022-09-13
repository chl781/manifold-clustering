% try to do some easy perturbation:
% three lines intersecting.
% two circles are hard to interpret because of the parameter is either easy
% to destroy the connection or easy to make them connect. When the points are not
% almost on a straight line,then it is not easy to control the parameters.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Generate some data.
ns=24000;
angle1=rand(1,ns)*2*pi;
angle2=acos(rand(1,ns)*2-1);
r=ones(1,ns);
x1=r.*cos(angle1).*sin(angle2);
y1=r.*sin(angle1).*sin(angle2);
z1=r.*cos(angle2);
X=[x1;y1;z1]';


n1=6000;
Y1=3*(2*rand(n1,1)-1);
Y=[Y1,zeros(n1,1),zeros(n1,1)];

XY=[X;Y];

[A,W] = main_PBC2(XY,125,100,25,6,2);
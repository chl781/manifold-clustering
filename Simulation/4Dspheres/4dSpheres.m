% try to do some easy perturbation:
% three lines intersecting.
% two circles are hard to interpret because of the parameter is either easy
% to destroy the connection or easy to make them connect. When the points are not
% almost on a straight line,then it is not easy to control the parameters.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Generate some data.

m=40000;
x = 2*pi*rand(3,m);
r = 1;
X = HyperSphere(x,r)';
y = 2*pi*rand(3,m);
Y = HyperSphere(y,r)'+[sqrt(2),0,0,0];
XY=[X;Y];

[A,W] = main_PBC2(XY,250,200,50,20,2);
s1=kmeans(W,2);

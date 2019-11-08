%3 lines intersecting
X1=-1:0.01:3;
X2=-2:0.01:2;
X3=-2:0.01:2;
Y1=2:-0.01:-2;
Y2=zeros(1,401);
Y3=-2:0.01:2;
XY1=[X1;Y1];
XY2=[X2;Y2];
XY3=[X3;Y3];
XY=[XY1,XY2,XY3]';
[A,W] = PBC_main(XY,30,15,0.995,3,0.01);

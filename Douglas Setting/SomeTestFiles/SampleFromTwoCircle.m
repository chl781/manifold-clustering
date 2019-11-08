x=0;y=0;s=2000;r=1;

ang=rand(1,s)*2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
X1=[x+xp;y+yp]';

x=sqrt(2);y=0;r=1;

ang=rand(1,s)*2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
X2=[x+xp;y+yp]';

XY=[X1;X2];

[A,W] = PBC_main(XY,50,20,0.9,3);

scatter(XY(:,1),XY(:,2),3,W(:,2),'filled')
plot(W(:,2))
saveas(scatter(XY(:,1),XY(:,2),3,W(:,2)),'plot/TwoCirle.jpg')
saveas(plot(W(:,2)),'plot/TwoCirleEigvec.jpg')

sum(W(1:2000,2)<0)

sum(W(2001:4000,2)>0)

min(W(2000+find(W(2001:4000,2)<0),2))
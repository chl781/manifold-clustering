

n1=6000;
t=-2+4*rand(n1,1);     % Using  spherical coordinates

x=t.^3-3*t;
y=-t.^2;
XY=[x y];  
[A,idx] = main_PBC2(XY,90,60,15,10,2);
scatter3(XY(:,1),XY(:,2),XY(:,3),3,idx,'filled')



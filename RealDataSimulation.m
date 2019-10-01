%real data plot

load('2c.mat')
c=data';
load('2d.mat');
d=data';
load('4a.mat');
a=data';
[A_c,W_c] = PBC_main(c,20,0.8,3,2);
scatter(c(:,1),c(:,2),3,W_c(:,1),'filled')
scatter(c(:,1),c(:,2),3,W_c(:,2),'filled')
[A_d,W_d] = PBC_main(d,20,0.8,3,2);
scatter(d(:,1),d(:,2),3,W_d(:,1),'filled')
scatter(d(:,1),d(:,2),3,W_d(:,2),'filled')
[A_a,W_a] = PBC_main(a,30,0.8,3,2);
scatter3(a(:,1),a(:,2),a(:,3),3,W_a(:,1),'filled')
scatter3(a(:,1),a(:,2),a(:,3),3,W_a(:,2),'filled')
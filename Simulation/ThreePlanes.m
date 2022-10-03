n=3000;
x=3-6.*rand(n,1);
y=3-6.*rand(n,1);
z=zeros(n,1);
D1=[x y z];

x=1.5-3.*rand(n,1);
y=3-6.*rand(n,1);
z=1-sqrt(3).*x;
D2=[x y z];

x=1.5-3.*rand(n,1);
y=3-6.*rand(n,1);
z=0.5+sqrt(3).*x;
D3=[x y z];

D=[D1;D2;D3];

[A,idx] = main_PBC2(D,160,120,30,4,3);
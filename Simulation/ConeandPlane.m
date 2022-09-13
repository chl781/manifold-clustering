
%% cone
n1=24000;
teta=(2*pi)*rand(n1,1);     % Using  spherical coordinates
r=2*rand(n1,1);
x=r.*sin(teta);
y=r.*cos(teta);
z=r;
D1=[x y z];  




%Plane
n2=48000;
D2=zeros(n2,3);
D2(:,1)=-2+4.*rand(n2,1);
D2(:,2)=-2+4.*rand(n2,1);
D2(:,3)=1+.2*D2(:,1);


XY=[D1;D2];

[A,idx] = main_PBC2(XY,240,160,40,4,2);
save('chtcdata2');

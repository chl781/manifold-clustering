n1=8000;
D1=zeros(n1,3);
D1(:,1)=-.5+rand(n1,1);
D1(:,2)=-.5+rand(n1,1);
D1(:,3)=0.5*ones(n1,1);

n2=1000;
D2=zeros(n2,3);
D2(:,3)=2*(-.5+rand(n2,1));

n1=8000;
D3=zeros(n1,3);
D3(:,1)=-.5+rand(n1,1);
D3(:,2)=-.5+rand(n1,1);
D3(:,3)=-0.5*ones(n1,1);

D=[D1;D2;D3];

[A,idx]=main_PBC2(D,120,80,20,8,2);
function [ D,Dclean ] = Cross_3lins( ~ )
n1=4000;
D1=zeros(n1,2);
X1=-1+2*rand(n1,1);
D1(:,1)=X1;
% Y=-X.^2+1;
Y1=zeros(n1,1);
noise=-1+2*rand(n1,1);  % generate uniform noise on the interval [-1 1]
D1(:,2)=Y1+.001*noise;   % add noise to the data 
                        % cluster 1
Dclean1=zeros(n1,2);
Dclean1(:,1)=X1;
Dclean1(:,2)=Y1;

n2=4000;
D2=zeros(n2,2);
X2=(-1+2*rand(n2,1))/2;
noise=-1+2*rand(n2,1);  % generate uniform noise on the interval [-1 1]
D2(:,1)=X2+.001*noise;   % add noise to the data 
Y2=X2;
D2(:,2)=Y2*sqrt(3);
% Y=-X.^2+1;
Dclean2=zeros(n2,2);
Dclean2(:,1)=X2; 
Dclean2(:,2)=Y2*sqrt(3);

n3=4000;
D3=zeros(n3,2);
X3=(-1+2*rand(n3,1))/sqrt(4/3);
noise=-1+2*rand(n2,1);  % generate uniform noise on the interval [-1 1]
D3(:,1)=-X3/sqrt(3);            
Y3=X3;
D3(:,2)=Y3+.001*noise;

Dclean3=zeros(n3,2);
Dclean3(:,1)=-X3/sqrt(3); 
Dclean3(:,2)=Y3;

D=[D1;D2;D3];
Dclean=[Dclean1;Dclean2;Dclean3];


end
% [group,path] = Path_Based_Cluster( D , 70 , 6 );
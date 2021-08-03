
n1=8000;
D1=zeros(n1,3);
D1(:,1)=-1+2*rand(n1,1);
epsilon=rand(n1,1);
D1(:,2)=0+epsilon*0.03;

% D1(:,3)=.8+3.5*D1(:,1);
D1(:,3)=-1+2*rand(n1,1);

                  
n2=8000;
D2=zeros(n2,3);
D2(:,1)=-1+2*rand(n2,1);
D2(:,2)=-1+2*rand(n2,1);
epsilon=rand(n1,1);
D2(:,3)=0+epsilon*0.03;
D=[D1;D2];
[A,idx]=main_PBC2(D,240,160,40,8,2);
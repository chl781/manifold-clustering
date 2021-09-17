function[D]=TwoPlaneLine(~)

n1=4000;
P1=zeros(n1,3);
P1(:,1)=2-4*rand(n1,1);
P1(:,2)=2-4*rand(n1,1);
P1(:,3)=0;

P2=zeros(n1,3);
P2(:,1)=2-4*rand(n1,1);
P2(:,2)=0;
P2(:,3)=2-4*rand(n1,1);

n2=2000;
L1=zeros(n2,3);
L1(:,1)=0;
L1(:,2)=3-6*rand(n2,1);
L1(:,3)=1.2;

D=[P1;P2;L1];
end
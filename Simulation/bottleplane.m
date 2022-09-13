%Parameter Setup for data generation.
n=18000;
n1=10000;
a=0.15;
b=0.5;
scale=2;

%%

i=1;
ss=zeros(3,n+n1);
theta=rand(1,n)*2*pi;
fun1 = @(x) (x+1)^2*(x-1)^2*(x^2+a);
fun = @(x) sqrt((6*x^5-4*(2-a)*x^3+2*(1-2*a)*x)^2+1)*(x+1)^2*(x-1)^2*(x^2+a);
x=zeros(1,n);
s=zeros(1,n);
while i<=n
    y=2*rand(1)-1;
    if(rand(1)<fun(y))
        x(i)=y;
        s(i)=fun1(y);
        i=i+1;
    end
end



X=[s.*cos(theta);x;s.*sin(theta)]';
%Sample from a plane

Y=zeros(n1,3);
Y(:,2)=b;
Y(:,1)=(1/2-rand(n1,1))*scale;
% D1(:,3)=.8+3.5*D1(:,1);
Y(:,3)=(1/2-rand(n1,1))*scale;
XY=[X;Y];

% Path algorithm with k_+,k_- graph 
% Parameter setup
r=25;
epsilonminus=4*r;
epsilonplus=6*r;
alpha=8;


[A,idx]=main_PBC2(XY,epsilonplus,epsilonminus,r,alpha,3);
%idx=kmeans(idx,2);

save('chtcdata')
%scatter3(XY(:,1),XY(:,2),XY(:,3),3,idx,'filled')

% Path algorithm with k_+,0 graph
%[A,idx]=main_PBC2(XY,epsilonplus,0,r,alpha,3);
%idx=kmeans(idx,3);


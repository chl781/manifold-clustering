function r1=bottleplane(n,n1,a,b,epsilonplus,epsilonminus,r,alpha)
%bottle and plane accuracy determination
r1=[0,0,0];
i=1;
theta=rand(1,n)*2*pi;
fun1 = @(x) (x+1)^2*(x-1)^2*(x^2+a);
fun = @(x) sqrt((6*a^5-4*(2-a)*x^3+2*(1-2*a)*x)^2+1)*(x+1)^2*(x-1)^2*(x^2+a);
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
Y(:,1)=(1/2-rand(n1,1));
% D1(:,3)=.8+3.5*D1(:,1);
Y(:,3)=(1/2-rand(n1,1));
XY=[X;Y];

% Path algorithm with epsilon_+,epsilon_- graph 

[A,idx]=main_PBC2(XY,epsilonplus,epsilonminus,r,alpha,2);
idx=kmeans(idx,2);
accu=(sum(idx(1:n)==1)+sum(idx(n+1:n+n1)==2))/(n+n1);
r1(1)=max(accu,1-accu);


% Path algorithm with epsilon_+,0 graph
[A,idx]=main_PBC2(XY,epsilonplus,0,r,alpha,2);
idx=kmeans(idx,2);
accu=(sum(idx(1:n)==1)+sum(idx(n+1:n+n1)==2))/(n+n1);
r1(2)=max(accu,1-accu);

% tangent plane algorithm
[label coarse_label label1 models allerror allerror1 nets min_i min_j]=mani_clu(XY,[ones(1,n),2*ones(1,n1)],2,r,5);
r1(3)=1-mean(allerror);

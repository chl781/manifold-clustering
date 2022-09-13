n=20000;
x=zeros(1,n);
for i=1:n
   y=rand(1);
   if y>0.8
       x(i)=(y-0.8)*10;
   end
   if y<0.8
       x(i)=y/4;
   end
end
D1=zeros(n,3);
D1(:,1)=0;
D1(:,2)=x;
% D1(:,3)=.8+3.5*D1(:,1);
D1(:,3)=2*(1/2-rand(n,1));

x=zeros(1,n);
for i=1:n
   y=rand(1);
   if y>0.8
       x(i)=(y-0.8)*10;
   end
   if y<0.8
       x(i)=y/4;
   end
end
D2=zeros(n,3);
D2(:,1)=x;
D2(:,2)=0;
D2(:,3)=2*(1/2-rand(n,1));

XY=[D1;D2];

[A,W] = main_PBC2(XY,250,200,50,5,2);
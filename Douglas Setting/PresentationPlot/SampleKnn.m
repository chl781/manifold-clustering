%two balls intersecting Fig. 8
ns=2000;
angle1=rand(1,ns)*2*pi;
angle2=acos(rand(1,ns)*2-1);
r=ones(1,ns);
x1=r.*cos(angle1).*sin(angle2);
y1=r.*sin(angle1).*sin(angle2)+1;
z1=r.*cos(angle2);
angle3=rand(1,ns)*2*pi;
angle4=acos(rand(1,ns)*2-1);
r=ones(1,ns);
x2=1+r.*cos(angle3).*sin(angle4);
y2=r.*sin(angle3).*sin(angle4);
z2=r.*cos(angle4);
X=[x1;y1;z1];
Y=[x2;y2;z2];
XY=[X,Y]';

 B=zeros(4000,4000);
 for i=1:4000
     a1=knnsearch(XY,XY(i,:),'K',31);
     B(i,a1(2:31))=ones(1,30);
     B(a1(2:31),i)=ones(30,1);
 end

%  B=zeros(4000,4000);
%  for i=1:4000
%      for j=i+1:4000
%          if norm(XY(i,:)-XY(j,:),2)<=0.3
%              B(i,j)=1;
%              B(j,i)=1;
%          end
%      end
%  end

n1=sum(sum(B)==0);
D=diag(sum(B));
D2=diag(sum(B).^-1/2);
L2=diag(ones(1,4000))-D2*B*D2;
L1=D-B;
[W,~]=eig(L1);

W1=W(:,n1+2);
scatter3(XY(:,1),XY(:,2),XY(:,3),3,W1)
%scatter(1:4000,W1,3)

view(135,180)
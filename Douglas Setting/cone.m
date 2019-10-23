function h=cone(c0,v,R,n,isclosed)
% 画圆锥，c0为底圆中心坐标(1*3数组)，v为顶点坐标（1*3数组），R为底圆半径，n为母线条数，
% isclosed决定曲面是否封闭（取1封闭底面，取0则不封闭）。
% 格式:
%    CONE(c0,v,r) 默认母线条数为50，底面不封闭
%    CONE(c0,v,r,n) 默认底面不封闭
%    CONE(c0,v,r,n,isclosed) 底面圆心c0指向顶点v，半径为r的圆锥面，n为底圆划分段数
%
% see also CONEPLOT
% From https://www.ilovematlab.cn/thread-203545-1-1.html
if nargin==3
    n=50;
    isclosed=0;
elseif nargin==4
    isclosed=0;
end
H=sqrt(sum((c0-v).^2));
alpha=acosd(dot([0,0,1],v-c0)/H);
zdir=cross([0,0,1],v-c0);
t=linspace(0,2*pi,n);
x=R*cos(t)+c0(1);
y=R*sin(t)+c0(2);
vert=[x(:),y(:),c0(3)*ones(n,1);c0(1),c0(2),c0(3)+H;c0];
fac=[(1:n).' [2:n 1].' (n+1)*ones(n,1)];
vert=rot3d(vert,c0,zdir,alpha/180*pi);
hp=[];
clf;
if isclosed==1
    hp=patch('vertices',vert,'faces',[(1:n).' [2:n 1].' (n+2)*ones(n,1)],...
        'cdata',vert(1:n,3),'facecolor','flat', 'edgecolor','none');
end
hf=patch('vertices',vert,'faces',fac,'cdata',vert(1:n,3),'facecolor','flat',...
         'edgecolor','none');
hf=[hf hp];
%for k=1:length(hf), rotate(hf(k),zdir,alpha,c0); end
axis equal
grid on
view(3)

if nargout==1, h=hf; end

function Pr=rot3d(P,origin,dirct,theta)
% 将坐标点P绕着，过origin点，方向为dirct的直线，旋转theta角
% P：需要旋转的做标集合，n×3矩阵
% origin：转轴通过的点，1×3向量
% direct：转轴方向向量，1×3向量
% theta：旋转角度，单位弧度
%
% By LaterComer
% Modifid at 2011-07-26 19:51:32

dirct=dirct(:)/norm(dirct);

A_hat=dirct*dirct';

A_star=[0,         -dirct(3),      dirct(2)
        dirct(3),          0,     -dirct(1)
       -dirct(2),   dirct(1),            0];
I=eye(3);
M=A_hat+cos(theta)*(I-A_hat)+sin(theta)*A_star;
origin=repmat(origin(:)',size(P,1),1);
Pr=(P-origin)*M'+origin;
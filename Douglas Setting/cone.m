function h=cone(c0,v,R,n,isclosed)
% ��Բ׶��c0Ϊ��Բ��������(1*3����)��vΪ�������꣨1*3���飩��RΪ��Բ�뾶��nΪĸ��������
% isclosed���������Ƿ��գ�ȡ1��յ��棬ȡ0�򲻷�գ���
% ��ʽ:
%    CONE(c0,v,r) Ĭ��ĸ������Ϊ50�����治���
%    CONE(c0,v,r,n) Ĭ�ϵ��治���
%    CONE(c0,v,r,n,isclosed) ����Բ��c0ָ�򶥵�v���뾶Ϊr��Բ׶�棬nΪ��Բ���ֶ���
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
% �������P���ţ���origin�㣬����Ϊdirct��ֱ�ߣ���תtheta��
% P����Ҫ��ת�����꼯�ϣ�n��3����
% origin��ת��ͨ���ĵ㣬1��3����
% direct��ת�᷽��������1��3����
% theta����ת�Ƕȣ���λ����
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
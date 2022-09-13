
% The following 'ConeAndPlanechangeparameter.fig' can be changed to any
% file's name you want. This is for 3d data recovery.
h1 = openfig('ConeAndPlanechangeparameter.fig','reuse'); % open figure
h=get(gca,'Children');
data=get(h,'Cdata');
D=get(gca,'Children'); %get the handle of the line object
XData=get(D,'XData'); %get the x data
YData=get(D,'YData'); %get the y data
ZData=get(D,'ZData');
XY=[XData',YData',ZData'];

figure;
scatter3(XData,YData,ZData,3,data,'filled')

YourColor2=[1,0,0;0,0,1;0,1,0];

figure;
scatter3(XData,YData,ZData,3,YourColor2(data,:),'filled')
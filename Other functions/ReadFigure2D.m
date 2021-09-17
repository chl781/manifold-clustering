
% The following 'angle90.fig' can be changed to any
% file's name you want. This is for 2d data recovery.
h1 = openfig('angle90.fig','reuse'); % open figure
h=get(gca,'Children');
data=get(h,'Cdata');
D=get(gca,'Children'); %get the handle of the line object
XData=get(D,'XData'); %get the x data
YData=get(D,'YData'); %get the y data
figure;
scatter(XData,YData,3,data,'filled')

YourColor2=[1,0,0;0,0,1;0,1,0];

figure;
scatter(XData,YData,3,YourColor2(data,:),'filled')
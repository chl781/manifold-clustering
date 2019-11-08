function [lambda]=correspond(t,theta)
% This function is to find the corresponding relationship between PCA
% distance and the angle with length.
C=[1/3*t^3*cos(theta)^2-t^2*(1-t)^2*cos(theta)/2-t^4*cos(theta)^2/4-(1-t)^4/4+(1-t)^3/3,...
    t^3*sin(theta)*cos(theta)/3-t^4*cos(theta)*sin(theta)/4-t^2*(1-t)^2*sin(theta)/4;...
    t^3*sin(theta)*cos(theta)/3-t^4*cos(theta)*sin(theta)/4-t^2*(1-t)^2*sin(theta)/4,...
    t^3*sin(theta)^2/3-t^4*sin(theta)^2/4];
lambda=ones(1,2);
B=sqrt((C(1,1)+C(2,2))^2-4*(C(1,1)*C(2,2)-C(1,2)^2));
lambda(1)=((C(1,1)+C(2,2))+B)/2;
lambda(2)=((C(1,1)+C(2,2))-B)/2;
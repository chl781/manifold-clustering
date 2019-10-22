function [t1,degree]=SmoothTheCurve(path,epsilon1) 
% Smooth the curve main function

maxiter=100;
[m,n]=size(path);
t1=ones(1,m-1)/2; %initialize
a=ones(m-1,n);
for i=1:m-1
    a(i,:)=t1(i)*path(i,:)+(1-t1(i))*path(i+1,:);
end
degree=CheckDegree(a);
t1Iter=Itert1(t1,path);
aiter=a;
for i=1:m-1
    aiter(i,:)=t1Iter(i)*path(i,:)+(1-t1Iter(i))*path(i+1,:);
end
degreeiter=CheckDegree(aiter);
iternumber=1;
while(abs(degreeiter-degree)>epsilon1&&iternumber<maxiter)
    %a=aiter;
    degree=degreeiter;
    t1=t1Iter;
    t1Iter=Itert1(t1,path);
    for i=1:m-1
        aiter(i,:)=t1Iter(i)*path(i,:)+(1-t1Iter(i))*path(i+1,:);
    end
    degreeiter=CheckDegree(aiter);
    iternumber=iternumber+1;
end

%a=aiter;
degree=degreeiter;
t1=t1Iter;




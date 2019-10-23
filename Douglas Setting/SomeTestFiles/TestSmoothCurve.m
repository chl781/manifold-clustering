XY=[0,0;1,1/3;2,-1/5;3,1/4;4,-1/6;5,1/17;6,-1/5;7,1/4;8,-1/3;9,0];
[t1,degree]=SmoothTheCurve(XY,0.0001);
a=ones(9,2);
for i=1:9
    a(i,:)=t1(i)*XY(i,:)+(1-t1(i))*XY(i+1,:);
end
scatter(a(:,1),a(:,2),"red")
hold on;
scatter(XY(:,1),XY(:,2),3)
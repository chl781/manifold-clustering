%correspond function testfile
angle=0:pi/100:pi;
distance=0:0.01:1;
lambda=ones(length(angle),length(distance));
for i=1:length(angle)
    for j=1:length(distance)
        a=correspond(distance(j),angle(i));
        lambda(i,j)=a(2);
    end
end
ANGLE=repmat(angle,length(distance),1)';
DISTANCE=repmat(distance,length(angle),1);
mesh(ANGLE,DISTANCE,lambda);
xlabel("angle");
ylabel("t");
zlabel("lambda");

distance=1/2;
lambda=ones(length(angle),1);
for i=1:length(angle)
    a=correspond(distance,angle(i));
    lambda(i)=a(2);
end
plot(angle,lambda')
    
function P=plane(n)
% this function simulates a plane consisting n points

X=(3-(-3)).*rand(n,1)-3;
Y=(3-(-3)).*rand(n,1)-3;
Z=zeros(n,1);

P=[X,Y,Z];

end

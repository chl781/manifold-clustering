function two_p=two_plane(m,n)
% This function simulates 2 vertical planes with m and n points.

X1=(3-(-3)).*rand(m,1)-3;
Y1=(3-(-3)).*rand(m,1)-3;
Z1=zeros(m,1);

X2=(3-(-3)).*rand(n,1)-3;
Y2=zeros(n,1);
Z2=(3-(-3)).*rand(n,1)-3;

X=[X1;X2];
Y=[Y1;Y2];
Z=[Z1;Z2];

two_p=[X,Y,Z];
end



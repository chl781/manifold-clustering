n=50000;
noise=0;

% choose S part over | part with prob based on area of each
% S is 3*pi, | is 6
p=1/2;
%p = (3*pi)/(6+3*pi);

X = zeros(n,3);
Y = zeros(n,1);
m = zeros(n,1);

for i = 1:n,
    if rand() > p,
        m(i,1) = 0;
   
        % surface is along x=0, y=[0,1], z=[-3,3]
        X(i,:) = [0 rand() 6*rand()-3];
        
	Y(i,1) = 13 + X(i,3) + randn(); % will be from 10 to 16 +/- 2
    else
        m(i,1) = 1;

        angle = 1.5*rand()*pi;
           
        x = cos(angle);
        y = rand();
        z = sin(angle);
	
        % choose between top and bottom of S
        if rand() > 0.5,
            X(i,:) = [x y z+1];
	    Y(i,1) = angle;        % Y is from 0 to 3*pi
        else,            
            X(i,:) = [-x y -z-1];          
	    Y(i,1) = 3*pi - angle;
        end
        
    end
end

X(find(m),3) = X(find(m),3) + randn(length(find(m)),1)*noise;

Y = Y + randn(n,1)*0.1;

% randomly shuffle the points, so we can easily subsample later
randidx = randperm(n);
XY = X(randidx,:);
Y = Y(randidx,:);
m = m(randidx,:);

[A,idx] = main_PBC2(XY,210,150,35,6,2);


%%% Recover the fourth eigenvector
D=sparse(diag(sum(A)));
D1=sparse(size(A,1),size(A,1));
for i=1:size(A,1)
    D1(i,i)=1/sqrt(D(i,i));
    if D(i,i)==0
        D1(i,i)=1;
    end
end
%L=D-A;
L1=D1*(D-A)*D1;
L1new=speye(size(A,1))-L1;
%[W,s]=eigs(L,2);
[W1,s1]=eigs(L1new,100);
scatter3(XY(:,1),XY(:,2),XY(:,3),3,kmeans(W1(:,4),2),'filled')


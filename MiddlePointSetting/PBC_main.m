function [A,W] = PBC_main(X,k,k1,epsilon,p,epsilon1)
% Manifold clustering function
% input
% k is the parameter for KNN
% k1 is the number of points too close to one
% epsilon is the degree condition
% X is the data
% p is the parameter in distance(L_p)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output: W is clustering
% output: A is adjacency matrix

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[n,~] = size(X);
%n is 2 or 3, corresponding to dimensions.
D = pdistancematrix(X,p);
A = zeros(n,n);

for i = 1:n
    if(mod(i,100)==0)
        disp(i/100)
    end
    M=findkNN(X,D,k,k1,i,epsilon,epsilon1);
    t=length(M);
    if any(M~=0)
       A(i,M)=ones(1,t);
       A(M,i)=ones(t,1);
    end
end

%The following is spectral clustering algorithm
W=spectral_clustering(A);
end

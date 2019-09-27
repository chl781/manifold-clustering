function [A,W] = PBC_main(X,k,epsilon,p,l)
% Manifold clustering function
% input
% k is the parameter for kNN
% epsilon is the degree condition
% X is the graph
% p is the parameter in distance(L_p)
% l is the parameter of spectral clustering
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output: W is clustering
% output: A is adjacency matrix

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[n,~]=size(X);
%n is 2 or 3, corresponding to dimensions.
D=pdistancematrix(X,p);
A=zeros(n,n);

for i=1:n
    M=findkNN(X,D,k,i,epsilon);
    t=length(M);
    A(i,M)=ones(1,t);
    A(M,i)=ones(t,1);
end

%The following is spectral clustering algorithm
W=spectral_clustering(A,l);
end

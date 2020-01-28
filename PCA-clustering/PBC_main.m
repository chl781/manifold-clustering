function [A,W] = PBC_main(X,k,k1,epsilon,p)
%,max_iter,num_step)
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
    if(mod(i,100)==0)
        disp(i/100)
    end
    M=findkNN(X,D,k,k1,i,epsilon);
    t=length(M);
    if any(M~=0)
       A(i,M)=ones(1,t);
       A(M,i)=ones(t,1);
    end
end

%The following is spectral clustering algorithm
W=spectral_clustering(A);
end

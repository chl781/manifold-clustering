function path=path_sim(n)
X=linspace(0,3,n)+rand(1,n);
Y=X+(rand(1,n)*3);
%Z=X+(rand(1,n)*4);
path=[X',Y'];
end

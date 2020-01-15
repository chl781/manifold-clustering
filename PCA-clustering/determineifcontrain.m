function sign=determineifcontrain(path,epsilon)
% it is for determine if the path follows as constraint
% 'path': direction vector
% sign=1, path works; sign=0, path does not work
sign=1;
[n,~]=size(path);
if n==1
    return
end
if dis_pca_path(path)>epsilon
    sign=0;
    return
end
end
    

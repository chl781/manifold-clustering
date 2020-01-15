function d=dis_pca_point(pt, w, bar)
%compute distance from a point to a line which goes through bar and its normal vector is w 
%notice vector should be column, m*1
t=w'*(pt-bar)/(w'*w);
new=w*t+bar-pt;
d=mean(new.^2);
end
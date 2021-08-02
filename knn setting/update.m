function idx=update(A,s)

% use A matrix to update index vector.
idx=spectral_clustering(A,s);
idx=kmeans(idx,s);

end
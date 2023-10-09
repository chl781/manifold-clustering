# Spectral Clustering with angle-constrained annular proximity graph

This joint work is written by Nicolas Garcia Trillos(garciatrillo@wisc.edu), Pengfei He(hepengf1@msu.edu), and Chenghui Li(cli539@wisc.edu).

It is used for solving multi-manifold clustering problem. Notice that we used $\epsilon_+,\epsilon_-$-graph and $k_+,k_-$ NN constuctions here. See https://arxiv.org/abs/2107.13610 for a detailed discussion. The codes are in knn setting and epsilon setting folders. In the folder 'Simulation', there are some simulation data and recommendation parameters. In the folder 'Other folder', there are two codes that can transfer matlab figure into matlab data. 

An example illustration to run code is:

For knn setting: If D is the data set, one suggested pattern: k_+ = 6*r, k_- = 4*r, r = 5*2^m . 
[A,idx]=main_PBC2(D,120,80,20,10,2);

For epsilon setting: the ratio depends on the embedded dimension, suggested as the ratio of kNN. One suggested pattern: eps_- = r*6^{1/m} , eps_+ =  r*4^{1/m}.
[A,idx]=main_PBC3(D,0.02*sqrt(6),0.02*2,0.02,10,2);

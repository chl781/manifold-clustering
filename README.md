# Annular proximity graph

This joint work is written by Nicolas Garcia Trillos(garciatrillo@wisc.edu), Pengfei He(hepengf1@msu.edu), Chenghui Li(cli539@wisc.edu).

It is used for solving multi-manifold clustering problem. Notice that we used $\eps_+,\eps_-$-graph and $k_+,k_-$ NN constuctions here. See https://arxiv.org/abs/2107.13610 for a detailed discussion. The code is in knn setting and epsilon setting folders. In the folder 'Simulation', there are some simulation data. In the folder 'Other folder', there are two codes that can transfer matlab figure into matlab data. 

An example illustration to run code is:

For knn setting: If D is the data set.
[A,idx]=main_PBC2(D,120,80,20,10,2);

For epsilon setting, the parameter is trickier:
[A,idx]=main_PBC3(D,0.02*sqrt(6),0.02*2,0.02,10,2);


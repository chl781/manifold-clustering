% script: run_linefit_Prasad_RDP_opt

%% reading image and getting gray scale image
im_color = imread('1.tif');

if size(im_color,3) == 3
        im=rgb2gray((im_color));
    elseif size(im_color,3) == 4
        im=rgb2gray(im_color(:,:,1:3));
    else
        im=im_color;
end

%% getting the edge data. 
%Please note that we have used binarizing and bwboundaries
%here for simplicity. However, more advanced methods may be useful for general gray scale
%images. For example, applying canny edge detector, followed by thinning
%and then following edgepixels to get the edge contours may be used.
im=im==0;%binarizing the image
clear im_color;
figure; imshow(im);
edgelist=bwboundaries(im);edgelist=edgelist.';

%% calling linefit_Prasad_RDP_opt
[edgelist,seglist,precision_list,reliability_list,precision_edge,reliability_edge, time_edge] = linefit_Prasad_RDP_opt(edgelist);

%% plotting the edgelist and seglist
% addpath('../Kovesi/')
figure;drawedgelist(edgelist,size(im),[],[0 0 1],gcf);
        drawseglist(seglist,size(im),[],[0 0 0],gcf);
        legend('edge','polygonal approximation');
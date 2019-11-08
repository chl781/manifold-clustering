% Usage: [edgelist,seglist,precision_list,reliability_list,precision_edge,reliability_edge, time_edge] = linefit_Prasad_RDP_opt(edgelist);
%
% Inputs:  
% edgelist - Cell array of edgelists where each edgelist is an
%                        Nx2 array of (row col) coords.
%             
% Output:
% edgelist -Cell array of edgelists where each edgelist is an
%           Nx2 array of (row col) coords
% seglist - A cell array of in the same format of the input
%           edgelist but each seglist is a subsampling of its
%           corresponding edgelist such that straight line
%           segments between these subsampled points do not
%           deviate from the original points by more than tol.
% precision_list - precision metric \epsilon_p' computed for each line
%           segment used for approximating an edge
% reliability_list - reliability metric \epsilon_r computed for each line
%           segment used for approximating an edge
% precision_edge - precision metric \epsilon_p' computed for the complete
%           edge (see [2] below)
% reliability_edge - reliability metric \epsilon_r computed for the complete
%           edge (see [2] below)
% time_edge - time taken for the computation
%
% This function takes each array of edgepoints in edgelist, finds the
% size and position of the optimal deviation due to digitization 
% (Prasad, D.K., et. al. 2011, ACPR) from the line that joins the
% endpoints, if the maximum deviation exceeds the optimal deviation due to 
% digitization then the
% edge is shortened to the point of maximum deviation and the test is
% repeated.  In this manner each edge is broken down to line segments,
% each of which adhere to the original data with the specified tolerance.
%
% Copyright (c) 2012 Dilip K. Prasad
% School of Computer Engineering
% Nanyang Technological University, Singapore
% http://www.ntu.edu.sg/
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software with restriction for its use for research purpose only, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in
% all copies or substantial portions of the Software.
%
% The Software is provided "as is", without warranty of any kind.
%
% Please cite the following work if this program is used
% [1] Dilip K. Prasad, Chai Quek, Maylor K.H. Leung, and Siu-Yeung Cho 
%       “A parameter independent line fitting method,” 1st Asian Conference 
%       on Pattern Recognition (ACPR 2011), Beijing, China, 28-30 Nov, 2011.
% [2] Dilip K. Prasad and Maylor K. H. Leung, "Polygonal Representation of 
%       Digital Curves," Digital Image Processing, Stefan G. Stanciu (Ed.),
%       InTech, 2012.

% April 2012 (Dilip K. Prasad) - Changes are made to adapt the line fitting method based on optimal deviation due to digitization


function [edgelist,seglist,precision_list,reliability_list,precision_edge,reliability_edge, time_edge] = linefit_Prasad_RDP_opt(edgelist)
N_edge = length(edgelist);
seglist = cell(1,N_edge);
linelist=cell(1,N_edge);
precision_list=[];
reliability_list=[];
time_edge=[];
time_loop1=zeros(N_edge,1);
time_loop2=zeros(N_edge,1);
for e = 1:N_edge
    sum_dev_list=[];
    D_temp_list=[];
    precision_edge=[];
    reliability_edge=[];
    precision_local=[];
    tic;
    y = edgelist{e}(:,1);   % Note that (col, row) corresponds to (x,y)
    x = edgelist{e}(:,2);
    
    first = 1;                % Indices of first and last points in edge
    last = length(x);        % segment being considered.
    
    No_pts = 1;
    seglist{e}(No_pts,:) = [y(first) x(first)];
    D=[];
    
    while  first<last
	% Find size, position, precision, reliability of line fitting method based on optimal deviation.
        [max_dev, index, D_temp, precision, reliability,del_tol_max,sum_dev] = maxlinedev_opt(x(first:last),y(first:last)); 
             
        while max_dev>del_tol_max       % While deviation is > del_tol_max
            last = index+first-1;  % Shorten line to point of max deviation by adjusting last
            [max_dev, index, D_temp, precision, reliability,del_tol_max,sum_dev] = maxlinedev_opt(x(first:last),y(first:last));
        end
        D(end+1)=D_temp;
        No_pts = No_pts+1;
        seglist{e}(No_pts,:) = [y(last) x(last)];
		%Updating the lists of various output
        precision_list=[precision_list;precision];
        reliability_list=[reliability_list;reliability];
        sum_dev_list=[sum_dev_list;sum_dev];
        D_temp_list=[D_temp_list;D_temp];
        precision_local=[precision_local;precision];
        first = last;        % reset first and last for next iteration
        last = length(x);
    end

    precision_edge=[precision_edge; mean(precision_local)];
    reliability_edge=[reliability_edge; sum(sum_dev_list)/sum(D_temp_list)];
    time_loop1(e)=toc;
end
%return the time taken for parameter independent line fitting method for an edge (Prasad, DK, et.al. 2011, ACPR)
time_edge=time_loop1;
return
end

%% Calculating the actual maximum deviation

% This function takes each array of edgepoints in edgelist, finds the
% size and position of the optimal deviation due to digitization (Prasad, D.K., et. al. 2011, ACPR) from the line that joins the
% endpoints, if the maximum deviation exceeds the optimal deviation due to digitization then the
% edge is shortened to the point of maximum deviation and the test is
% repeated.  In this manner each edge is broken down to line segments,
% each of which adhere to the original data with the specified tolerance.
%
% Usage: [d_max, index_d_max, S_max, precision, reliability, del_tol_max, sum_dev] = maxlinedev_opt(x,y);
% 
% Input:  
% x , y - (col row) coordinates of an edgelist.
%
% Output:
% d_max - maximum deviation 
% index_d_max - the index of the pixel which has the maximum deviation
% S_max - maximum distance s_max used for calculating reliability metric
%           \epsilon_r in [1] or [2]
% precision - precision metric \epsilon_p' computed for the current line
%           segment used for approximating the input edge fragment
% reliability - reliability metric \epsilon_r computed for the current line
%           segment used for approximating the input edge fragment
% del_tol_max - the expression s*del_phi_max computed using the analytical
%           error bound
% sum_dev - numerator of the expression for calculating reliability metric
%           \epsilon_r in [1] or [2]
function [d_max, index_d_max, S_max, precision, reliability, del_tol_max, sum_dev] = maxlinedev_opt(x,y)
    first=1;
    last=length(x);
    X=[x(first) y(first);x(last) y(last)];
    A=[(y(1)-y(last))/(y(1)*x(last)-y(last)*x(1));(x(1)-x(last))/(x(1)*y(last)-x(last)*y(1))];

if isnan(A(1))&& isnan(A(2))
    dev=abs(sqrt(sum(([x(first:last) y(first:last)]-repmat([x(first) y(first)],last,1)).^2,2)));
elseif isinf(A(1)) && isinf(A(2))
     c=x(1)./y(1);
     dev=abs(sum([x(first:last) -c.*y(first:last)]./sqrt(1+c.^2),2));
else
    dev=abs([x(first:last) y(first:last)]*A-ones(last,1))./sqrt(sum(A.^2));
end
    [d_max,index_d_max]=max(dev);
    precision=norm(dev)/sqrt(last);
    S_max=max(sqrt(sum(([x(first:last) y(first:last)]-repmat([x(first) y(first)],last,1)).^2,2)));
    reliability=sum(dev)/S_max;
    sum_dev=sum(dev);
    del_phi_max=max(function_digital_case_with_max_error(S_max));
    del_tol_max=tan(del_phi_max).*S_max;
end

%% Calculating the analytical error bound

% This function computes the analytical error bound of the slope of a
% digital line. See [1] for the derivation.
%
% Usage: [del_phi_tilde_max]=function_digital_case_with_max_error(s);
% 
% Input:  
% s - euclidean dstance between the two end points of the digital line
%
% Output:
% del_phi_tilde_max - analytical error bound of the slope of a
%           digital line 
function [del_phi_tilde_max]=function_digital_case_with_max_error(ss)

phii=0:pi/360:2*pi;

[s,phi]=meshgrid(ss,phii);

term1(:,:,1)=abs(cos(phi));
term1(:,:,2)=abs(sin(phi));
term1(:,:,3)=abs(sin(phi)+cos(phi));
term1(:,:,4)=abs(sin(phi)-cos(phi));

term1(:,:,5)=abs(cos(phi));
term1(:,:,6)=abs(sin(phi));
term1(:,:,7)=abs(sin(phi)+cos(phi));
term1(:,:,8)=abs(sin(phi)-cos(phi));


tt2(:,:,1)=(sin(phi))./s;
tt2(:,:,2)=(cos(phi))./s;
tt2(:,:,3)=(sin(phi)-cos(phi))./s;
tt2(:,:,4)=(sin(phi)+cos(phi))./s;

tt2(:,:,5)=-(sin(phi))./s;
tt2(:,:,6)=-(cos(phi))./s;
tt2(:,:,7)=-(sin(phi)-cos(phi))./s;
tt2(:,:,8)=-(sin(phi)+cos(phi))./s;

term2(:,:,1)=s.*(1-tt2(:,:,1));
term2(:,:,2)=s.*(1-tt2(:,:,2));
term2(:,:,3)=s.*(1-tt2(:,:,3));
term2(:,:,4)=s.*(1-tt2(:,:,4));

term2(:,:,5)=s.*(1-tt2(:,:,5));
term2(:,:,6)=s.*(1-tt2(:,:,6));
term2(:,:,7)=s.*(1-tt2(:,:,7));
term2(:,:,8)=s.*(1-tt2(:,:,8));

term2(:,:,1)=s.*(1-tt2(:,:,1)+tt2(:,:,1).^2);
term2(:,:,2)=s.*(1-tt2(:,:,2)+tt2(:,:,2).^2);
term2(:,:,3)=s.*(1-tt2(:,:,3)+tt2(:,:,3).^2);
term2(:,:,4)=s.*(1-tt2(:,:,4)+tt2(:,:,4).^2);

term2(:,:,5)=s.*(1-tt2(:,:,5)+tt2(:,:,5).^2);
term2(:,:,6)=s.*(1-tt2(:,:,6)+tt2(:,:,6).^2);
term2(:,:,7)=s.*(1-tt2(:,:,7)+tt2(:,:,7).^2);
term2(:,:,8)=s.*(1-tt2(:,:,8)+tt2(:,:,8).^2);

for s_i=1:length(ss)
    for c_i=1:8
        ss=s(:,s_i);
        t1=term1(:,s_i,c_i);
        t2=term2(:,s_i,c_i);
        case_value(:,c_i)=(1./ss.^2).*t1.*t2;
    end
    del_phi_tilde_max(:,s_i)=max(case_value,[],2);
    
end
end
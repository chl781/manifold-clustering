% self intersecting curves eigenvector analysis
number_eigenvector=8;

N=501;
th=linspace(-pi,2*pi,N);
R=3;
x=R*cos(th)+linspace(0,6,N);
y=R*sin(th)+linspace(0,1,N);
plot(x,y,'b');
X_selfintersect=[x',y'];
[A_selfintersect,W_selfintersect] = PBC_main(X_selfintersect,20,0.9,3,number_eigenvector);
% W: eigenvector
%scatter(X_selfintersect(:,1),X_selfintersect(:,2),3,W_selfintersect(:,1))

% Circle eigenvector
th = 0:pi/250:2*pi;
xunit = 1 * cos(th) ;
yunit = 1 * sin(th) ;
X_circle=[xunit',yunit'];
[A_circle,W_circle] = PBC_main(X_circle,20,0.9,3,number_eigenvector);
%scatter(X_circle(:,1),X_circle(:,2),3,W_circle(:,1))
norm(eig(A_circle)-eig(A_selfintersect),2)
%norm(W_circle-W_selfintersect,2)
sum(W_circle(:,1).*W_selfintersect(:,1))
sum(W_circle(:,2).*W_selfintersect(:,2))
sum(W_circle(:,3).*W_selfintersect(:,3))
sum(W_circle(:,4).*W_selfintersect(:,4))
sum(W_circle(:,5).*W_selfintersect(:,5))
sum(W_circle(:,6).*W_selfintersect(:,6))
sum(W_circle(:,7).*W_selfintersect(:,7))
sum(W_circle(:,8).*W_selfintersect(:,8))


% Circle opening a gap.
th = 0:(pi/500*1):(1*pi);
xunit = 1 * cos(th) ;
yunit = 1 * sin(th) ;
X_opencircle=[xunit',yunit'];
[A_opencircle,W_opencircle] = PBC_main(X_opencircle,20,0.9,3,number_eigenvector);
%scatter(X_opencircle(:,1),X_opencircle(:,2),3,W_opencircle(:,1))
norm(eig(A_opencircle)-eig(A_selfintersect),2)
%norm(W_opencircle-W_selfintersect,2)
sum(W_opencircle(:,1).*W_selfintersect(:,1))
sum(W_opencircle(:,2).*W_selfintersect(:,2))
sum(W_opencircle(:,3).*W_selfintersect(:,3))
sum(W_opencircle(:,4).*W_selfintersect(:,4))
sum(W_opencircle(:,5).*W_selfintersect(:,5))
sum(W_opencircle(:,6).*W_selfintersect(:,6))
sum(W_opencircle(:,7).*W_selfintersect(:,7))
sum(W_opencircle(:,8).*W_selfintersect(:,8))


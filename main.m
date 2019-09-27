%main coding
X=PointsSphere(100);


D=pdistancematrix(X,1.09);
[dist,  geodesic]=dijkstra(D,1,50);
 A=showgeodesic(X,geodesic);
 scatter(A(1:end,1),A(1:end,2),40,'MarkerEdgeColor',[0 .5 .5],...?
              'MarkerFaceColor',[0 .7 .7],...?
              'LineWidth',1.5)
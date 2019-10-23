% simulate a plane and obtain its distance matrix, 
% then obtain knn connection matrix for a given index;
% find shortest paths for each knn and plot the path

epsilon=0.6;
%t_p=two_plane(1000,1000);
Dp=pdistancematrix(t_p,2.2);
index=1 ;
%for index=1:20
    [v,indexs]=mink(Dp(index,:),100);
    Dknn=Dp(indexs,indexs);
    t=0
    s=[]
    for n = 50:100
        [e,L]=dijkstra(Dknn,1,n);
        realI=indexs(wrev(L));
        if length(realI)<5
            continue;
        end
        scatter3(t_p(:,1),t_p(:,2),t_p(:,3),3,'yellow');
        hold on;
        old_path=t_p(realI,:);
        line(old_path(:,1),old_path(:,2),old_path(:,3),'color','green');
        view(3);
        hold on;
        new_path=SmoothTheCurve(old_path,0.01);
        line(new_path(:,1),new_path(:,2),new_path(:,3),'color','red');
        view(3);
        hold on;
        if determineifcontrain(new_path,epsilon)==1
            t=t+1;
            s=[s,indexs(n)];
            line(new_path(:,1),new_path(:,2),new_path(:,3),'color','black');
            scatter3(t_p(indexs(n),1),t_p(indexs(n),2),t_p(indexs(n),3),8,'red');
            view(3);
            hold on;
        end
    end
%end



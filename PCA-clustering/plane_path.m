% simulate a plane and obtain its distance matrix, 
% then obtain knn connection matrix for a given index;
% find shortest paths for each knn and plot the path
%t_p=SphereLine(1000,1000);
%Dp=pdistancematrix(t_p,3);
epsilon=0.05;
index=12;
%for index=1001:1050
    [v,indexs]=mink(Dp(index,:),80);
    Dknn=Dp(indexs,indexs);
    t=0;
    s=[];
    for n = 40:80
        [e,L]=dijkstra(Dknn,1,n);
        realI=indexs(wrev(L));
        if length(realI)<5
            continue;
        end
        scatter3(t_p(:,1),t_p(:,2),t_p(:,3),3,'yellow');
        hold on;
        scatter3(t_p(index,1),t_p(index,2),t_p(index,3),5,'black');
        hold on;
        old_path=t_p(realI,:);
        line(old_path(:,1),old_path(:,2),old_path(:,3),'color','green');
        view(3);
        hold on;
        %new_path=smooth(old_path,2,100000);
        %line(new_path(:,1),new_path(:,2),new_path(:,3),'color','red');
        %view(3);
        %hold on;
        if determineifcontrain(old_path,epsilon)==1
            t=t+1;
            s=[s,indexs(n)];
            line(old_path(:,1),old_path(:,2),old_path(:,3),'color','black');
            scatter3(t_p(indexs(n),1),t_p(indexs(n),2),t_p(indexs(n),3),8,'red');
            view(3);
            hold on;
        end
    end
%end



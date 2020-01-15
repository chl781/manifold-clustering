%t_p=Cross();
%Dp=pdistancematrix(t_p,3);
epsilon=0.5;
index=1000;
%for index=1001:1050
    [v,indexs]=mink(Dp(index,:),100);
    Dknn=Dp(indexs,indexs);
    t=0;
    s=[];
    for n = 50:100
        [e,L]=dijkstra(Dknn,1,n);
        realI=indexs(wrev(L));
        if length(realI)<5
            continue;
        end
        scatter(t_p(:,1),t_p(:,2),3,'yellow');
        hold on;
        scatter(t_p(index,1),t_p(index,2),5,'black');
        hold on;
        old_path=t_p(realI,:);
        line(old_path(:,1),old_path(:,2),'color','green');
        view();
        hold on;
        %new_path=smooth(old_path,2,100000);
        %line(new_path(:,1),new_path(:,2),new_path(:,3),'color','red');
        %view(3);
        %hold on;
        if determineifcontrain(old_path,epsilon)==1
            t=t+1;
            s=[s,indexs(n)];
            line(old_path(:,1),old_path(:,2),'color','black');
            scatter(t_p(indexs(n),1),t_p(indexs(n),2),8,'red');
            view();
            hold on;
        end
    end
%end
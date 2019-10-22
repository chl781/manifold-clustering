function X=smooth(path,max_iter,num_step)
%path: m*n matrix, m points and each point has n coordinates.
[m,n]=size(path);
X=first(m)*path; %initial points
steps=linspace(0,1,num_step);
while(max_iter>0)
    max_iter=max_iter-1;
    % first point
    z=[];
    for i=1:num_step
        z(i)=f1(steps(i),path(1,:),path(2,:),X(2,:),X(3,:));
    end
    [~,I]=maxk(z,1);
    X(1,:)=steps(I)*path(1,:)+(1-steps(I))*path(2,:);
    % second point
    for i=1:num_step
        z(i)=f2(steps(i),path(2,:),path(3,:),X(1,:),X(3,:),X(4,:));
    end
    [~,I]=maxk(z,1);
    X(2,:)=steps(I)*path(2,:)+(1-steps(I))*path(3,:);
    %m-2 point
    for i=1:num_step
        z(i)=f2(steps(i),path(m-2,:),path(m-1,:),X(m-1,:),X(m-3,:),X(m-4,:));
    end
    [~,I]=maxk(z,1);
    X(m-2,:)=steps(I)*path(m-2,:)+(1-steps(I))*path(m-1,:);
    %m-1 point
    for i=1:num_step
        z(i)=f1(steps(i),path(m-1,:),path(m,:),X(m-2,:),X(m-3,:));
    end
    [~,I]=maxk(z,1);
    X(m-1,:)=steps(I)*path(m-1,:)+(1-steps(I))*path(m,:);
    % 3~m-2 point
    for i=3:(n-2)
        for j=1:nun_step
            z(j)=f3(steps(j),path(i,:),path(i+1,:),X(i-2,:),X(i-1,:),X(i+1,:),X(i+2,:));
        end
        [~,I]=maxk(z,1);
        X(i,:)=steps(I)*path(i,:)+(1-steps(I))*path(i+1,:);
    end
end
end

        
    
         
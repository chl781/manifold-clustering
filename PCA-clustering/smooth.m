function X=smooth(path,max_iter,num_step)
%path: m*n matrix, m points and each point has n coordinates.
[m,n]=size(path);
X=first(m)*path; %initial points
steps=linspace(0,1,num_step);
while(max_iter>0)
    max_iter=max_iter-1;
    z1=[];
    z2=[];
    z3=[];
    z4=[];
    for i=1:num_step
        z1(i)=f1(steps(i),path(1,:),path(2,:),X(2,:),X(3,:));
        z2(i)=f2(steps(i),path(2,:),path(3,:),X(1,:),X(3,:),X(4,:));
        z3(i)=f2(steps(i),path(m-2,:),path(m-1,:),X(m-1,:),X(m-3,:),X(m-4,:));
        z4(i)=f1(steps(i),path(m-1,:),path(m,:),X(m-2,:),X(m-3,:));
    end
    [~,I1]=maxk(z1,1); % first point
    [~,I2]=maxk(z2,1); % second point
    [~,I3]=maxk(z3,1); %m-2 point
    [~,I4]=maxk(z4,1); %m-1 point
    X(1,:)=steps(I1)*path(1,:)+(1-steps(I1))*path(2,:);
    X(2,:)=steps(I2)*path(2,:)+(1-steps(I2))*path(3,:);
    X(m-2,:)=steps(I3)*path(m-2,:)+(1-steps(I3))*path(m-1,:);
    X(m-1,:)=steps(I4)*path(m-1,:)+(1-steps(I4))*path(m,:);
    % 3~m-2 point
    z=[];
    for i=3:(n-2)
        for j=1:nun_step
            z(j)=f3(steps(j),path(i,:),path(i+1,:),X(i-2,:),X(i-1,:),X(i+1,:),X(i+2,:));
        end
        [~,I]=maxk(z,1);
        X(i,:)=steps(I)*path(i,:)+(1-steps(I))*path(i+1,:);
    end
end
end

        
    
         
function t1Iter=Itert1(t1,path)
%Iteration function, generating the points to smooth the path

[m,n]=size(path);
a=ones(m-1,n);

for i=1:m-1
    a(i,:)=t1(i)*path(i,:)+(1-t1(i))*path(i+1,:);
end
t1Iter=t1;

%     A=norm(a(i+1,:)-a(i-1,:),2);
%     current=t*path(i,:)+(1-t)*path(i+1,:);
%     B=norm(current-a(i-1,:),2);
%     C=norm(current-a(i-1,:),2);
%     deg=(C^2+B^2-A^2)/B/C;

i=1;
t=fminbnd(@(t) -sum((a(i+1,:)-(t*path(i,:)+(1-t)*path(i+1,:))).* ...
        (a(i+2,:)-a(i+1,:)))/norm(a(i+1,:)-(t*path(i,:)+(1-t)*path(i+1,:)),2),0,1);
a(i,:)=t*path(i,:)+(1-t)*path(i,:);
t1Iter(i)=t;

for i=2:m-2
       
    t=fminbnd(@(t) -sum((t*path(i,:)+(1-t)*path(i+1,:)-a(i-1,:)).*(a(i+1,:)- ...
        (t*path(i,:)+(1-t)*path(i+1,:))))/norm(t*path(i,:)+(1-t)*path(i+1,:)-a(i-1,:),2) ...
    /norm(a(i+1,:)-(t*path(i,:)+(1-t)*path(i+1,:)),2),0,1); 
        %This function is for finding the minimum, so we need to add some changes.
    a(i,:)=t*path(i,:)+(1-t)*path(i,:);
    t1Iter(i)=t;
    
end


i=m-1;
t=fminbnd(@(t) -sum((t*path(i,:)+(1-t)*path(i+1,:)-a(i-1,:)).* ...
        (a(i-1,:)-a(i-2,:)))/norm(a(i-1,:)-(t*path(i,:)+(1-t)*path(i+1,:)),2),0,1);
a(i,:)=t*path(i,:)+(1-t)*path(i,:);
t1Iter(i)=t;

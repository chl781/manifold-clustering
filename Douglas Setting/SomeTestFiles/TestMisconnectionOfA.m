number=0;
for i=2001:4000
    if any(find(A(i,:)==1)<=2000)
        number=number+1;
        disp(i)
        disp(XY(i,:))
    end
end

find(A(1,:)==1)

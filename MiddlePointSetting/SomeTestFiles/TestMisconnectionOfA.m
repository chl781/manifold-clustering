number=0;
for i=1:401
    if any(find(A(i,:)==1)>401)
        number=number+1;
        disp(i)
        disp(XY(i,:))
    end
end

find(A(1,:)==1)

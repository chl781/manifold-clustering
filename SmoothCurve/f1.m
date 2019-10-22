function y=f1(t,a0,a1,x1,x2)
A=x1-a1;
B=a0-a1;
C=x2-x1;
y=deg(A-B*t,C);
end

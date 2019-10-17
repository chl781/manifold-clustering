function y=f2(t,a0,a1,x1,x2,x3)
A=a0-a1;
B=a1-x1;
C=x2-a1;
D=x3-x2;
y=deg(A*t+B,C-A*t)+deg(C-A*t,D);
end

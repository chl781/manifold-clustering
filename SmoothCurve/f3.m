function y=f3(t,a0,a1,x0,x1,x2,x3)
A=x1-x0;
B=a0-a1;
C=a1-x1;
D=x2-a1;
E=x3-x2;
y=deg(A,B*t+C)+deg(Bt+C,D-B*t)+deg(D-A*t,E)
end

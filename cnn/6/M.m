M = [f1(t) f2(t)... ]
A = M'*M;
b = M'*v;
c = gauss(A,b);
vf = @(t) c(1)*f1(t) + ...


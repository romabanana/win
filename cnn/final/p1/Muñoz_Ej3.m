P = [230 18 9 -222 -9];

x = -1:0.01:1;
f = polyval(P,x);
plot(x,f);
grid on;
g = @(x) (230*(x^4))+(18*(x^3))+(9*(x^2))-(222*x)-(9);

xmin1 = -0.5;
xmax1 = 0;
tol = 1e-8;
kmax = 100;
[x1,~] = biseccion(g,xmin1,xmax1,kmax,tol);
##[x1,~] = secante(g,x1,x1+tol,kmax,tol);
display(["x menor = ",num2str(x1)]);

xmin2 = 0.5;
xmax2 = 1;
[x2,~] = biseccion(g,xmin2,xmax2,kmax,tol);
display(["x mayor = ",num2str(x2)]);


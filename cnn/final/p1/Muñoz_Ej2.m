A = [3 1 -1 1 2; 1 3 2 -2 -2; -2 -2 1 -2 -2; 2 -1 -1 3 2; 0 0 1 1 2];
b = [1 4 -1 2 2]';

display("resultado gauss = ");
x = gauss(A,b)


tol =1e-4;
x0 = zeros(5,1);
itmax=500;

[xj,it,~] = jacobi(A,b,x0,itmax,tol);
display(["iteraciones jacobi = ",num2str(it)]);
[~,it,~] = gaussseidel(A,b,x0,itmax,tol);
display(["iteraciones gausseidel = ",num2str(it)]);
error_relativo = norm(x-xj,inf)/norm(xj,inf);
display(["error relativo entre gauss y jacobi = ",num2str(error_relativo)]);

#Error is right... (xj - x,inf)/(x,inf) is the equal tho...

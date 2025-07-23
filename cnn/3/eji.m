A = [2 -1; -1 2];
b = [1 1]';
x0 = [7 2]';
maxit = 250;
tol = 1e-6;
[x, r, it]=Jacobi(A, b, x0, maxit, tol);
x
r
it

[x, r, it]=gaussseidel(A, b, x0, maxit, tol);
x
r
it

w = 1.5;

[x, r, it]=sor(A, b, x0, maxit, tol,w);
x
r
it



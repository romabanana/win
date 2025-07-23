##jsdkah
a =2;



function [T, c, t] = to_jacobi(A,b)
  tic();
  U = -triu(A,1);
  Dinv = inv(diag(diag(A)));
  L = -tril(A,-1);
  T = Dinv * (U+L);
  C = Dinv * b;
  t = toc();
endfunction



function y = diagonal(i)
  for j=1:i
    x(j) = 2*j;
  endfor
  y= diag(x,0);

  for j=1:i-2
    x1(j) = 0.5*(j+2);
  endfor
  y += diag(x1,-2) + diag(x1,2);

  for j=1:i-4
    x2(j) = 0.25*(j+4);
  endfor
  y += diag(x2,-4) + diag(x2,4);
  endfunction
n = 1000;
A = diagonal(n);
for i=1:n
  b(i) = pi;
endfor

maxit = 250;
tol= 1e-5;
x0 = zeros(n,1);
tic();
A\b;
toc()
tic();
[x, it, r]=jacobi(A, b, x0, maxit, tol);
semilogy(0:it-1, r);
hold on;
toc()
tic();
[x, it, r]=gaussseidel(A, b, x0, maxit, tol);
semilogy(0:it-1, r);
it
toc()
tic();
[x, it, r]=sor(A, b, x0, maxit, tol,1);
semilogy(0:it-1, r);
it
toc()
tic();
[x, it, r]=sor(A, b, x0, maxit, tol,1.25);
it
toc()
tic();
[x, it, r]=sor(A, b, x0, maxit, tol,0.75);
it
toc()
tic();
[x, it, r]=sor(A, b, x0, maxit, tol,1.10);
it
toc()

A = [3 -1 2 1; -1 4 2 0; -1 1  5 2; 3 -1 1 7];

function [T, c, t] = to_jacobi(A,b)
  tic();
  U = -triu(A,1);
  Dinv = inv(diag(diag(A)));
  L = -tril(A,-1);
  T = Dinv * (U+L);
  c = Dinv * b;
  t = toc();
endfunction


b = [1 -1 2 -1]';
x0 = [1 1 1 1]';
maxit = 100;
tol = 1e-5;

cond(A);
norm(A)*norm(inv(A));

[T, c, t] = to_jacobi(A,b);

norm(T)
max(abs(eig(T))) #Radio espectral...

##
##
##[x, r1, it1]=Jacobi(A, b, x0, maxit, tol)
##
##[x, r2, it2]=gaussseidel(A, b, x0, maxit, tol)


b1 = [5 3 -1]';
b2 = [5 -1 3]';

A1 = [3 1 1; 1 3 -1; 3  1 -5];

P = [1 0 0; 0 0 1; 0 1 0];

A2 = [3 1 1; 3  1 -5; 1 3 -1];

function [T, c, t] = to_jacobi(A,b)
  tic();
  U = -triu(A,1);
  Dinv = inv(diag(diag(A)));
  L = -tril(A,-1);
  T = Dinv * (U+L);
  c = Dinv * b;
  t = toc();
endfunction

[T, c, t] =to_jacobi(A1,b1);
max(abs(eig(T)))
[T, c, t] =to_jacobi(A2,b2);
max(abs(eig(T)))
#permutacion
##Ab2 = P * [A2 b2];
##A2 = Ab2(:,1:3);
##b2 = Ab2(:,4);
##


x0 = [2 4 2]';
maxit = 50;
tol = 1e-9;

[x, it, r]=jacobi(A1, b1, x0, maxit, tol);
x
it

[x, it, r]=jacobi(A2, b2, x0, maxit, tol);
x
it
##x = gauss(A1, b1);
##x
##
##x = gauss_p(A2, b2);
##x

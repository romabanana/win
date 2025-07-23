# c no es;
function [T, c, t] = to_gaussseidel(A,b)
##  tic();
##  U = triu(A,1);
##  D = -diag(diag(A));
##  L = -tril(A,-1);
##  T = inv(D+L)*U;
##  c = 0;
##  t = toc();

##    tic();
##    D = -diag(diag(A));
##    L = -tril(A,-1);
##    U = triu(A,1);
##    T = inv(D + L) * U;
##    c = inv(D + L) * b; % Update the coefficient c
##    t = toc();

 tic();
 U = -triu(A,1);
 DLinv = inv( tril(A) ); %(L+D)^-1
 T = DLinv*(U);
 c = DLinv*b;
 t = toc();
endfunction

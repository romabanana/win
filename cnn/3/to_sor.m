function [T, c, t] = to_sor(A,b,w)
##  tic();
##  Uw = -triu(A,1).*w;
##  D = diag(diag(A));
##  Lw = tril(A,-1).*w;
##  T = inv(D+Lw).*((1-w).*D-Uw);
##  c = 0;
##  t = toc();
  tic();
    D = diag(diag(A));
    L = tril(A,-1);
    U = triu(A,1);
    T = inv(D + w * L) * ((1 - w) * D - w * U);
    c = inv(D + w * L) * b; % Update the coefficient c
    t = toc();
endfunction

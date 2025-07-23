function [A] = doolittle(A)
  n = length(A(1,:));
  for k = 1:n
    m = A(k+1:n,k)/A(k,k);
    A(k+1:n, k+1:n) = A(k+1:n,k+1:n) - m*A(k,k+1:n);
  endfor
endfunction



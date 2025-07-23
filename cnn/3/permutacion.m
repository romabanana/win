function P  = permutacion(r)
  n = length(r);
  P = zeros(n,n);
  for i=1:n
    P(i,r(i)) = 1;
  endfor

  endfunction

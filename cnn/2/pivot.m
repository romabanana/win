function r = pivot(A,b)

  n = length(b);
  A = [A b];
  r = 1:n;
  epsilon = 1e-9;

  for k = 1:n-1
    [pmax, p] = max(abs(A(r(k:n),k)))

    if pmax < epsilon
      disp('posibles pivotes 0')
      break
    endif

    p = p + k -1; #numeracion globadl
    if p ~= k
      r([p k]) = r([k p]); #(SWAP) actualizacion de pivot
    endif

   endfor
  endfunction

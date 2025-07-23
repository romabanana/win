function [x,h] = puntofijo(g,x0,kmax,tol)

  h = 0;
  for i=1:kmax
    x = g(x0);
    if abs(x - x0)<tol
      h = 1;
      break;
    endif
    x0 = x;
  endfor

  endfunction

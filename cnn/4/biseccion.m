function [x,h] = biseccion(f,xmin,xmax,kmax,tol)

   h = 0;
   for i=1:kmax
    x = xmin + (xmax-xmin)/2;

    if abs(x-xmax) < tol #(xmax-xmin)/2) #abs(f(x))
      h = i;
      break;
    elseif f(xmin)*f(x) > 0
      xmin = x;
    else
      xmax = x;
    endif
  endfor

  endfunction

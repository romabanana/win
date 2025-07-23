function [x,h] = secante(f,xmin,xmax,kmax,tol)

   h = 0;
   q0 = f(xmin);
   q1 = f(xmax);

  for i=2:kmax
    x = xmax - q1*(xmax-xmin)/(q1-q0)
    if abs(x - xmax)<tol
      h = 1;
      break;
    endif

    xmin = xmax;
    q0 = q1;
    xmax = x;
    q1 = f(x);
  endfor


  endfunction

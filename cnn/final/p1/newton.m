function [x,h] = newton(f,df,x0,kmax,tol)


  h = 0;
  for i=1:kmax
    x = x0 - f(x0)/df(x0)  #df(x0) != 0...
    if abs(x - x0) <tol #/ abs(x0)
      h = i;
      break;
    endif
    x0 = x;
  endfor


  endfunction

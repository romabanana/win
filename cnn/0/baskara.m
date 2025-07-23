function [x1, x2, type] = baskara(y)
  r = roots(y);
  x1 = r(1);
  x2 = r(2);
  d = y(2)^2-4*y(1)*y(3);
  if (d > 0)
    type = 'reales';
   else if(d < 0)
      type = 'complejas conjugadas';
    else
      type = 'reales repetidas';
      endif
  endif
endfunction


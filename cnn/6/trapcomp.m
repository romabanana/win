function area = trapcomp(x,y)
  n=length(x);
  area = 0;
  for i=1:n-1
    area += trap(x(i+1)-x(i),y(i),y(i+1));
  endfor
  endfunction

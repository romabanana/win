function area = simpsoncomp(x,y)
##  xi equispaciados y n impar;

  n = length(x);
  h =(x(3)-x(1))/2;
  area = 0;
  for i=1:2:n-2
    area += simpson(h,y(i),y(i+1),y(i+2));
  endfor

  endfunction

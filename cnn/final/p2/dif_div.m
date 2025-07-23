function [fun] = dif_div(x,fx)

    n = length(x);
    A = zeros(n,n);
    fun = [];
    for i = 1:n
      A(i,1) = fx(i);
    endfor

    for j=2:n
      for i=j:n
        A(i,j) = (A(i,j-1) - A(i-1, j-1))/(x(i)-x(i-j+1));
      endfor
    endfor

    for i = n:-1:1
      fun =  [fun A(i,i)];
    endfor


  endfunction

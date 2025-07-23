function x = gauss(A, b);
##
##  n = length(b);
##  x = [A b];
##
##  for k=1:n-1
##    for i=k+1:n
##      m = x(i,k)/x(k,k);
##      x(i,k) = 0;
##      for j =k+1:n+1
##        x(i,j) = x(i,j)-m*x(k,j);
##      endfor
##    endfor
##  endfor
  n = length(A(1,:));

  for k = 1:n
    m = A(k+1:n,k)/A(k,k);
    b(k+1:n) = b(k+1:n) - m*b(k);
    A(k+1:n,k:n) = A(k+1:n,k:n) - m*A(k,k:n);
  endfor
  x = sust_atras(A,b);
endfunction

function x = gauss1(A, b);
  n = length(b);
  x = [A b];
  
  for k=1:n-1
    #m = A(k+1:n,k)/A(k,k);
    #A(k+1:n, k) = 0;
    for i=k+1:n
      m = x(i,k)/x(k,k);
      x(i,k) = 0;
      for j =k+1:n+1
        x(i,j) = x(i,j)-m*x(k,j);
      endfor
    endfor
  endfor
  
  if (A(n,n) == 0)
    display('no hay solucion unica')
  endif
  x= sust_atras1(x);

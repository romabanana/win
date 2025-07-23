#Pivoteo Parcial

function [x] = gauss_p(A,b)
  n = length(b);
  A = [A b];
  r = 1:n;
  epsilon = 1e-9;

  for k = 1:n-1
    [pmax, p] = max(abs(A(r(k:n),k)));
    if pmax < epsilon
      disp('posibles pivotes 0')
      break
    endif
    p = p + k -1; #numeracion globadl
    if p ~= k
      r([p k]) = r([k p]); #(SWAP) actualizacion de pivot
    endif

    A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);
    A(r(k+1:n),k+1:n+1) = A(r(k+1:n),k+1:n+1)-...
                          A(r(k+1:n),k)*A(r(k),k+1:n+1); #m*A
  endfor
  B = A(r,:);
  x = sust_atras(B(:,1:n),B(:,n+1)); #r especifica el nuevo orden de las filas de A


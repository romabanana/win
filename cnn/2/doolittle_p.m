function [x,Ar,L,U,P] = doolittle_p(A,b)

  n = length(A(:,1));
  Ar = [A b];
  r = [1:n]';
  epsilon = 1e-9;

  for k = 1:n
    [pmax,p] = max(abs(Ar(r(k:n),k)));
    if pmax < epsilon
      disp('posibles pivotes nulos');
    endif
    p = p(1) + k -1;
    if p~=k
      r([p,k]) = r([k,p]);
    endif
    P =  eye(n)(r,:);
    Ar(r(k+1:n),k) = Ar(r(k+1:n),k)/Ar(r(k),k);
    Ar(r(k+1:n),k+1:n+1) = Ar(r(k+1:n),k+1:n+1) - Ar(r(k+1:n),k)*Ar(r(k),k+1:n+1);
  endfor

  L = eye(n) + tril(Ar(r,1:n),-1);
  U = triu(Ar(r,1:n),0);

  br = P*b;

  y = sust_adelante(L,br);
  x = sust_atras(U,y);

  endfunction

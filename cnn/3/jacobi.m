function [x,it,r]=jacobi(A, b, x0, maxit, tol)

 % n = size(A,1);
 n = length(A(1,:));
 x = x0; # debe inicializarse x
 % soluciones

 it = 1;
 xi=x0;
 while ( it < maxit )
 for i = 1:n
   x(i) = ( b(i) - A(i,1:i-1)*x0(1:i-1) - A(i,i+1:n)*x0(i+1:n) ) / A(i,i);
 endfor

   r(it) = norm(x-xi,inf)/norm(xi,inf);
   xi = x;
##   r(it)=norm(b- A*x); # norm(x-x0)


 if r(it) < tol %then
 break;
 endif
 x0 = x;
 it = it +1;
 endwhile
 endfunction

function [t,y]=rk4(f, inter, y0, L) 
t = linspace(inter(1),inter(2),L+1)';  
h = (inter(2)-inter(1))/L; 
 
y = zeros( length(y0), L+1 ); 
 
y(:,1) = y0; 
 
for n=1:L 
  k1 = h * f(t(n)  , y(:,n)); 
  k2 = h * f(t(n)+h/2, y(:,n)+k1/2); 
  k3 = h * f(t(n)+h/2, y(:,n)+k2/2); 
  k4 = h * f(t(n+1), y(:,n)+k3); 
 
  y(:,n+1) = y(:,n) + (k1+2*k2+2*k3+k4)/6; 
end 
 
y=y'; 
 
endfunction 
dx = @(t) - sin(t);
dy = @(t) 3*cos(t);

f = @(t) dx(t).^2 + dy(t).^2;
g = @(t) f(t).^(1/2);

format long;
L=7;
Qold = intNCcompuesta(g,0,2*pi,L,2);
for(i=1:10)
  L = L *2;
  Q=intNCcompuesta(g,0,2*pi,L,2);
  error = abs(Q-Qold);
  if(error < 10^-10)
    iteracion = i
    break;  endif;

  Qold = Q;
endfor
Q
Q72=intNCcompuesta(g,0,2*pi,7,2) %7 intervalos, 2 puntos.
error = abs(Q-Q72)
% ya que el error es de orden 10^-3 -> se tienen 4 cifras exactas 13,36


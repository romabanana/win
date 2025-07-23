inter = [0.7, 1.2];
f = @(y,t) - y + t.^2 + 1;
y0 = 0;
dfdy = @(y, t) -1;
[x,w] = ode45(f,inter, y0); %Resolucion bill tin
real_value = w(round(end/2)+1);
figure(1);
plot(x,w);

h = 0.1
L = (inter(2)-inter(1))/h;
errors = [];

for (i=1:20)
  i
  L = L * 2;
	[x,w] = rk4(f,inter,y0,L);
##  [x,w] = CN_newton(f,dfdy,0,2,y0,L);
##  [x, w] = euler_atras_nw(f, dfdy, 0, 2, y0, L, 50, 10e-6)
  t = w(round(end/2)+1);
  format long;
	error = abs(t - real_value);
	errors = [errors error];
  figure(2);
  plot(x,w);
  pause(1);
endfor


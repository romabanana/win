format long; clear all;

y = load("datos5.txt");
x = 1:12;
x = x';

## f(t) = at + b + csin(t pi/6) + dcos(t pi/6)

f1 = @(t) t;
f2 = @(t) ones(size(t));
f3 = @(t) sin((pi/6).*t);
f4 = @(t) cos((pi/6).*t);

M = [f1(x) f2(x) f3(x) f4(x)];
A = M'*M;
b = M'*y;

##c = A\b
c = gauss(A,b)

Tm = @(t) c(1)*f1(t) + c(2) * f2(t) + c(3) * f3(t) + c(4) * f4(t);
Tm1 = Tm(13) #ENERO DEL SIGUIENTE AÑO (mes 13)

error = norm(27.5 - Tm1)/norm(27.5)
##pol = polyfit(x,y,6);
##pol1 = polyval(pol, 1)

erfun = norm(y-Tm(x)) #aka ERROR CUADRATICO ABSOLUTO
##erpol = norm(y-polyval(pol, x))

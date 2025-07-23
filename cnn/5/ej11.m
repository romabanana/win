clear all; clc; clf
i = linspace(0,5,26);
velocidad = load('datos_velocidades.txt');
##velocidad = velocidad';
plot(i,velocidad);

f1 = @(t) sin(2*t);

f2 = @(t) t.^2;

f3 = @(t) 2.^t;

f4 = @(t) 1+0*t;

##F = @(t) [f1(t) f2(t) f3(t) f4(t)];
F = @(t) [f1(t(:)), f2(t(:)), f3(t(:)), f4(t(:))];


coef = F(i)\velocidad;

g = @(t) F(t)*coef;

hold on;
ii = linspace(0,6,100);
plot(i,g(i));

##ALT
M = [f1(i(:)) f2(i(:)) f3(i(:)) f4(i(:))];
A = M'*M;
b = M'*velocidad;

##c = A\b
c = A\b;
Tm = @(t) c(1)*f1(t) + c(2) * f2(t) + c(3) * f3(t) + c(4) * f4(t);
figure(1);
plot(i,Tm(i));

##POLY
cp6=polyfit(i,velocidad,6);
p6=@(t) polyval(cp6,t);
figure(1);
plot(i,p6(i));
legend()

#ERRORES

err1 = norm(velocidad-g(i))
err2 = norm(velocidad-Tm(i))
err3 = norm(velocidad-p6(i))


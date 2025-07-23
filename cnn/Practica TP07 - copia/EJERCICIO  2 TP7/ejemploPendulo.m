# Calculo Octave solucion ODE
% Ejemplo pendulo simple
clear all;
clc
#f = @(t,y) y-(t^2)+1;
f = @(y,x) -sin(y)./x;
y0 = 0; % Condicion Inicial

# Calculamos la ODE; utilizando la función de Octave
%[t,y] = ode45(f,[0,2],y0);
% solucion analitica
x=@(y) sqrt(2*cos(y));
yy=linspace(-2*pi,2*pi,201);
xx=x(yy);
figure(1)
plot(yy,xx,'r-*')
grid on
grid minor
hold on


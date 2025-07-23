# pred_presa.m
clear all; clc; clf
%Ej8TP7.m
# x: predadores y presas
t = [0:1:20]; # variable dependiente (meses)
x0=[1600; 800]; # condicion inicial

F = @(t,x) [x(1)*(3-0.002*x(2)); -x(2)*(0.5-0.0006*x(1))];
%u = RK4Sistemas(f,t,u0);
[t, x] = pvi_rk4(F, [0,20], x0, 1000);
x1=x(:,1); % presas
x2=x(:,2); % predadores

figure(1)
% Presas
plot(t,x1,'r-')
hold on
% Predadores
plot(t,x2,'b-')
grid on
grid minor

title('Evolución de las especies')
xlabel('Tiempo (Meses desde el momento inicial)')
ylabel('Cantidad de individuos')
legend('Presa=x1', 'Predador=x2')
hold off

% Curva parametrica de predador-presa
figure(2)
% diagramas de plano de fase 
plot(x1,x2,'k-')
grid on
grid minor;
title('Orbita de la solución del sistema predador-presa')
xlabel('Presas (en miles)')
ylabel('Predadores (en miles)')

hold on
plot(x0(1),x0(2),'ko')
% calculo del punto de equilibrio en estado estacionario
% donde no hay crecimiento ni de presas ni de predadores
a=3;b=0.002; c=0.5; d=0.0006;
e1=a/b; e2=c/d;
plot(e1,e2,'g*')
legend('Eje X: Presas; Eje Y:Predadores', 'Cant.Inicial','Estado estacionario')
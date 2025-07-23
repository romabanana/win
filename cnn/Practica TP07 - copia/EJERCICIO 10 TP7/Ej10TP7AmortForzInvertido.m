% Ej10TP7AmortForzInvertido
clear all; clc; clf
%t = 0:0.05:20;
t=linspace(0,80,16000);
y=[];
inter=[0; 40];% periodo calculado
y0=[3.1; 0;0]; % condicion inicial, segun los diferentes puntos del ejercicio
               % y0=[posicion; velocidad]     
Long = 2.5; % longitud de la barra que sostiene la masa
d=0.1;
A=15;
% Planteo del modelo:

F = @(t,y) [y(2);y(3);-d*y(2)-((9.81/Long)+A*cos(2*pi*t)).*sin(y(1))];

% Lo calculo con un RK4

%[t,y] = RK4Sistemas(F,t,y0);
[t,y] = rk4Sistemas01(F,0,80,y0,16000);
%[t,y] = euler(F,inter,y0,2000);
y=y';
t=t';
%y10 = y(501,1);

%disp('posicion al cabo de 10 seg:')
%disp(y10)
%Graficamos el movimiento del pendulo
figure(1)
plot(t,y(:,1),'r-')
hold on
plot(t,y(:,2),'b-')
%plot(t(501), y10, 'kd','MarkerSize',15,'MarkerFaceColor','red','MarkerEdgeColor','green')
legend('Posicion', 'Velocidad')
grid on
grid minor
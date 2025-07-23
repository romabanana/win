% Ej10TP7
clear all; clc; clf
%t = 0:0.05:20;
N=400;
t=linspace(0,20,N);
h=20/N
y=[];
y0=[3.5; 1]; % condicion inicial, segun los diferentes puntos del ejercicio
               % y0=[posicion; velocidad]
L = 9.81; % longitud de la barra que sostiene la masa, NO ES LA GRAVEDAD

% Planteo del modelo:
%f = @(t,y) [y(2,1);-(9.81/L)*sin(y(1,1))];
F = @(t,y) [y(2);-(9.81/L).*sin(y(1))];

% Lo calculo con un RK4

%[t,y] = RK4Sistemas(F,t,y0);
[t,y] = rk4Sistemas01(F,0,20,y0,400);
y=y'; % lo transponemos para graficar
t=t';
p= 10/h
p1=15/h
y10 = y(p+1,1);
y15 = y(p1+1,1);
disp('posicion al cabo de 10 seg:')
disp(y10)

disp('posicion al cabo de 15 seg:')
disp(y15)

%Graficamos el movimiento del pendulo
figure(1)
plot(t,y(:,1),'r-')
hold on
plot(t,y(:,2),'b-')
plot(t(p+1), y10, 'kd','MarkerSize',15,'MarkerFaceColor','red','MarkerEdgeColor','green')
legend('Posicion', 'Velocidad','posicion a los 10 seg')
plot(t(p1+1), y15, 'kd','MarkerSize',15,'MarkerFaceColor','green','MarkerEdgeColor','red')
legend('Posicion', 'Velocidad','posicion a los 15 seg')

grid on
grid minor



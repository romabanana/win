clear all; clc
T=5;
f = @(t,y) y-sin(t)+cos(t);
% Su solucion con y(0) = 0 es : y(t) = sin(t);
% pero si cambiamos el punto de inicio es inestable

xint=0:0.2:5;
yint=-2.5:0.25:7;

figure

plot(0,sin(0),'bo');
hold on
plot(0,0.1,'k*');
axis([0 5 -2.5 7]);
grid on; grid minor;
waitforbuttonpress % hay que hacer clic sobre la figura para continuar.
plot(xint'*ones(size(yint)),ones(size(xint'))*yint,'r.');
% puntos en color rojo donde mostramos las pendientes o derivadas
% hold off
waitforbuttonpress
dirfield(f,xint,yint); hold on
% dirfield es una programacion en matlab y la copie para octave, grafica los
% pendientes de la funcion solucion de la ODE en cada punto.
waitforbuttonpress
tv=linspace(0,T,50);
for i=1:length(tv)
  plot(tv(1:i),sin(tv(1:i)),'k');
  % graficamos la solucion en color negro
  hold on
  % cuando y(0) = 0.1 la solucion es: y=sin(t)+C/exp(t).
  % la graficamos en color azul
  plot(tv(1:i),sin(tv(1:i))+0.1*exp(tv(1:i)),'b');
  pause(0.1)
end
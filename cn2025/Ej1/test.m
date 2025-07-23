
% Condición inicial: posición 0, velocidad 0
x0 = [0; 0];
tspan = [0 16];  % segundos

[t, x] = ode45(@bungee, tspan, x0);

gp = polyfit(t,x(:,2),10);
p = @(t) polyval(gp,t);
v_15 = interp1(t, x(:,2), 15);  % safer and more accurate
v_15
p(15)

##
##for i=1:size(t)
##  if(t(i)>14.99)
##    break
##  endif
##
##endfor
##t(i)
##x(i,2)

% Gráficas
figure(1)
plot(t, x(:,1))
xlabel('Tiempo (s)')
ylabel('Posición (m)')
title('Movimiento vertical del salto bungee')

figure(2)
plot(t, x(:,2))
xlabel('Tiempo (s)')
ylabel('Velocidad (m/s)')
title('Velocidad durante el salto bungee')


f = @(t, y) [y(2); -sin(y(1))];
y0 = [1 ; 0];

inter = [0 20];

h = 0.1
L = (inter(2)-inter(1))/h;

[t,y] = euler(f,inter,y0,L);

espacio = y(:,1);
velocidad = y(:,2);

figure(1);
plot(t,espacio);
figure(2);
plot(t,velocidad);

##
##f = @(t,y) [-t.*y(2); t.*y(1) - t.*y(2)];
##inter = [0 20];
##h = 0.05;
##L = (inter(2) - inter(1))/h;
##y0 = [1;-2];

f = @(t,y) [y(1).*(3-0.002.*y(2)); -y(2).*(0.5 - 0.0006.*y(1))];
y0 = [1600; 800];
inter = [0,12];
h = 0.1;
L = (inter(2) - inter(1))/h;

[t, w] = euler(f,inter,y0,L);

figure(1);
hold on;
plot(t, w(:,1));
plot(t, w(:,2));
legend('presa', 'depredador');

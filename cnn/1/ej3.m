# i = -pi:0.1:pi;
#Aproximaciones con Taylor lol
i = linspace(-pi,pi,25);
figure(4);
y = 1;
plot(i,y);

hold on;
plot(i,cos(i));
hold off;


figure(1);
[x, y] = g1(i);
plot(x,y);

hold on;
plot(x,cos(x));
hold off;

figure(2);
[x, y] = g2(i);
plot(x,y);

hold on;
plot(x,cos(x));
hold off;

figure(3);
[x, y] = g3(i);
plot(x,y);

hold on;
plot(x,cos(x));
hold off;

toc()

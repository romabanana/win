x = [1 2 3 4 5 6];
y = [1 4 9 15 25 36];

[S, ~, ~] = funcion_spline(x,y);
figure(1);
plot(x,y);
figure(2);
plot(x,S(x));



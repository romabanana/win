x = [1 2 3];
y = [1 4 9];
fx = [1 0 0];
figure(1);
x_data=-2:0.05:2;
plot(x_data,polyval(fx,x_data));
figure(2);
plot(x_data,newton_poly(x_data,x,dif_div(x,y)));




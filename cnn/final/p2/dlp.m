clear all;
F = @(x) [-2./x, 2./(x.^2), sin(log(x))./(x.^2)];

inter = [1 2];
yc = [1 2];

c2 = (1/70)*(8-12*sin(log(2))-4*cos(log(2)));
c1 = (11/10) - c2;
y = @(x) (c1.*x) + (c2./x.^2) - (3/10).*(sin(log(x))) - (1/10).*(cos(log(x)));
##c2 = (1/70)*(8-12*sin(log(2))-4*cos(log(2)));
##c1 = (11/10)-c2;
##y = @(x) c1.*x + c2./x.^2 - (3/10).*sin(log(x))-(1/10).*cos(log(x));

L = 5;
for(i=1:6)
L = L *2;
[xi, yi] = disparo_lineal(F,inter,yc,L);
plot(xi,yi);
hold on;
error = norm(y(xi) - yi)
[xi, yi] = dif_fin_dir(F,inter,yc,L);
plot(xi,yi);
error = norm(y(xi) - yi)

ycd = yc(1);
rob = [0 1 yc(2)];
[xi, yi] = dif_fin_rob(F,inter,ycd,rob,L);
plot(xi,yi);
plot(xi,y(xi));
hold off;
error = norm(y(xi) - yi)
i
endfor

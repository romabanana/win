% mx'' = mg - sign(x')cx'.^2;  x<= L

% u1 = x; u1' = x'
% u2 = x' u2' = x'' = g - ((sign(x').*c.*(x'.^2)./m)

g = 9.81;
CuerdaLargo = 30;
m = 68.1;
c = 0.25;
k = 40;
gamma = 8;

%caida libre: x = (a*t.^2)/2
%             30 = (9.81*t^2)/2
%             60= 9.81*t^2
%             sqrt(60/9.81) = t
tf = sqrt(60/9.81);
tf = tf +0.1;

f1 = @(t,y)[y(2); (g - ((sign(y(2)).*c.*(y(2).^2)./m)))];
f10 = [0;0];
inter = [0,tf];

##h = 0.1;

##L = (inter(2) - inter(1))/h;
L = 5;
[x1,y1] = euler(f1,inter,f10,L);
for(i=1:10)
  L = L * 2;
  [x1,y1] = euler(f1,inter,f10,L);
endfor

%busqueda del ti (y=30);
ti = 0;
for(i=floor(tf):length(y1))
  if(y1(i,1)>=30.0001) break; endif;
  yi = y1(i,1);
  ti = x1(i,1);
endfor;


% mx'' = mg - sign(x')cx'.^2 - k(x - L) - yx'; x > L

% u1 = x; u1' = x'
% u2 = x' u2' = x'' = g - ((sign(x').*c.*(x'.^2)./m)
%                     - (k.*(x-L)./m) - y.*x'


f2 = @(t,y)[y(2); (g - ((sign(y(2)).*c.*(y(2).^2)./m)) - (k.*(y(1)-CuerdaLargo)./m) - (gamma.*y(2)))];
f20 = [y1(1,1); y1(1,2)];

inter = [ti, 15];
L = 5;
[x2,y2] = euler(f2,inter,f20,L);
for(i=1:10)
  L = L * 2;
  [x2,y2] = euler(f2,inter,f20,L);
endfor

%(1)
velocidad15segundos = y2(end, 2);
distancia = yi + y2(end,1);
display(['v(15s) = ', num2str(velocidad15segundos), 'm/s']);
display(['x(15s) = ', num2str(distancia), ' m']);


%(2)
inter = [ti, 180];
L = 5;
[x2,y2] = euler(f2,inter,f20,L);
for(i=1:10)
  L = L * 2;
  [x2,y2] = euler(f2,inter,f20,L);
endfor

[extensionmaxima, i] = max(y2(:,1));

display(['xmax = ', num2str(extensionmaxima), 'm']);
tmax = 0;
for(i=floor(tf):length(y1))
  if(y2(i,1)>=46.701) break; endif;
  tmax = x2(i,1);
endfor;

display(['tmax = ', num2str(tmax), ' s']);

%(3)

inter = [tf,10];
[x2,y2] = rk4(f2,inter,f20,5000);
df0 = y2(1,2);
dfN = y2(end,2);
paso = ceil(length(y2)/11);

xspline = [];
yspline = [];
for (i=1:11)
  xspline = [xspline x2(paso*(i-1)+1,1)];
  yspline = [yspline y2(paso*(i-1)+1,1)];
endfor
[S,~,~] = funcion_spline(xspline, yspline, df0, dfN);

Long = S(10);
t = S(10);
##display(['v(15s) = ', num2str(velocidad15segundos), 'm/s']);
##display(['x(15s) = ', num2str(distancia), ' m']);





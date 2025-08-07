a = -1;
b = 1;
inter = [a b];
yc = [1 1];  % condiciones de borde
h = 0.1;
F = @(x) [ ...
  2 .* x ./ (1 - x .^ 2), ...
  -42 ./ (1 - x .^ 2), ...
  0 .* x ...
];   % <-- cada columna es p(x), q(x), f(x)

y_old = 0;
tol = 1e-5
for i = 1:10
  i
  L = round((inter(2) - inter(1)) / h);  % número de intervalos
  [x, y] = dif_fin_dir(F, inter, yc, L);

  [~, index] = min(abs(x));  % valor más cercano a 0


  if(abs(y(index)-y_old)<tol)
    fprintf("x = %.5f, y = %.5f\n", x(index), y(index));
    break;
  endif

  y_old = y(index);

  h = h / 2;
end


%Polinomio

tt = linspace(-1, 1, 7);
tt = tt';
qq = round(linspace(1,5121,7));

f1 = @(t) t.^6;
f2 = @(t) t.^5;
f3 = @(t) t.^4;
f4 = @(t) t.^3;
f5 = @(t) t.^2;
f6 = @(t) t;
f7 = @(t) ones(size(t));

M = [f1(tt) f2(tt) f3(tt) f4(tt) f5(tt) f6(tt) f7(tt)];
##M = [tt'.^6, tt'.^5, tt'.^4, tt'.^3, tt'.^2, tt', ones(length(tt), 1)];

Y = y(qq);
A = M'*M;
b = M'*Y;

c = A\b


Ajuste = @(xx) c(1).*f1(xx) + c(2).*f2(xx) + c(3).*f3(xx) + c(4).*f4(xx) + c(5).*f5(xx) + c(6).*f6(xx) + c(7).*f7(xx);

plot(x,Ajuste(x(1:length(x))));
tol = 1e-12;
kmax = 50;
[x1,k] = biseccion(Ajuste,0,0.4,50,tol)
##[x1_fix,~] = secante(Ajuste,x1,x1+0.05,kmax,tol)

[x2,k] = biseccion(Ajuste,0.4,0.7,50,1e-8)
##[x2_fix,~] = secante(Ajuste,x2,x2+0.05,kmax,tol)

[x3,k] = biseccion(Ajuste,0.8,1,50,1e-8)
##[x3_fix,~] = secante(Ajuste,x3,x3+0.05,kmax,tol)


roots([c(1) c(2) c(3) c(4) c(5) c(6) c(7)])
##a = -1;
##b = 1;
##inter = [a b];
##yc = [1 1];
##c = -42;
##F = @(x) [
##  (2.*x)./(1-(x.*x));
##  -(42)./(1-(x.*x));
##  0.^x
##  ];
##h = 0.1;
##
####todo mal...
##
##for i=1:5
##  L = (inter(2)-inter(1))/h;
##  [x,y]=dif_fin_dir(F,inter,yc,L);
##
##  [~,index] = min(abs(x));
##  x(index)
##  y(index)
##  h = h/2;
##endfor

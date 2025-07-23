
##a)
f  = @(m) ((9.8).*m).*(1-exp(-(15./m).*9))-(15*33);
x = 54:0.1:55;
##figure(1);
##plot(x,f(x));
##grid on;

xmin=54;
xmax=57;
it = 100;
tol = 1e-6;
[x,h] = biseccion(f,xmin,xmax,it,tol);
display(['m=', num2str(x)]);

##b)
g = @(c) ((9.8).*60*(1-exp(-(c./60).*9)))-(c.*33);
##figure(2);
##x = 16:0.1:17;
##plot(x,g(x));
##grid on;

xmin=16;
xmax=17;
it = 100;
tol = 1e-6;
[x,h] = biseccion(g,xmin,xmax,it,tol);
display(['c=', num2str(x)]);



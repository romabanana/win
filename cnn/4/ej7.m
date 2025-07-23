xmin = 0;
xmax = 1;

while (f(xmax)*f(xmin) > 0)
  xmax = xmax*2;
  if(xmax > 2^30)
    break
  endif
endwhile
xmax
i = linspace(0,xmax,100000);
F = f(i);
plot(i,F);
[x,h] = biseccion(@f, 0,xmax,100,1e-2);
h
x
f(x)
format long;
[x,h] = newton(@f,@df,x,100,1e-15);
h
x
f(x)

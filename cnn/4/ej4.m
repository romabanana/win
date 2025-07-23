x = -10:0.01:5;
plot(x,sin(x) + cos(1+x.^2)-1);
##
##y = sin(x) + cos(1+x.^2)-1;
## cos(x)-2*x*sin(x^2+1)
##w = [];
##k0 = 0;
##for i=1:160
####  [k,h] = newton(@f,@df,-2,50,1e-9);
##  [k,h] = secante(@f,-i,5,100,1e-9);
##  if h && k!=k0
##    w = [w k];
##    k0 = k;
##  endif
##endfor
##w
[k,h] = biseccion(@f,2.5,3,50,1e-2)
[w,h] = newton(@f,@df,k,50,1e-10)
[w,h] = secante(@f,k,k-1e-10,100,1e-10)

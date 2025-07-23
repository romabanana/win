##x! = 1

#for
##graficacion
x = -2:00.1:2;
plot(x,f(x));
# cero entre 0 y 1 #comportamiento asintotico en 1

xmin = 0;
xmax = 0.99;
[x,~] = biseccion(@f,xmin,xmax,100,1e-10)
0.02134300 - x
#x = 0.021343
##
##y = ((0.02./(1.-0.02)).*((sqrt(2.*x)./sqrt(2.+0.02)))).- 0.04;
##graficacion
##x = -5:0.05:5;
##plot(x,f(x));
##cero entre 3 y 4
##
##xmin = 3;
##xmax = 4;
##[x,~] = biseccion(@f,xmin,xmax,100,1e-5)

#x = 3.88

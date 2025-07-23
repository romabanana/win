##g1 = 1/2 *(10 - x^3)^1/2
##g1 = (10/(4+x))^1/2
##tic()
##[x,h] = biseccion(@f,-1,10,150,1e-3)
##toc()
##
##x =0:0.01:1;
##
##plot(x,g(x));
##
##tic()
##[x,h] = puntofijo(@g,2.5,150,1e-3)
##toc()
##f(x)

##w = @(x) x.^3 + 4*x^2 - 10;
i = linspace(1,3,50);
W = @w(i);
plot(i,W);
[x,h] = biseccion(@w,-1,10,150,1e-3)
hold on;
plot(x,0);


Z = @g(i);
plot(i,Z);
[u,h] = puntofijo(@g,-1,150,1e-3)



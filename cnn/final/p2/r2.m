x1 = [0.0819 0.2192 0.3582 0.3831 0.5256 0.8478 0.9872];

ge = [20.0 48.6 70.3 72.3 84.1 53.5 5.7];

x2 = 1 - x1;

T = 328;
R = 1.987;

Y = (R*T.*x1.*x2)./ge;
A = [ x1(:), ones(length(x1), 1)];

things = A\Y';
m = things(1);
b = things(2);

A1 = 1/b

A2 = 1/(m+b)
%b
##xx1 = 0.3;
##xx2 = 1 - xx1;
##
##parte1 = (A1*A2)/((A1*xx1)+(A2*xx2));
##parte2 = R*T*xx1*xx2;
##gge = parte1 * parte2

%c
##
##xx1 = 0.5;
##xx2 = 1 - xx1;
##
##parte1 = (A1*A2)/((A1*xx1)+(A2*xx2));
##parte2 = R*T*xx1*xx2;
##gge = parte1 * parte2
##
##error = abs(gge-80)/abs(80) %error relativo de la medición...


%d
##
##xx1 = linspace(0.50001,1,10000000);
##xx2 = 1 - xx1;
##
##parte1 = (A1*A2)./((A1.*xx1)+(A2.*xx2));
##parte2 = R*T.*xx1.*xx2;
##gge = parte1 .* parte2;
##
##[~,i] = min(abs(gge-10));
##xx2(i)

#biseccion?
##z = @(w) 1-w;
##g1 = @(w) (A1*A2)./((A1.*w)+(A2.*z(w)));
##g2 = @(w) R*T.*w.*z(w);
##G = @(w) (g1(w).*g2(w)) - 10;
G = @(xx1) ((A1*A2)./((A1.*xx1)+(A2.*(1-xx1))) .* R .* T .* xx1 .* (1-xx1)) - 10;
[sol,h] = biseccion(G,0.6,1,100,1e-6)
1 - sol...
##[sol, h] = puntofijo(G,1,100,1e-6)
##gge = parte1 .* parte2;

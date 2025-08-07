P = [0.985 1.108 1.363 1.631];
V = [25000 22200 18000 15000];

R = 82.05;
T = 303;

##%linealizar?

##Y = (((P.*V)./(R.*T)) - 1).*(V.*V);
##M = [ V(:), ones(length(V))];
##Y = (P .* V) ./ (R * T) .* V.^2 - V.^2;
##M = [V(:), ones(length(V))];


Y = ((P.*V)./(R*T)) - 1;
x1 = 1./V;
x2 = 1./(V.^2);

M = [x1(:), x2(:)];

A = M\Y';
A1 = A(1)
A2 = A(2)
..............
##
##poly = [2/(R*T) -1 -A1 -A2];
##roots(poly)

##
##poly = [0.5/(R*T) -1 -A1 -A2];
##roots(poly)
Q_old = 0;
##PP = @(VV) R*T.*((1./VV)+(A1./VV.^2)+(A2./VV.^3));
PP = @(VV) (R*T ./ VV) .* (1 + A1 ./ VV + A2 ./ VV.^2);

V2 = 3e5;
V1 = 1e5;
h = 1;
n = 10;

for i=1:10
  i
  L = (V2-V1)/h;

  Q=cuad_gauss_c(PP,V1,V2,L,n)

  if(abs(Q-Q_old)<1e-12)
    Q
    break
  endif
  Q_old = Q;

    h = h/2;
endfor


PPP = @(VVV) (R*T).*(log(VVV) - A1./VVV - A2./(2.*(VVV.^2)));

Q = PPP(V2) - PPP(V1)

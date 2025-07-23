L = 5; #m Longitud de Viga
P = 1.032*e + 4; #N/m Carga por unidad de Longitud
w = 0.07; #m Ancho seccion
s = 0.14; #m Alto seccion
J = (w*s^3)/12; #m^4 Momento de inercia
E = 210*e + 3; #M Pa Modulo de Young del Acero

Nh = 100; #numero de subintervalos
h = L/Nh; #longitud de los subintervalos

A = diag(6*ones(1,Nh-3),0) + diag(-4*ones(1,Nh-4),1) + diag(-4*ones(1,Nh-4),-1)+...
    diag(1*ones(1,Nh-5),2) + diag(1*ones(1,Nh-5),-2);

b =  (((h^4)*P)/(E*J))* ones(Nh-3,1);

tol = 1e-8;
x0 = ones(Nh-3,1);
maxit = 5000;
w = 0.5;

##x = gauss_p(A,b)
##z = A\b
##plot(2:Nh-2, -x);

##AA = [2 -2 0;-1 2 -1;0 -1 2];
##bb = [1 2 3]';
##x0 = [0 0 0]';
##x = AA\bb
r=pivot(A,b);
P = permutacion(r);
AA = P*[A b];
A= AA(:,1:end-1);
b= AA(:,end);
##[x, it, ~ ]=jacobi(A, b, x0, maxit, tol)

[T, ~, ~] = to_jacobi(A,b);
max(abs(eig(T)))
[T, ~, ~] = to_gaussseidel(A,b);
max(abs(eig(T)))
[T, ~, ~] = to_sor(A,b,w);
max(abs(eig(T)))




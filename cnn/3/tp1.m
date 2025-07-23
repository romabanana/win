##]]
## Definicion de matriz
A = diag(2*ones(40,1),0) - diag(ones(39,1),1) - diag(ones(39,1),-1);

## Definicion de vector b
b =(([1:40]*1.5)-6)';


## Resolucion por gauss
x = gauss(A,b);
x(20)

## Declaracion de los argumentos de los metodos iterativos
x0 = zeros(1,40)';
itmax= 3000;
w = 1.85;
tol = 1e-5;

##norma usada como criteria de convergencia
## norma infinito del error relativo de dos it. sucesivas
## ie: norm((A*x - b)/(A*x),inf);

[T1, ~, ~] = to_jacobi(A,b);
[T2, ~, ~] = to_gaussseidel(A,b);
[T3, ~, ~] = to_sor(A,b,w);

p1 = max(abs(eig(T1)))
p2 = max(abs(eig(T2)))
p3 = max(abs(eig(T3)))


[~,itj,~] = jacobi(A,b,x0,itmax,tol)
[~,itg,~] = gaussseidel(A,b,x0,itmax,tol)
[~,its,~] = sor(A,b,x0,itmax,tol,w)


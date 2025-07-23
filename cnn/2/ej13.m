N = 100;                         % Número de puntos
h = 1 / N;                      % Paso (si estás resolviendo algo tipo ecuación de Poisson 1D)
A = zeros(N, N);                % Matriz de coeficientes
b = zeros(N, 1);                % Vector independiente

% Condiciones de frontera:
A(1,1) = 1;                     % x1 = 0
A(N,N) = 1;                     % xN = 0
b(1) = 0;
b(N) = 0;

% Ecuaciones interiores:
maximos = zeros(1,10);
clc;
for k =1:10

  for i = 2:N-1
      A(i, i-1) = -1;
      A(i, i)   =  2;
      A(i, i+1) = -1;
      b(i) = 1 / (N^k);
  end
  % Resolver el sistema
  ##x = A \ b;
  x = gauss(A,b);
  hold on;
  plot(linspace(0,1,N),x);
  maximos(k) = max(x);
end
% Mostrar solución
##disp(x);

clear all; clc;

% Datos del problema
x1 = [0.0819, 0.2192, 0.3582, 0.3831, 0.5256, 0.8478, 0.9872];
ge = [20.0, 48.6, 70.3, 72.3, 84.1, 53.5, 5.7]; % en cal/mol

% Constantes
R = 1.987;        % cal/mol·K
T = 328;          % Kelvin

% Cálculos auxiliares
x2 = 1 - x1;
Y = (R * T .* x1 .* x2) ./ ge;  % lado izquierdo de la ecuación linealizada

% Matriz del sistema lineal: Y = x1 * m + 1 * b
A = [x1(:), ones(length(x1), 1)];

% Mínimos cuadrados: resolver Ax = Y
params = A \ Y(:);

m = params(1);
b = params(2);

% Recuperar A1 y A2
A1 = 1 / b;
A2 = 1 / (b + m);

% Mostrar resultados con 4 cifras
fprintf("A1 = %.4f\n", A1);
fprintf("A2 = %.4f\n", A2);


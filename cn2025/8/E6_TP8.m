################ CÁLCULO NUMÉRICO ################
###################### 2025 ######################
###################### TP 8 ######################
################## EJERCICIO 6 ###################

% PVC calentamiento de una barra de cobre con una fuente. Difusion-reaccion
% Ecuación que describe el problema: -K0u''(x) + cR(x)u(x) = f(x)
% Ley de enfriamiento de Newton
% PVC tipo Robin -K0*u'(L) = H(u(L)-ue);
% Ej: -0.9*u'(3)-15*u(3)= -15*4 ====> [0.9 15 60]

%Las condiciones de contorno son:
%1. En x = 0 (Dirichlet): y(0) = 6
%2. En x = 5 (Robin): 0.9*y''(5) + 15*y(5) = 60;

Long = 5;                   % Longitud de la barra
y0 = 6;                     % Temperatura extremo izquierdo
H = 15;                     % Coeficiente convectivo en la frontera
ue = 4;                     % Temperatura exterior
K0 = 0.9;                   % Conductividad termica (depende del material)
fuente = @(x) 5.*x.*(5-x);       % Fuente de calor "r"
pR = @(x) 1.05.*x+2;        % Proceso reactivo
%===========================================================
f = @(x) [0.*x  pR(x)./K0  -fuente(x)./K0];
% EDO original: -K0*y''(x) + pR(x)*y(x) = fuente(x)
% EDO reescrita: y''(x) = p(x)*y'(x) + q(x)*y(x) + r(x)
% En este problema: y''(x) = 0*y'(x) + -pR(x)/-K0 *y(x) +(1/-K0)*fuente(x).
%===========================================================
% Condición de Contorno Derecha (Robin): 0.9*y'(5) + 15*y(5) = 60
% Esto es un caso de Robin: Ay'(b) + By(b) = C
% El formato de 'rob' es [A B C]:
rob = [K0 H 60];
%===========================================================
% Para garantizar cuatro decimales exactos, reducimos h hasta que la solución
% para y(3) se estabilice.
h = 0.1;           % Tamaño de paso inicial
y_ant = 0;         % Valor inicial para la comparación
tol = 5e-5;        % Tolerancia para la convergencia
inter = [0 Long];

for i = 1:10 % Limitamos a 10 iteraciones para seguridad
    N = round(Long/h); % Número de intervalos

    [xDFR, yDFR] = dif_fin_rob(f,inter,y0,rob,N);

    % Encontrar el valor en el punto medio x=2.5
    % El índice del medio es (N/2)+1 para una malla de N+1 puntos
    [~, mid_idx] = min(abs(xDFR - 2.5));
    y_nuevo = yDFR(mid_idx);

    diff = abs(y_nuevo-y_ant);

    % Criterio de parada: la diferencia es menor que la tolerancia
    if diff < tol
        break;
    end

    y_ant = y_nuevo;
    h = h/2; % Reducimos el tamaño de paso para la siguiente iteración
end
fprintf('Convergencia alcanzada con h = %.4f\n\n', h);
fprintf('RESPUESTA (b): La temperatura en el punto medio (x=2.5) es %.4f °C\n', y_nuevo);
%===========================================================
figure(1);
plot(xDFR, yDFR, 'b-o');
hold on;
% Marcar el punto medio en el gráfico
plot(xDFR(mid_idx), yDFR(mid_idx), 'r*', 'MarkerSize', 12, 'LineWidth', 2);
text(xDFR(mid_idx) + 0.1, yDFR(mid_idx), ...
     sprintf('Punto medio: (%.2f, %.4f)', xDFR(mid_idx), yDFR(mid_idx)), ...
     'VerticalAlignment', 'middle', 'FontSize', 12, 'Color', 'r');
hold off;
title(sprintf('Perfil de Temperatura en la Barra (h = %.4f)', h));
xlabel('Posición en la barra (x) [cm]');
ylabel('Temperatura (y) [°C]');
grid on; grid minor;

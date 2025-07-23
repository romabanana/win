################ CÁLCULO NUMÉRICO ################
###################### 2025 ######################
###################### TP 8 ######################
################## EJERCICIO 7 ###################

% Geometría
W1 = 2;     % Ancho inicial [cm]
L = 6;      % Longitud teórica para el cono [cm]
L1 = 4;     % Longitud real de la aleta [cm]
D = 0.2;    % Espesor de la aleta [cm]
% Propiedades
k = 2.04;   % Conductividad térmica [W/(cm*°C)]
H = 6e-3;   % Coeficiente de convección [W/(cm^2*°C)]
% Temperaturas
uw = 200;   % Temperatura de la base (wall) [°C]
uE = 40;    % Temperatura del ambiente (exterior) [°C]
%===========================================================
% u''(x) = p(x)*u'(x) + q(x)*u(x) + r(x)
% Partimos de la ecuación dada:
% (D*W1/L)*(L - x)*u''(x) - (D*W1/L)*u'(x) = (H/k)*((2*W1/L)*(L - x) + 2D)*(u(x) - uE)
% Para despejar u''(x), dividimos todo por el término que la acompaña, (D*W1/L)*(L - x):
% u''(x) - (1/(L-x))*u'(x) = (H/k) * [ ((2*W1/L)*(L-x) + 2D) / ((D*W1/L)*(L-x)) ]
% * (u(x) - uE)

% p(x) = 1 / (L - x)
p = @(x) 1 ./ (L - x);
% q(x) = (H/k) * P(x) / A(x)
q_num = @(x) (H/k)*((2*W1/L)*(L-x)+2*D);
q_den = @(x) (D*W1/L)*(L-x);
q = @(x) q_num(x)./q_den(x);
% r(x) = -q(x) * uE
r = @(x) -q(x) * uE;

edo_coef = @(x)[p(x) q(x) r(x)];
%===========================================================
% Izquierda (x=0, Dirichlet): u(0) = uw
ycd = uw;
inter = [0 L1];
% Derecha (x=L1, Robin): k*u'(L1) + H*u(L1) = H*uE
% Formato [A, B, C] donde A*y'(b) + B*y(b) = C
rob = [k H H*uE];
%===========================================================
N_inicial = 40;
flujo_ant = 0;
tol = 1e-4; % Tolerancia para la convergencia del flujo

for i = 1:10 % Bucle de refinamiento
    N = N_inicial*2^(i-1); % Duplicamos N en cada paso

  % Resolver el PVI
    [x, y] = dif_fin_rob(edo_coef,inter,ycd,rob,N);

  % (b) Estimar el flujo de calor en la base (x=0)
  % Φ = -k * A1 / δx * (u(x1) - u(0))
    A1 = W1 * D;          % Área transversal en x=0
    deltax = x(2) - x(1); % Tamaño de la malla
    delta_u = y(2) - y(1);% Diferencia de temperatura
    flujo_nuevo = -k * A1 * delta_u / deltax;

    diff = abs(flujo_nuevo - flujo_ant);
##    fprintf('%5d %20.6f %15.6f\n', N, flujo_nuevo, diff);

    if i > 1 && diff < tol
        break;
    end

    flujo_ant = flujo_nuevo;
end
%===========================================================
fprintf('Convergencia del flujo alcanzada con N = %d\n', N);
%===========================================================
figure(1);
plot(x, y, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 3);
grid on; grid minor;
xlabel('Posición en la aleta (x) [cm]');
ylabel('Temperatura (u) [°C]');
title(sprintf('Perfil de Temperatura en la Aleta Disipadora (N=%d)', N));
legend('Temperatura u(x)', 'Location', 'northeast');
%===========================================================
fprintf('\nRESPUESTA (b):\n');
fprintf('El flujo de calor estimado que sale del dispositivo es: %.4f W\n', flujo_nuevo);

################ CÁLCULO NUMÉRICO ################
###################### 2025 ######################
###################### TP 8 ######################
################## EJERCICIO 5 ###################

% PVC calentamiento de una barra de cobre con una fuente. Difusion-reaccion
% Ley de enfriamiento de Newton
% PVC tipo Robin -K0*u'(L) = H(u(L)-ue);
% Ej: -0.9*u'(3)-15*u(3)= -15*4 ====> [-0.9 -15  -60]

Long = 3;                  % Longitud de la barra
y0 = 21;                   % Temperatura extremo izquierdo
H = 0;                     % Coeficiente convectivo en la frontera
##ue = 4;                    % Temperatura exterior
K0 = 1;                    % Conductividad termica (depende del material)
fuente = @(x) 20*sin(5*(x-1));  % Fuente de calor "r"
pR = @(x) 0.*x;            % Proceso reactivo
%===========================================================
f = @(x) [0.*x  pR(x)./K0  -fuente(x)./K0]; % y’’ = p(x)y’ + q(x)y + r(x)
% En este problema: -(K0 * y')' = fuente(x).
% p(x) está relacionado con la difusión o conductividad.
% q(x) está relacionado con la reacción o pérdida/ganancia de calor proporcional a la temperatura.
% r(x) es una fuente de calor externa independiente.
%===========================================================
% Condición de Contorno Derecha: Extremo Aislado y'(3) = 0
% Esto es un caso de Robin: Ay'(b) + By(b) = C
% Para y'(3) = 0, tenemos: Ay'(3) + 0*y(3) = 0
% El formato de 'rob' es [A B C]:
rob = [K0 0 0];
%===========================================================
% Para garantizar dos decimales exactos, reducimos h hasta que la solución
% para y(3) se estabilice.
h = 0.1;           % Tamaño de paso inicial
y_ant = 0;         % Valor inicial para la comparación
tol = 5e-3;        % Tolerancia para la convergencia
inter = [0 Long];

for i = 1:10 % Limitamos a 10 iteraciones para seguridad
    N = round(Long/h); % Número de intervalos

    [xDFR, yDFR] = dif_fin_rob(f,inter,y0,rob,N);

    y_nuevo = yDFR(end); % Temperatura en el extremo derecho

    diff = abs(y_nuevo-y_ant);

    % Criterio de parada: la diferencia es menor que la tolerancia
    if diff < tol
        break;
    end

    y_ant = y_nuevo;
    h = h/2; % Reducimos el tamaño de paso para la siguiente iteración
end
fprintf('Convergencia alcanzada con h = %.4f\n', h);
fprintf('\nRESPUESTA (a): La temperatura en el extremo derecho (x=3) es %.2f\n', y_nuevo);
%===========================================================
[max_temp,idx] = max(yDFR);
max_pos = xDFR(idx);
fprintf('\nRESPUESTA (b): La temperatura máxima es de: %.2f y se alcanza a x = %.2f\n', max_temp, max_pos);
%===========================================================
figure(1)
plot(xDFR,yDFR,'b-*');
title('Temperatura a la largo de la barra calculada por DFinitas con h=0.1')
xlabel('posicion: X')
ylabel('Temperatura')
grid on; grid minor

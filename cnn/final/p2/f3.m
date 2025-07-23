 l = @(t) 10 + (1 * cos(t + 0.02)); %l(t)
 dl = @(t) - sin(t + 0.02); %dl/dt (t)


 %Y'' = -(2.*dl(t).* Y')./l(t) - (9.81*Y)./l(t)
 F = @(t)[-(2.*dl(t))./l(t), -(9.81)./l(t),0];
 inter = [0, 5];
 yc = [0.5, 0];
## L = 5;
 L = (inter(2)-inter(1))/0.1;
 for(i=1:7)
  i
  L = L *2;
  [x,y] = disparo_lineal(F, inter, yc, L);

 endfor

## [~, i5s]= min(abs(x-5));
 value = (y(2)-y(1))/(x(2)-x(1))
 [maximus, imax] = max(abs(y));
 maximus
 x(imax)

 y(round(length(x)/2))


##"cifras exactas" (cifras significativas) → tolerancia relativa
##
##"decimales" → tolerancia absoluta
##  if abs((valor_actual - valor_anterior)/valor_actual) < tol
##    break;
##  end
## if abs(valor_actual - valor_anterior) < tol
##    break;
##  end
## %(1)derivada
## dy = -y;
## vi = dy(1);
## display(['la velocidad inicial debe ser: ', num2str(vi), ' m/s']);
## %(2)
## [amplitud,pos] = min(y); %máxima amplitud
## t_max = x(pos); %tiempo
## display(['Máxima amplitud: ', num2str(amplitud), ' rad']);
## display(['Tiempo : ', num2str(t_max), ' s']);
## %(3)
## longitud = length(x);
## segundo2coma5 = 2.5* (longitud/5);
## angulo = y(floor(segundo2coma5));
## display(['Angulo con la vertical: ', num2str(angulo), ' rad']);

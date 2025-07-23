a = 0;
b = 10;
inter = [a b];
y0 = zeros(2,1);
h = 0.1;

% [pos, vel] = b(t, x);


for i=1:1
  L = (inter(2)-inter(1))/h;
  i
  [t,y]=rk4(@b, inter, y0, 5000); %5000 steps
  h = h/2;
endfor
##
##[~, vel15] = min(abs(t-15));
##t(vel15)
##y(vel15, 1)
##y(vel15, 2)
##
##maximusdistancium = max(y(:,1))
##[~,imax] = min(abs(y(:,1) - maximusdistancium));
##tiempo_del_max = t(imax)

%c...
##i = linspace(0,10,11);
indices = round(linspace(1, length(t), 11));
tt = t(indices);
yy = y(indices,1);
df0 = y(1,2);
dfn = y(end, 2);

[S, DS, DDS] = funcion_spline(tt', yy', df0, dfn);

coso = linspace(6,10,5000);
[encoje, taux]= min(S(coso))
coso(taux)

function z = b(t, x)
  L = 30;
  m = 68.1;
  cd = 0.25;
  k = 40;
  gamma = 8;
  g = 9.81;

  pos = x(1);
  vel = x(2);


  A = m*g;
  B = sign(vel)*cd*vel*vel;

  C = k*(pos-L) + (gamma*vel);


  y = zeros(2,1);
  y(1) = vel;

  if (pos>L)
    y(2) = (A - B - C)/m;
  else
    y(2) = (A - B)/m;
  endif

endfunction

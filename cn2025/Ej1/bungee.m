function dx = bungee(t, x)
  % Parámetros
  L = 30;
  m = 68.1;
  cd = 0.25;
  k = 40;
  gamma = 8;
  g = 9.81;

  pos = x(1); % posición
  vel = x(2); % velocidad

  signo = sign(vel);

  dx = zeros(2,1);
  dx(1) = vel;

  if pos <= L
    dx(2) = g - signo * cd/m * vel^2;
  else
    dx(2) = g - signo * cd/m * vel^2 - (k/m)*(pos - L) - (gamma/m)*vel;
  end
end

function y = b(t, x)
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

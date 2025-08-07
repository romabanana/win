a = 0;
b = 10;
inter = [a b];

y0 = zeros(2,1);

y0(1) = 0.5;
h = 0.1;
y_viejo = 0;


function y = F(t, x);
  tita = pi/6; %30 grados
  k = 50;
  mu = 0.3;
  g = 9.8; %bien?
  m = 1; %?

  pos = x(1);
  vel = x(2);

  A = k/m;
  B = g*sin(tita);
  C = mu*g*cos(tita);



  y = zeros(2,1);
  y(1) = vel;

  if(vel > 0)
    y(2) = - A*pos - B- C;
  endif

  if (vel < 0)
      y(2) = - A*pos - B + C;
  endif
  if (vel == 0)
      y(2) = -A*pos - B;
  endif


endfunction
index = 0;
for i=1:10
  i
  L = (inter(2)-inter(1))/h;
  [t,y]=rk4(@F, inter, y0, L);
  [~,index] = min(abs(t-1));
  y_nuevo = y(index,1)
  if(abs(y_nuevo-y_viejo)<1e-4)
    y_nuevo % valor en y(0);
    break;
  endif
  y_viejo = y_nuevo;

  h = h/2;

endfor


[minimus, index_tempo]= min(y(1:index, 1))
t(index_tempo)

yy = y(:,2)+ 4e-4;

[~, index_dua] = min(abs(t-2.5))

for i=index_dua:index_dua+1000
  if(y(i,2) < 1e-3)
    y(i,1)
    t(i)
    break;
  endif
endfor





##f = @(t,y) [y(2); -(g/l).*y(1) - (k/m1).*(y(1)-y(3); y(4); -(g/l).*y(3) + (k/m2).*(y(1)-y(3)];
##m1x′′1m2x′′2=−m1glx1−k(x1−x2)=−m2glx2+k(x1−x2)

f = @(t,y) [y(2); -(9.81/15).*y(1) - (4/3).*(y(1)-y(3)); y(4); -(9.81/15).*y(3) + (4/1).*(y(1)-y(3))];
y0 = [0; 0; 0.5; 0];
inter = [0,10];
h = 0.1;

L = (inter(2) - inter(1))/h;

[t,y]=euler(f, inter, y0, L);
oldy = y(end,:);
for(i=1:12)
  i
  L = L *2;
  [t,y]=euler(f, inter, y0, L);
  exit = true;
  for(j=1:4) %sale si el error es menor que
    if(abs(y(end,j)-oldy(end,j))>10^-8) exit = false;endif;
  endfor

  if (exit)
    iteracion = i
    break;
  endif
oldy =y;
endfor;
posx1 = y(end,1) %x1
speedx1 = y(end,2) %dx1
posx2 = y(end,3) %x2
speedx2 = y(end,4) %dx2


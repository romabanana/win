function z = ydotAmort(t,y)
  g = 9.81;
  d=1;
  length=1;
  z(1) = y(2)
  z(2) = -(g/length)*sin(y(1)) - d*y(2);
function z = ydot(t,y)
  g = 9.81;
  length=1;
  z(1) = y(2)
  z(2) = -(g/length)*sin(y(1));
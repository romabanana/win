function y=trapstep(t,x,h)
  % un paso del metodo del trapecio
  z1 = ydot(t,x);
  g =x+h*z1;
  %z2=ydot(t+h,g);
  %z2=ydotAmort(t+h,g);
  z2=ydotAmortForz(t+h,g);
  y = x+h*(z1+z2)/2;
  
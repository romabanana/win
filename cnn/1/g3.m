function [x ,y] = g3 (i)
  x = i;
  y = 1-x.^2/factorial(2)+x.^4/factorial(4)-x.^6/factorial(6);
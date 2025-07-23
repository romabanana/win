function [x ,y] = g2 (i)
  x = i;
  y = 1-x.^2/factorial(2)+x.^4/factorial(4);
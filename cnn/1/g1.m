function [x ,y] = g1 (i)
  x = i;
  y = 1-x.^2/factorial(2);
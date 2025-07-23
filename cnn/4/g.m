function y = g(x)
##    y = sqrt(10)./sqrt((x+4)); # converge porque y'(1) !=  0

#+ x^3 +4*x^2-10;
 y =  0.5 * sqrt(10 - (x.^3)); #diverge porque y'(1) =  0
  endfunction

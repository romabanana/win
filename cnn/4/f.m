function y = f(x)

##y = ((x./(1.-x)).*((sqrt(2*3.4)./sqrt(2.+x))))- 0.04;
##y  = x * (log(x+3))-18;
##y  = x .* (log(x+3)-17) - 1;
y = x .* (log(x + 3) - 17) - 1;

##y = x.*log(x+3) - x.*17 - 1;
##   y  = sin(x) + cos(1+(x.^2)) - 1; #ej4


##   y  = x^3 +4*(x^2) - 10; #ej2
##    y = x*(x-3);
endfunction

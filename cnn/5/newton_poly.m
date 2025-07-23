function y = newton_poly(x, x_data, coeff)
    n = length(x_data);
    y = coeff(1);
    term = 1;
    for i = 2:n
        term = term .* (x - x_data(i-1));
        y = y + coeff(i) * term;
    endfor
endfunction

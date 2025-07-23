A = [0 1 2; 1 2 1; 2 0 1];
rank(A)
b =  [1 0 2]';
r = pivot(A,b);
P = permutacion(r);

A\b

[X] = doolittle_p(A,b)

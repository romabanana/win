b = [1 2 3]';
A = [1 2 -1; 2 4 0; 0 1 -1];


[x,Ar,L,U,P] = doolittle_p(A,b);


x

Ar
P
L
U

n = 5;
main = 2*ones(n,1);         % diagonal principal
upper = -1*ones(n-1,1);     % diagonal superior
lower = -1*ones(n-1,1);     % diagonal inferior

A = diag(main) + diag(upper, 1) + diag(lower, -1);

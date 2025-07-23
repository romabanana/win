#ej8
n = 1000;
tic();
sum = 0;
#normal
for (i=0:n)
  for(j=0:i)
    sum += i*j;
  endfor
endfor

toc()

#siplificado

tic();
sum = 0;
for (i=0:n)
  for(j=0:i)
    sum += j;
  endfor
  sum = sum*i;
endfor

toc()


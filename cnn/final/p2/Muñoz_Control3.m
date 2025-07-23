f = @(t) 3.*(t+0.5).*sin((t-2.7)./2).^4;
df= @(t) 3.*((sin((t-2.7)./2)).^4) + 6.*(t+0.5).*((sin((t-2.7)./2)).^3).*cos((t-2.7)./2);

df0 = df(0);
dfn = df(2.4);

x = linspace(0,2.4,11);
y = f(x);


[S,dS,~] = funcion_spline(x,y,df0,dfn);

radio = S(1)

error = f(1)-S(1)


integrando = @(w) 2*pi.*S(w).*sqrt(1+dS(w).^2);

area = cuad_gauss_c(integrando,0,2.4,100,10)



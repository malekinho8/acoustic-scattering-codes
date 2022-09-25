
x = 10;
y = 10;
f = 1000;
c = 1480;
k = 2*pi/(c/f);
r = (x^2 + y^2)^0.5;
test = exp(1i*k*r*(-x/r))
%%
out = 0;
for n = 0:75
    P_n = legendre_test(n,-x/r);
    j_n = real(sphankel2(n,k*r));
    out = out + (1i)^n*(2*n+1)*j_n*P_n;
end

out
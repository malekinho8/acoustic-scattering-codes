function out = sphankel(n,z)
% returns a spherical hankel function of the first kind, h1_n
mult_factor = (1i)^(-n-1)*z^(-1)*exp(1i*z);
out = 0;
for m = 0:n
    out = out + factorial(n+m)/(factorial(m)*factorial(n-m))*(-2*1i*z)^(-m);
end
out = mult_factor*out;
end


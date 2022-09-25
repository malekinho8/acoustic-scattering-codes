function P = legendre_test(N,x)
%computes legendre polynomial evaluated at n of argument x
P = zeros(N+1,1);
for n = 0:N
    if n == 0
        P(n + 1) = 1;
    elseif n == 1
        P(n + 1) = x;
    else
        P(n + 1) = (2*n-1)/n * x * P(n) - (n-1)/n * P(n-1);
    end
end
P = P(N+1);
end


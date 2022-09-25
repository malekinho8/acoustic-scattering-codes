function H1_n = sphankel2(n,z)
% returns a spherical hankel function of the first kind, h1_n
H1_n = sphbesj(n,z) + 1i*sphbesy(n,z);
end




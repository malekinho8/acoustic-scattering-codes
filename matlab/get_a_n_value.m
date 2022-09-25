function out = get_a_n_value(argument, n, shape)
%get_a_n_value returns the a_n value according to Makris et. al 1994.
%   argument: the argument to the Bessel functions contained within a_n
%   n: the value at which to compute Bessel/Hankel functions
%   shape: the shape/type of object within the acoustic field

%% Default Arguments
if nargin < 3
    shape = "pr_sphere";
end

%% Main code
if contains(shape,"pr_sphere")
    h1_n = sphankel2(n,argument);
    j_n = real(h1_n);
    out = j_n/h1_n;
end

end


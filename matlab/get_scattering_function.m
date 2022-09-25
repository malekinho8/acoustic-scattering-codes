function output = get_scattering_function(num_iterations, rho, phi_i, phi, shape, a, f, c)
%GET_SCATTERING_FUNCTION computes the acoustic scattered pressure field from an incident
%plane wave. 
%   num_iterations: int, the number of iterations this algorithm will
%   compute over to obtain the pressure field
%   h_n: honestly not sure
%   k: don't know
%   rho: range from sphere, [m]
%   P_n: Legendre function evaluation
%   phi_i: The angle from which the plane wave originates
%   phi: The angles over which the computation is performed
%   shape: string, The shape of interest within the acoustic field, default
%   a: double, radius of object in field [m]
%   f: double, frequency of incident wave [hz]
%   is "pr_sphere" for pressure release sphere

%% Default values
if nargin < 8
    fprintf('Default arguments will be used...')
    shape = 'pr_sphere';
    c = 1330;
    a = 1;
    f = 1000; % [hz]   
end
lambda = c/f;
k = 2*pi()/lambda; 

%% Main Algorithm
output = zeros(1,size(phi,2));
for idx = 1:size(phi,2)
    i = phi(idx);
    for n = 1:num_iterations
        a_n = get_a_n_value(k*a,n,shape);
        h_1n = besselh(n,k*rho);
        P_n = legendreP(n,cos(i-phi_i));
        output(idx) = output(idx) + (1i)^n*(2*n+1)*a_n*h_1n*P_n; % Equation C2 in Makris Paper
    end
end

output = -1*output;
end


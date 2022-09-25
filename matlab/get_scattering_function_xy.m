function output = get_scattering_function_xy(num_iterations, x, y, shape, a, f, c)
%GET_SCATTERING_FUNCTION computes the acoustic scattered pressure field from an incident
%plane wave. 
%   num_iterations: int, the number of iterations this algorithm will
%   compute over to obtain the pressure field
%   h_n: honestly not sure
%   k: don't know
%   x: the x distance of a point in space from the center of the sphere [m]
%   y: the y distance of a point in space from the center of the object
%   [m]
%   P_n: Legendre function evaluation
%   shape: string, The shape of interest within the acoustic field, default
%   a: double, radius of object in field [m]
%   f: double, frequency of incident wave [hz]
%   is "pr_sphere" for pressure release sphere

%% Default values
if nargin < 7
    fprintf('Default arguments will be used...')
    shape = 'pr_sphere';
    c = 1330;
    a = 1;
    f = 1000; % [hz]   
end
lambda = c/f;
k = 2*pi()/lambda; 
r =(x^2 + y^2)^0.5;

%% Complex Sum at (x,y)
output = 0;
if r > a
    for n = 0:num_iterations
        a_n = get_a_n_value(k*a,n,shape);
        h_1n = sphankel2(n,k*r);
        P_n = legendre_test(n,-x/r);
        output = output + (1i)^n*(2*n+1)*a_n*h_1n*P_n; % Equation C2 in Makris Paper
    end
end
output = -output;
end


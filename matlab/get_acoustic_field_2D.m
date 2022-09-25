function [V_t,V_s,V_i] = get_acoustic_field_2D(scattering_iterations, x_iter, y_iter, shape, a, f, c)
%get_scattered_field_2D Calculate the total acoustic field from a pressure
%release sphere in a waveguide. Returns the total (V_t), scattered (V_s), and
%incident (V_i) wave in the form of a 2D matrix of complex numbers. Rows
%correspond to radial dimension, and columns correspond to angle phi.
%   scattering_iterations: int, the number of iterations this algorithm will
%       compute over to obtain the scattering function
%   h_n: honestly not sure
%   k: wavenumber [rad/m]
%   x_iter: x-values to iterate over, [m]
%   y_iter: y-values to iterate over, [m]
%   P_n: Legendre function evaluation
%   shape: string, The shape of interest within the acoustic field, default
%       is "pr_sphere" for pressure release sphere
%   a: double, radius of object in field [m]
%   f: double, frequency of incident wave [hz]
%   c: speed of sound in medium

% define k
lambda = c/f;
k = 2*pi()/lambda;

% define incident wave
V_i = zeros(length(x_iter),length(y_iter));
V_s = zeros(length(x_iter),length(y_iter));

for i = 1:length(x_iter)
    x_i = x_iter(i);
    for j = 1:length(y_iter)
        y_i = y_iter(j);
        if (x_i^2 + y_i^2)^0.5 > a
            V_s(i,j) = get_scattering_function_xy(scattering_iterations, x_i, y_i, shape, a, f, c);
            V_i(i,j) = exp(-1j*k*x_i);
        end
    end
end

% get total wave
V_t = V_i + V_s;

% % Make vectors equal in dimension
% if size(V_t,1) > size(V_t,2)
%     V_t = V_t(1:size(V_t,2),:);
%     V_s = V_s(1:size(V_s,2),:);
%     V_i = V_i(1:size(V_i,2),:);
% else
%     V_t = V_t(:,1:size(V_t,1));
%     V_s = V_s(:,1:size(V_s,1));
%     V_i = V_i(:,1:size(V_i,1));
% end

end


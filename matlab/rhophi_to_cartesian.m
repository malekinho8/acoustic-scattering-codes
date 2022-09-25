function [outputArg1,outputArg2] = rhophi_to_cartesian(rho,phi,V_t)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

for i = 1:length(rho)
    rho_i = rho(i);
    for j = 1:length(phi)
        phi_j = phi(j);
        x(i,j) = rho_i*cos(phi_j);
        y(i,j) = rho_i*sin(phi_j);

outputArg1 = inputArg1;
outputArg2 = inputArg2;
end


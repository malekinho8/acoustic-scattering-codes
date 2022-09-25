%% Pressure Release Sphere Example
% This code will attempt to compute the scattered and total acoustic
% pressure field in spherical coordinates due to a pressure release sphere.

% Author: Malek Ibrahim
% Date: September 5, 2022


clear; clc; close all;
set(groot, 'defaulttextInterpreter','latex'); set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
%% Positional Arguments
rho = 100; % range from sensor to object, [m]
phi_i = pi();
shape = "pr_sphere";
a = 5; % radius of sphere; m
f = 1000; % frequency of incident wave; hz
c = 1480; % speed of sound in water; m/s 

%% Default Arguments
num_iterations = 50;
phi = 0:0.01:pi(); % the angles where the scattered field will be calculated

%% get_scattered_field()
f_phi = get_scattering_function(num_iterations, rho, phi_i, phi, shape, a, f, c);

%% Plot the pressure field and save the figure
title_text = 'Magnitude of free-space Plane Wave Scattering Function';
xaxis = 'Azimuth Angle [Degrees]';
yaxis = 'Scattering Amplitude';
plot(phi*180/pi(), abs(f_phi),'LineWidth',2);
ax = gca;
ax.FontSize = 16; 
title(title_text,'FontSize',20);
ylabel(yaxis)
xlabel(xaxis)
xlim([0,180])



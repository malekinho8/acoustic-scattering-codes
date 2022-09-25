%% Pressure Release Sphere Full Acoustic Field
% This code will attempt to calculate the full acoustic field as a function
% of x and y

% Author: Malek Ibrahim
% Date: September 15, 2022

clear; clc; close all;
set(groot, 'defaulttextInterpreter','latex'); set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
%% Positional Arguments
shape = "pr_sphere";
a = 5; % radius of sphere; m
f = 1000; % frequency of incident wave; hz
c = 1480; % speed of sound in water; m/s 

%% Get k-value
lambda = c/f;
k = 2*pi()/lambda;

%% Default Arguments
num_iterations = 50;
x = -20:0.1:20;
y = [0];

%% get_acoustic_field_2D()
[~,V_s,V_i] = get_acoustic_field_2D(num_iterations, x, y, shape, a, f, c);

%% Try flipping V_s
V_t = V_i + V_s;

%% Get Pressure
P_V_t = real(V_t); % units [Pa]
P_V_i = real(V_i);
P_V_s = real(V_s); 

%% Convert to dB
V_t_db = 10*log10(P_V_t.^2/1e-6);
V_i_db = 10*log10(P_V_i.^2/1e-6);
V_s_db = 10*log10(P_V_s.^2/1e-6);

%% Plot V_i
figure(1)
plot(P_V_i)

%% Plot P_V_t
figure(2)
plot(x,P_V_t)

%% Plot Scattered Field
figure(4)
plot(x,real(V_s))
xlabel('$x$ [m]')
ylabel('$|S|$')

%% Plot Scattered Amplitude
figure(3)
title('Negated Scattered FIeld Amplitude')
xlabel('$x$ [m]')
ylabel('$|S|$')
plot(x,abs(V_s))

%% Polar to Cartesian
% [x,y,z] = pol2cart(phi,rho(1:length(phi)),V_t_db);

%% Show heatmap of Total Field
figure(1)
imagesc(P_V_t.');
set(gca,'YDir','normal')
pbaspect([1 1 1])
colorbar(gca)
% clim([0 1])
colormap jet

xt = get(gca,'XTick'); % current axis xticks
xt = linspace(1,length(x),11);
xtlbl = round(linspace(x(1), x(end), numel(xt)), 2); % New 'XTickLabel' Vector
set(gca, 'XTick',xt, 'XTickLabel',xtlbl, 'XTickLabelRotation',30) % Label Ticks

yt = get(gca,'YTick'); % current axis xticks
yt = linspace(1,length(y),11);
ytlbl = round(linspace(y(1), y(end), numel(yt)), 2); % New 'XTickLabel' Vector
set(gca, 'YTick',yt, 'YTickLabel',ytlbl, 'YTickLabelRotation',30) % Label Ticks

title('Total Sound Pressure Field [Pa]')
xlabel('$$x$$ [m]')
ylabel('$$y$$ [m]')

%% incident field
figure(2)
imagesc(P_V_i.'); set(gca,'YDir','normal')
pbaspect([1 1 1])
colorbar(gca)
colormap jet
% clim([0 1])

xt = get(gca,'XTick'); % current axis xticks
xt = linspace(1,length(x),11);
xtlbl = round(linspace(x(1), x(end), numel(xt)), 2); % New 'XTickLabel' Vector
set(gca, 'XTick',xt, 'XTickLabel',xtlbl, 'XTickLabelRotation',30) % Label Ticks

yt = get(gca,'YTick'); % current axis xticks
yt = linspace(1,length(y),11);
ytlbl = round(linspace(y(1), y(end), numel(yt)), 2); % New 'XTickLabel' Vector
set(gca, 'YTick',yt, 'YTickLabel',ytlbl, 'YTickLabelRotation',30) % Label Ticks

title('Incident Field [Pa]')
xlabel('$$x$$ [m]')
ylabel('$$y$$ [m]')

%% scattered field
figure(3)
imagesc(abs(V_s).'); set(gca,'YDir','normal')
pbaspect([1 1 1])
colorbar(gca)
colormap jet
% clim([0 1])

xt = get(gca,'XTick'); % current axis xticks
xt = linspace(1,length(x),11);
xtlbl = round(linspace(x(1), x(end), numel(xt)), 2); % New 'XTickLabel' Vector
set(gca, 'XTick',xt, 'XTickLabel',xtlbl, 'XTickLabelRotation',30) % Label Ticks

yt = get(gca,'YTick'); % current axis xticks
yt = linspace(1,length(y),11);
ytlbl = round(linspace(y(1), y(end), numel(yt)), 2); % New 'XTickLabel' Vector
set(gca, 'YTick',yt, 'YTickLabel',ytlbl, 'YTickLabelRotation',30) % Label Ticks

title('Scattered Field Amplitude')
xlabel('$$x$$ [m]')
ylabel('$$y$$ [m]')

%% Plot incident plane wave as a function of x
figure(4)
X = -40:0.01:40;
lambda = c/f;
k = 2*pi()/lambda;
plot(real(V_i(:,1)))
xt = get(gca,'XTick'); % current axis xticks
xt = linspace(1,length(x),11);
xtlbl = round(linspace(x(1), x(end), numel(xt)), 2); % New 'XTickLabel' Vector
set(gca, 'XTick',xt, 'XTickLabel',xtlbl, 'XTickLabelRotation',30) % Label Ticks


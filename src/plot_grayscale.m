function plot_grayscale(X,titlestr)

% function plot_grayscale(X,titlestr)
%
% X = solution matrix, like soln.X from output of threshlin_ode.m.
% last modified Nov 17, 2016 to add titlestr

if nargin<2 || isempty(titlestr)
    titlestr = '';
end;

% grayscale colormap
cmap = [.05:.001:1]'*[1 1 1];  % make scale refined, with a "gap" from 0
cmap = ones(size(cmap))-cmap;
cmap = [1 1 1; cmap]; % use white when activity hits 0
colormap(cmap)
clim = [0,min(1,max(X(:)))];

imagesc(X',clim)
set(gca,'XTick',[]); % to remove tick marks on x-axis
ylabel('neuron number')
title(titlestr)
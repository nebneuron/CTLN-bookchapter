function plot_ratecurves(X,time,colors,titlestr)

% function plot_ratecurves(X,time,colors,titlestr)
%
% X = solution matrix, like soln.X from output of threshlin_ode.m.
% time = times accompanying X, like soln.time from output threshlin_ode.m.
% colors = matrix of colors for the line plots.

n = size(X,2); % no. of neurons

if nargin < 3 || isempty(colors)
    colors = lines(n);
end;

if nargin<4 || isempty(titlestr)
    titlestr = '';
end;

for i=1:n
    plot(time,X(:,i),'-','color',colors(i,:), 'LineWidth',1.5);
    hold on
end;
xlabel('time')
ylabel('firing rate')
hold off
title(titlestr);
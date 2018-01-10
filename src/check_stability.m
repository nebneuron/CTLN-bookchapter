function [s eigvals] = check_stability(W,sigma);

% function [s eigvals] = check_stability(W,sigma)
%
% W = square matrix
% sigma = subset of indices, like [1 3 10], defining a principal submatrix
%
% checks if (-I+W)_sigma is a stable matrix (to detect permitted sets)
% s = 1 if stable, 0 if unstable
% eigvals = eigenvalues of (-I+W)_sigma
% 
% last modified june 24, 2015 to add eigvals

n = size(W,1);

if nargin<2
    sigma = [1:n];
end;

M = - eye(length(sigma)) + W(sigma,sigma); % (-I+W)_sigma matrix
eigvals = eig(M);

lambda_max = max(real(eigvals));

if lambda_max < 0
    s = 1;
else
    s = 0;
end;
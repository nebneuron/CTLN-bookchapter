function [sigma binrep] = num2sigma(num,N)

% function [sigma binrep] = num2sigma(num,N)
%
% num = # to be converted from decimal to binary
% N = number of place holders in binary representation (= #neurons)
% sigma = index subset with 1's in binary rep. (= active neurons)
% binrep = binary representation as a string of 0's and 1's
%
% modified on june 17, 2015 to return binrep with first neuron on far left

a = dec2bin(num,N); % character array with binary rep of number
b = str2num(a'); % column vector of 1's and 0's
c = b(end:-1:1); % reverse ordering
sigma = find(c'); % indices for "1" entries of b
binrep = c';  % binary representation, first neuron on far left
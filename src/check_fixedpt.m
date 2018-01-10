function [TF,x_fp] = check_fixedpt(W,sig,b)

% function [TF,x_fp] = check_fixedpt(W,sig,b)

n = size(W,1); % number of neurons
TF = 1; % assume a fixed pt exists, change to 0 if not

if nargin<3 || isempty(b)
    b = ones(n,1);
end;

% if a fixed pt exists with supp sigma, 
% x_sig = (I-W_sig)^{-1}b_sig
M = eye(n)-W; % I-W matrix
M_sig = M(sig,sig); % I-W_sig matrix
x_sig = M_sig^(-1)*b(sig); % fixed pt vector

% write full n-dim fixed pt
x_fp = zeros(n,1);
x_fp(sig) = x_sig;

% "on" neuron conditions: x_sig>0
if sum(x_sig>0)<length(sig)
    TF = 0;
else
% "off" neuron conditions: W_{k,sig}x_sig + b_k <= 0
    sigbar = setdiff([1:n],sig);
    for k = sigbar
        sk = W(k,sig)*x_sig+b(k);
        if sk>0
            TF = 0;
            return
        end;
    end;
end;
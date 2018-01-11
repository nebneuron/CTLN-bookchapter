function [fixpts supports stability] = sA2fixpts(sA,e,d,theta)

% function [fixpts supports stability] = sA2fixpts(sA,e,d,theta)
%
% finds fixed points of a CTLN model network with graph adj mtx sA
%
% fixpts = matrix whose rows are the fixed points
%          fixpts(i,:) is the i-th fixed point
% supports = cell array of fixed points supports 
%            supports{i} = supp(fixpts(i,:))
% stability = column vector with 0 for unstable, 1 for stable
%             stability(i) refers to fixpts(i,:)
%
% this is a wrapper for "check_fixedpt"; also calls num2sigma.m and
% graph2net.m
%
% created Mar 23, 2016
% last modified on June 3, 2017 to compute sum sgn det(I-W_sig) formula

if nargin<2 || isempty(e)
    e = []; % use default of graph2net
end;

if nargin<3 || isempty(d)
    d = []; % use default of graph2net
end;

if nargin<4 || isempty(theta)
    theta = 1;
end;

%...................................
n = size(sA,1);
W = graph2net(sA,e,d);
b = theta*ones(n,1);

fixpts = [];
stability = [];
j = 0;

for i=1:2^n-1
    sig = num2sigma(i,n);
    [TF x_fp] = check_fixedpt(W,sig,b);
    if TF
        fixpts = [fixpts; x_fp'];
        j = j+1;
        supports(j) = {sig};
        sgn(j) = sign(det(eye(length(sig))-W(sig,sig)));
        fprintf(['sgn = ' int2str(sgn(j)) ', supp = ' int2str(sig) '\n']);
        if nargout > 2
            s = check_stability(W,sig);
            stability = [stability; s];
        end;
    end;
end;

fprintf(['num of fixed points = ' int2str(length(sgn)) '\n']);
fprintf(['sum of sgn(I-W_sigma)=' int2str(sum(sgn)) '\n']);
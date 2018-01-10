function sA=make_kcyclic_graph(n,k)

% function sA=make_kcyclic_graph(n,k)
%
% n = number of neurons/nodes
% k = out-degree of each node (k=1 for a simple cycle)
%
% created 1/24/16

if nargin<2 || isempty(k)
    k = floor(n/2);
end;

sA=zeros(n);

for i=1:n
    for j=1:k
        sA(modn(i+j,n),i)=1;
    end
end
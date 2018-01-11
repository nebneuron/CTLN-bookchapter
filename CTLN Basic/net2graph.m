function sA = net2graph(W,b);

% function sA = net2graph(W,b);
%
% W = nxn matrix
% b = nx1 vector
% sA = binary adjacency matrix for a directed graph
%
% created Feb 18, 2017 to make matrix sA = G_{W,b}

n = size(W,1);
sA = zeros(n);

for i=1:n
    for j=setdiff([1:n],i)
        if W(i,j)*b(j)+b(i)>0
            sA(i,j) = 1;
        end;
    end;
end;    
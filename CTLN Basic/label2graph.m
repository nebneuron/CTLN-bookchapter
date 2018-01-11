function sA = label2graph(basegraph,in_vec,out_vec)

% function sA = label2graph(basegraph,in_vec,out_vec)
%
% basegraph = a string 'A' thru 'G' of n=4 base graphs (all oriented)
% in_vec = nodes in [n] that go onto the new node n+1
% out_vec = nodes in [n] onto which the new n+1 node projects
%
% note: use in_vec or out_vec = 0 or [] for no in/out edges
%       (this is the default). if both are [], the n=4 basegraph
%       itself will be returned.
% 
% examples: label2graph('D',3,[1,2]) gives graph D3[1,2]
%           label2graph('F',0,[1,3,4]) gives graph F0[1,3,4]
%           label2graph('A') gives the n=4 graph A
%
% this is a wrapper for addnode.m, translating "basegraph" into 
% an n=4 sA mtx, which then gets augmented to an n=5 graph.
%
% created sep 3, 2016 & updated sep 4, 2016

if nargin<2
    in_vec = [];
end;

if nargin<3
    out_vec = [];
end;

sA3 = [0 0 1; 1 0 0; 0 1 0]; % the 3-cycle 123

% initialize n=4 base graph
sA4 = zeros(4);

if basegraph == 'A'
    sA4 = addnode(sA3,[],1);
end;

if basegraph == 'B'
    sA4 = addnode(sA3,[],[1,2]);
end;

if basegraph == 'C'
    sA4 = addnode(sA3,[],[1,2,3]);
end;

if basegraph == 'D'
    sA4 = addnode(sA3,3,1);
end;

if basegraph == 'E'
    sA4 = addnode(sA3,3,[1,2]);
end;

if basegraph == 'F'
    sA4 = addnode(sA3,3,2);
end;

if basegraph == 'G'
    sA4 = [0 0 0 1; 1 0 0 0; 0 1 0 0; 0 0 1 0]; % the 4-cycle 1234
end;

% H is the 5-cycle 12345, return without adding a node
if basegraph == 'H'
    sA = [0 0 0 0 1; 1 0 0 0 0; 0 1 0 0 0; 0 0 1 0 0; 0 0 0 1 0];
    return
end;

% return n=4 basegraph if both in_vec and out_vec are empty
% else, add a node and return an n=5 graph
if isempty(in_vec) && isempty(out_vec)
    sA = sA4;
else
    sA = addnode(sA4,in_vec,out_vec);
end;
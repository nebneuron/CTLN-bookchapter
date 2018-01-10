% run_CTLN_model_script
%
% calls: randDigraph.m, sA2soln.m, plot_soln.m
% optional calls: make_kcyclic_graph.m, randDigraph.m, sA2fixpts.m

% last updated Jan 7, 2018 for CTLN-Matlab-code package

% STEP 1. Input any n x n adjacency matrix, called sA.
% Note: if i->j, then sA(j,i) = 1.

% The sA matrix for the graph in Figure 1C
 sA = [0 0 1 1; 1 0 0 0; 0 1 0 1; 0 0 0 0];

% To create a cyclically symmetric graph on n nodes with each node projecting k edges: i->i+1 ... i->i+k, uncomment these commands: 
% n = 5; 
% k = 2; % need k=1 for simple cycle
% sA = make_kcyclic_graph(n,k);

% To generate a random oriented graph, uncomment these commands:
% n = 10; % number of neurons
% sA = randDigraph(n);

% To load a pre-stored graph, uncomment the following:
% load sA_n5_multi_chaos; 


% STEP 2. Simulate dynamics for the corresponding threshlin network model

% simulation parameters
n = size(sA,1); % number of neurons
T = 100; % simulation time length, in units of membrane timescale
e = .25; % epsilson value (default is .25)
d = 2*e; % delta value (default is 2*e = .5)
theta = 1; % theta value

% SET INITIAL CONDITIONS
X0 = [0 0 0 .2]'; % user-specified initial conditions
% Make sure that the initial condition has length n and is a column vector by including an apostrophe at the end

% X0 = .5*rand(n,1); % random initial condition

% fp = sA2fixpts(sA,e,d,theta); % the fixed points of the CTLN
% X0 = fp(1,:)' + 0.1*rand(n,1); % set the initial condition to be a small random perturbation around one of the fixed points

% solve ODEs (solution is returned in "soln" struct)
soln = sA2soln(sA,T,X0,e,d,theta);


% STEP 3. Plot the results!

% pick projection directions (they get normalized later)
proj = []; % to use defaults

% plot adjacency matrix and solution!
if n<=6
    colors = [0 .5 .7; .15 .6 0; .5 .5 .5;...
        1 .643 0; .8 0 0; 0 0 0];
else
    colors=[];
end
plot_soln(soln,proj,colors);
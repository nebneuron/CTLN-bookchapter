CTLN-basic is a bare bones package to run simple simulations 
and make plots using the CTLN model. Details about the model 
can be found in the book chapter:

Predicting neural network dynamics via graphical analysis
Katherine Morrison and Carina Curto

as well as in the following preprint:

Diversity of emergent dynamics in competitive threshold-linear networks: a preliminary report
Katherine Morrison, Anda Degeratu, Vladimir Itskov & Carina Curto
Available at https://arxiv.org/abs/1605.04463


The code was written by Carina Curto and Katherine Morrison, and packaged
together on Jan 7, 2018.

SUMMARY OF THE CODE:

1. The adjacency matrix sA:
The basic input object that defines a CTLN model is an nxn matrix "sA", 
which is the adjacency matrix for a simple directed graph on n nodes (neurons).  
sA should be a binary matrix with zeros on the diagonal.  Our convention
(due to the form of the ODEs) is that sA(i,j) = 1 iff j->i in the graph.  
sA is thus the transpose of the usual adjacency matrix.
As an example, for the directed 3-cycle with 1—>2, 2—>3, and 3—>1, the sA matrix is
sA=[0 0 1;
    1 0 0;
    0 1 0];

2. run_CTLN_model_script.m 
This is a sample executable that allows you to enter an sA matrix 
(or load a saved example matrix, or generate one at random with randDigraph.m), 
and then simulate the corresponding CTLN model with a choice of parameters
and initial conditions. 

The simulations are done by the function sA2soln.m, which returns a "soln" structure.
The results are plotted using the function plot_soln.m, using "soln" as input.

3. sA2fixpts.m
This is a function that returns up to three outputs when called.  The function takes an sA matrix as input with optional other inputs for epsilon, delta, and theta.  The first output is a matrix whose rows are the fixed points of the CTLN defined by the sA matrix and given (or default) parameters.  The second output is a cell array of supports of fixed points, and the third output is an indicator vector with a 1 indicating the corresponding fixed point is stable, while a 0 indicates the fixed point is unstable. 

4. All other functions are either plotting routines, called by plot_soln.m,
or functions used in the simulations, called by sA2soln.m.

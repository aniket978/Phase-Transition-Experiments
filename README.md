# Phase-Transition-Experiments
Phase Transitions of Sparse Recovery Using L1 Minimization Techniques

## Description
### Phase Transition of Matrices
Define  rho= k=n and delta = n=N where k is the sparsity or number of non-zero entries of
the matrix A and n and N are the number of measurements and total dimension of the input
signal respectively.A grid of discrete values of rho and delta was generated and
experiments were run whose results divided the grid into regions of success and failures. These
experiments were essentially Monte-carlo simulations. Success denoted the values of rho and delta
that led to perfect recovery of the input vector from L1 minimization technique whereas failure
denoted the values of rho and delta corresponding to no recovery. Instead of binary classification as
perfect and no recovery, the probabilities of success and failure over M Monte-Carlo trials were
used to classify the regions in the grid.
## Acknowledgements
The file SparseVector.m is a modified version of the file available at [SparseLab][https://sparselab.stanford.edu]
## Installations
Install CVX tool from Matlab
Run cvx_setup
## Instructions


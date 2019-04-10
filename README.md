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
### Experiment Details
The experiments obtain the data grid for phase transitions of the following distributions:
1. USE - It stands for Uniform Spherical Ensemble. The matrices in this ensemble are
Gaussian matrices with each of their columns normalized.
2. Gaussian with scaled variance - As the name suggests, these consist of Gaussian matrices
whose variance is 1=n with n being the number of rows of the matrix.
3. Uniform Distribution - It consists of matrices whose columns are unit length in
expectation. The following formula achieves this in MATLAB:
```
A = (-sqrt(3/n) + 2 * sqrt(3=n) * rand(n,N))/2;
```
4. Hat Distribution - It is a hat shaped distribution. It is implemented using the below
formula in MATLAB:
```
A = (sign(rand(n,N) - .5).* (1 -abs(1 - rand(n,N) - rand(n,N))));
```
5. DCT - It is the ensemble of random partial discrete cosine transform matrices. It is
formed by randomly sampling from DCT matrices.
6. 2D DCT - It consists of matrices of discrete cosine transform in 2 dimensions. It is
formed by randomly sampling from 2D DCT matrices.

The following signals are used for Sparse Recovery:
1. Gaussian - The k non-zeros consist of uniformly distributed random numbers in the
interval (0,1).
2. {0,1} - The k non-zeros consist of only 1s.
3. {0,1,-1} - The k non-zeros consist of either +1 or -1 chosen by i.i.d. fair coin tossing.
4. High Entropy Signal - The k non-zero values have high entropy i.e. they are extremely
large at some places and small at other places. For the experiments done here, half of
the non-zeros lie in interval (0,01̇) while the other half lies in the interval (09̇,1). Their
positions are chosen by i.i.d. fair coin tossing.
The positions of k non-zeros in the k-sparse signal in all cases are chosen uniformly at random
without replacement.

## Acknowledgements
The file SparseVector.m is a modified version of the file available at [SparseLab](https://sparselab.stanford.edu).
## Installations
Install CVX tool from Matlab.
Run cvx_setup
## Instructions


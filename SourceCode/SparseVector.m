function x = SparseVector(n, k, ensemble, perm)
  
% Adapted from SparseLab Version:100 
% SparseVector: Generates a sparse vector with a specified distribution.
%
%  Usage:
%     x = SparseVector(n, k, ensemble, perm)
%  Inputs:
%    n          vector length
%    k          number of nonzero entries
%    ensemble   string containing name of coefficient distribution
%               'Uniform', 'Gaussian', 'Signs', 'Power'. 
%               Default is 'Uniform'.
%    perm       If =1, the nonzero indices are randomly selected. 
%               Otherwise, the nonzero entries are in indices 1..k (default).
%  Outputs:
%    x          Sparse n vector.
%  Description:
%    This function creates a vector of length n with k nonzero entries, 
%    distributed according to the specified input ensemble. 
%    
if nargin < 4,
    perm = 0;
end
if nargin < 3,
    ensemble = 'Uniform';
end

switch upper(ensemble)
    case 'UNIFORM'
        x = [rand(k,1); zeros(n-k,1)];
        
    case 'ONES'
        x = [ones(k,1);zeros(n-k,1)];
        
    case 'COMPLEX'
        t = 2*pi * rand(k,1);
        x = [cos(t)+1i*sin(t);zeros(n-k,1)];
    case 'ENTROPY'
       x = [0.1*rand(round(k/2),1); 0.9+(0.1*rand(round(k/2),1)) ;zeros(n-k,1)];
        
    case 'SIGNS'
        x = sign(rand(k,1) - 0.5);
        zz = find(x == 0);
        Phi(zz) = ones(size(zz));
        x = [x; zeros(n-k,1)];
        
    case 'GAUSSIAN'
        x = [randn(k,1); zeros(n-k,1)];

    case 'POWER'
        x = [1./[1:k]'; zeros(n-k,1)];
    case 'CAUCHY'
        x = [randn(k,1)./randn(k,1); zeros(n-k,1)];
end        

if perm
    p = randperm(n);
    x = x(p);
end
    
%
% Copyright (c) 2006. David Donoho
%  

%
% Part of SparseLab Version:100
% Created Tuesday March 28, 2006
% This is Copyrighted Material
% For Copying permissions see COPYING.m
% Comments? e-mail sparselab@stanford.edu
%

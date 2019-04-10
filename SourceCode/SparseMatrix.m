function x = SparseMatrix(n, k)
x = [ones(k,1); zeros(n-k,1)];%[rand(k,1); zeros(n-k,1)];
p = randperm(n);
x = x(p);
n2 = sqrt(n);
x= reshape(x,n2,n2);
end

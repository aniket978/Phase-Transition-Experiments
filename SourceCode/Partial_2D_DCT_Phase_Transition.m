M = 100; %no. of problem instances for one set of parameters(usually 100)
v = 30; % dimension of the grid = v*v (usually 30)
N = 900;%N must be a perfect square
tol = 0.01; %tolerance
prob =zeros(v-1,v-1); %probability grid
i=0;
for delta = 0.05:1/v:1
    i = i+1;
    j=0;
    for rho = 0.05:1/v:1
        j=j+1;
        n = round(delta*N);
        k = round(rho*n);
        s=zeros(M,1);
        parfor m = 1:M
            %----------------------------
            % Generating Problem Instance
            %----------------------------
            A = dftmtx(sqrt(N));     % Measurement matrix
            x0 = SparseMatrix(N, k); % Generating a sparse input matrix --> 2D signal.
            p = randperm(N,n);
            y = transform(A,x0,p);

            %------------------------------------
            % Applying CVX  
            %------------------------------------
            x = cvxReconstruction(A,y,N,p);
            %------------------------------------
            % Checking if success
            %------------------------------------
            if(norm((x0-x),2)/norm(x0,2) <= tol)
                s(m)=1;
            end
        end
        prob(j,i) = sum(s)/M*100;
    end   
end

function x = cvxReconstruction(A,y,N,p)
            cvx_begin
            variable x(sqrt(N),sqrt(N))
            minimize(norm(x(:),1))
            subject to 
            transform(A,x,p)==y
            cvx_end
end

function z = transform(A,x,p)
z = A*x*A';
z = z(p);
end

M = 100; %no. of problem instances for one set of parameters
v = 30; % dimension of the grid = v*v
N = 800;
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
            A = (-sqrt(3/n) +2*sqrt(3/n)*rand(n,N))/2;      % Measurement matrix
            x0 = SparseVector(N, k, 'ENTROPY', 1); % Generating an sparse input vector.
            y=A*x0;     % vector of the measurements
                        
            %------------------------------------
            % Applying CVX  
            %------------------------------------
            x = cvxReconstruction(A,y,N);
            
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

function x = cvxReconstruction(A,y,N)
            cvx_begin
            variable x(N)
            minimize(norm(x,1))
            subject to 
            A*x==y
            cvx_end
end
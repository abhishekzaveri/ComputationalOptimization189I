function S = kalman_smoother(t, p, s0, Q1, sigq, sigr)
%KALMAN_SMOOTHER   Smooths a 2D noisy signal.
%   
%   S = KALMAN_SMOOTHER(t, p, s0, Q1, sigq, sigr) smooths the 2D noisy
%   signal given by (t,p) and returns the resulting signal S.
%
%   t is the vector of measurement times.
%   p is the n-by-2 matrix of 2D measurements.
%   s0 is the estimate of the initial state.
%   Q1 is the covariance matrix of the initial state estimate.
%   sigq^2 is the variance associated with the state-transition error.
%   sigr^2 is the variance associated with the measurement error.

S = [p zeros(size(p))];

n = length(t);
dt = diff(t);

I = speye(2);

% Initialize the cell arrays
AA = cell(n,1);  
QQ = cell(n,1);  
CC = cell(n,1);  
RR = cell(n,1);  
ww = cell(n,1);  
zz = cell(n,1);  

% Form matrices AA{k}, QQ{k}, CC{k}, RR{k}, and vectors ww{k} and zz{k}
AA{1} = speye(4);
QQ{1} = Q1;
CC{1} = [I zeros(2)];
RR{1} = sigr^2*I;
ww{1} = AA{1}*s0;
zz{1} = p(1,:)';

for k=2:n
    
    AA{k} = [I,  dt(k-1)*I;
                zeros(2), I]; 
    
    QQ{k} = sigq^2 * [1/3*(dt(k-1))^3*I, 1/2*(dt(k-1))^2*I;
                       1/2*(dt(k-1))^2*I, dt(k-1)*I];
     
     CC{k} = [I zeros(2)];
     
     RR{k} = sigr^2 * I;
     
     ww{k} = 0;
     
     zz{k} = p(k,:)';
     
     
             
             
end

% Form the sparse matrices A, Q, C, R, and the vectors w and z


% Solve the least-squares problem using your solver from Exercise 1

   U = chol(Q);
   V = chol(R);
   b = [inv(U)'* w;
        inv(V)'* z];
    
    M = [inv(U)'* A;
         inv(V)'* C];
     
    n = size(A, 1); % size 
   
   
 
   
   
   cvx_begin
        variable s(4*n)
        minimize( norm(b - M*s) )
   cvx_end
   
   s = cvx_optval;
% Reshape s into a n-by-4 matrix S
    S = reshape(s,[n,4]);

end
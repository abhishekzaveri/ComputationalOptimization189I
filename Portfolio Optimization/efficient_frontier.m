

function [Y, rates, sigs] = efficient_frontier(r, Sig, num)

n = length(r);
rrange = return_range(r, Sig, num);

Y = zeros(n, num); 

%Get the Cholesky Factorization of Sig
R = chol(Sig);

for jj = 1:num
    
   %-------------------------------% 
   cvx_begin quiet
    
    variable x(19) nonnegative
    minimize( norm(R*x,2) )
    subject to
         r'*x >= rrange(jj)
         sum(x) == 1
         x >= 0
     
         
    cvx_end
    %-----------------------------------%
    Y(:,jj) = x
   sigs(jj) = cvx_optval;
end

rates = rrange'
sigs = sigs'

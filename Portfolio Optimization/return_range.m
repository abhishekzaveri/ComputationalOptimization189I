
function rrange = return_range(r, Sig, num)


%Get the Cholesky Factorization of Sig
R = chol(Sig);

%---------calculate minimum risk-------------%
cvx_begin quiet
    
    variable x(19) nonnegative
    minimize( norm(R*x,2) )
    subject to
         sum(x) == 1
         x >= 0
     
         
cvx_end

min_mu = r' * x;
min_sig = sqrt(x' * Sig * x);

disp('The minimum risk portfolio is:');
disp(x)
disp('The expected rate of return of the min portfolio is:')
disp(min_mu)
disp('The standard deviation of the min portfolio is:')
disp(min_sig)


%---------------------------------------%


%------------max rate of return----------%
cvx_begin quiet
    
    variable x(19) nonnegative
    maximize( r'*x )
    subject to
        sum(x) == 1
        x >= 0
cvx_end
max_mu = cvx_optval;

disp('The maximum return portfolio is:');
disp(x)
%--------------------------------%


rrange = linspace(min_mu,max_mu,num);
 
end


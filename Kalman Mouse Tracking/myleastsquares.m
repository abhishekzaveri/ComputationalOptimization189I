

function s = myleastsquares(A,Q,C,R,w,z)
   
   %--Define U, V, b, and M---%
   U = chol(Q);
   V = chol(R);
   b = [inv(U)'* w;
        inv(V)'* z];
    
    M = [inv(U)'* A;
         inv(V)'* C];
     
    n = size(A, 1); % size 
   
   
 
   %------------------------% 
   
   cvx_begin
        variable s(4*n)
        minimize( norm(b - M*s) )
   cvx_end
   
   s = cvx_optval;
   
end


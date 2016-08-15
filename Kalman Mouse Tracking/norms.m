function s = norms(A, Q, C, R, w, z)

    U = chol(Q);
    V = chol(R);
    b = [inv(U)'* w;
            inv(V)'* z];
    
    M = [inv(U)'* A;
          inv(V)'* C];
    
    n = size(A, 1);
    s = zeros(4*n);
    s = (A'*(Q^-1)*A + C'*(R^-1)*C)\(A'*Q^(-1)*w + C'*R^(-1)*z); 

    cvx_begin
        variable s(4*n);
        minimize( norm(M*s-b) )
    cvx_end

end
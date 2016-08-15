

function [ r, Sig ] = meancov(X)

   r = transpose(mean(X))
   Sig = cov(X)
   
end


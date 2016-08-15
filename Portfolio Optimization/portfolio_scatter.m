
function h = portfolio_scatter(r, Sig, num)

h = figure;
randmu  = zeros(num,1);
randSig = zeros(num,1);


for ii=1:num
    
    % Step 1) Generate random indices
    indices = randperm(19,5);
    % Step 2) Extract random stocks
    for i = 1:5
         r2(i) = r(indices(i));
    end
    % Step 3) Calculate new 5x5 Sig
    for j=1:5
        for k =1:5
            Sig2(k,j) = Sig(indices(j),indices(k)); 
        end
    end
    % Generate a random portfolio
    x = diff([0;sort(rand(4,1));1]);
   
    randmu(ii) = dot(r2',x);
    
    randSig(ii) = sqrt(x'*Sig2*x);
    
        
end
scatter(randSig, randmu, 5)
xlabel('Std. Dev.')
ylabel('Expected Rate of Return')
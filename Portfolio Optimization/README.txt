In this project, we implemented convex optimization problems in MATLAB that allowed us to compute the maximum expected rate of return of an investment portfolio. 

load_stocks.m reads the adjusted closing prices of all stocks in our given directory between the start date and the end date and computes the rates of return. 

disp_stocks.m plots the above results. 

meancov.m returns the n x 1 vector r of means and the n x n covariance matrix Sig of the rates of returns of n stocks given by X. 

portfolio_scatter.m generates random portfolios and makes a scatter plot of their expected rates of return and standard deviation. 

return_range.m computes the portfolio with minimum risk using the optimization constraints established. 

efficient_frontier.m computes efficient portfolios with linearly spaced rates of return. 


% Lorenz equations for use by ODE solver
%
% The Lorenz 63 equations are given by:
%  x' = sigma*(y-x)
%  y' = x*(rho - z) - y
%  z' = x*y - beta*z
% Example usage in Octave:
%  t = linspace(0,10,100);
%  X = randn(1,3);
%  V = lsode(@lorenz63,X,t);
%
function dx = lorenz63(X)
    % These parameters will produce a chaotic system
    rho = 28; sigma = 10; beta = 8/3;
    dx = zeros(3,1);
    dx(1) = sigma*(X(2) - X(1));
    dx(2) = X(1)*(rho - X(3)) - X(2);
    dx(3) = X(1)*X(2) - beta*X(3);
    return
end


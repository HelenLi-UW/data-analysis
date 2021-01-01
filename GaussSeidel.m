% Gauss-Seidel Iteration

% `GaussSeidel()` outputs the solution in a vector called x_out and tells
%   the number of iterations done.
%
% A: augmented matrix A
% b: vector of constant terms
% x0: initial guess
% tol: tolerance for error checking
% max_iters: limit of iterations

function [x_out, iters] = GaussSeidel(A, b, x0, tol, max_iters)
    % Define S and T
    S = tril(A);
    T = triu(A) - diag(diag(A));
    
    % set up
    error = 2 * tol;
    X(:, 1) = x0;
    iters = 1;
    
    while (error > tol) && (iters <= max_iters+1)
        iters = iters + 1;
        X(:, iters) = S \ (b - T * X(:, iters - 1));
        error = norm(X(:, iters) - X(:, iters - 1), Inf);
    end
    
    % x_out is the last guess of the true solution, which should be really
    %   close to the true solution if the system converges.
    x_out = X(:, end);
    
    % outputs the number of iterations done:
    iters = iters - 1;
end

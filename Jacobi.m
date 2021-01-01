% Jacobi Iteration

% `Jacobi()` outputs the solution of x and the number of iterations done.
%
% A: augmented matrix A
% b: vector of constant terms
% x0: initial guess of vector x
% tol: tolerance
% max_iters: a limit of iterations (once past, the loop stops)

function [x_out, iters] = Jacobi(A, b, x0, tol, max_iters)
    % define D and T
    D = diag(diag(A));
    T = A - D;

    % set up
    error = 2 * tol;
    X(:, 1) = x0;

    % iterating
    iters = 1;
    while (error > tol) && (iters <= max_iters+1)
        iters = iters + 1;
        X(:, iters) = D \ (b - T*X(:, iters - 1));
        error = norm(X(:, iters) - X(:, iters - 1), Inf);
    end
    
    % x_out is the last guess, which should be close to the true solution
    %   if Jacobi iteration converges.
    x_out = X(:, end);
    
    % outputs the number of iterations done
    iters = iters - 1; % initial guess doesn't count as an iteration
end 
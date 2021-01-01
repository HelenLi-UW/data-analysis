%% Bisection function

% `Bisection()` outputs the root(s) of the function f and the number of
%   iterations done.
%
% f: function (i.e. f(x))
% left: left bound guess
% right: right bound guess
% tol: tolerance

function [root, num_iters] = Bisection(f, left, right, tol)
    for k = 1:10000
        mid = (left + right) / 2;
        f_mid = f(mid);
        f_left = f(left);
        f_right = f(right);
        
        if abs(f_mid) < tol
            disp("the root is " + mid)
            break
        elseif f_mid * f_left < 0
            right = mid;
        elseif f_mid * f_right < 0
            left = mid;
        else
            disp("No root found")
            break
        end
    end
    
    root = mid;
    num_iters = k;
end 

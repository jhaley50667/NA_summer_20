function [student_id,c] = f109643579hw02a(f,a,b,tol,max_steps)
% Computes a zero of f using the bisection method.
% Inputs:
%   f: the function
%   a, b: real numbers, the endpoints of the initial interval.
%     Assumes a < b.
%     Note: f(a) and f(b) must have different signs; otherwise an error
%     occurs.
%   tol: tolerance, a nonnegative real number. Halts if (b-a)/2 < tol when
%     checking the interval [a,b].
%   max_steps: nonnegative integer, the maximum number of bisection steps.
%     Prints a message and stops if we have taken max_steps steps.
% Outputs:
%   student_id: integer, my student id
%   c: a vector of real numbers containing each successive approximation.
    student_id = 109643579;
    assert(a < b);
    c = [];
    steps = 0;
    fa = f(a);
    fb = f(b);
    if same_sign(fa, fb)
        error('Error: f(a) and f(b) must have different signs');
    end
    while (b-a)/2 > tol
        if steps == max_steps
            fprintf('Maximum steps reached\n');
            break
        end
        steps = steps + 1;
        mid = (a+b)/2;
        c(steps) = mid;
        fmid = f(mid);
        if fmid == 0
            % zero of the function found; we're done
            break
        elseif same_sign(fa, fmid)
            % make [mid, b] the new interval
            a = mid;
            fa = fmid;
        else
            % make [a, mid] the new interval
            assert(same_sign(fmid, fb))
            b = mid;
            fb = fmid;
        end
    end
end

function same_sign = same_sign(a, b)
% Computes whether a and b have the same sign
% Inputs: a, b: real numbers
% Output: true if a and b have the same sign or at least one of them is
%   zero, false otherwise
    same_sign = sign(a)*sign(b) >= 0;
end

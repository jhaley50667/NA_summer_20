function [student_id, xc] = f830386876hw03a(f,a,b,n)
% Method of False Positive
%   Computes approximate solution xc of f(x) = 0
%   Input: function handle f, interval endpoints a
%      and b, number of steps n
%   Output: approximate solution xc

student_id = 830386876;

% check for f(a)f(b) < 0
if sign(f(a)) * sign(f(b)) >= 0
    error('f(a)f(b)<0 not satisfied!')
end

% main algorithm
fa = f(a);
for i = 1:n
    xc = (b*f(a) - a*f(b)) / (f(a) - f(b));
    fc = f(xc);
    if fc == 0          % xc is solution
        break
    elseif fa*fc < 0    % new interval a,xc
        b = xc;
    else                % new interval xc, b
        a = xc;
    end
end

end % function
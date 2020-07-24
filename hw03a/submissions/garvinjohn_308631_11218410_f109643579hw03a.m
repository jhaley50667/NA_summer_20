function [student_id, xc] = f109643579hw03a(f,a,b,n)
% Computes a zero of f using the Method of False Position
% Inputs:
%   f: the function
%   [a,b]: real numbers, the end points of the interval, where a < b
%   n: positive integer, the maximum number of steps to take
student_id = 109643579;
assert(a < b);
assert(n > 0);
fa = f(a);
fb = f(b);
if same_sign(fa, fb)
  error('Error: f(a) and f(b) must have different signs');
end
for steps = 1:n
  if fa == fb
    return
  end
  xc = (b*fa - a*fb) / (fa - fb);
  fc = f(xc);
  if fc == 0
    return
  end
  if same_sign(fa, fc)
    b = xc;
    fb = fc;
  else
    a = xc;
    fa = fc;
  end
end
end

function same_sign = same_sign(a, b)
% Computes whether a and b have the same sign
% Inputs: a, b: real numbers
% Output: true if a and b have the same sign or at least one of them is
%         zero, false otherwise
same_sign = sign(a)*sign(b) >= 0;
end

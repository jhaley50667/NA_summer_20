function [student_id, xc] = f108603919hw03a(f,a,b,n)
%Method of False Position
%Computes approximate solution of f(x)=0
%Input: inline function f; a,b such that f(a)*f(b)<0, 
%      and the number of steps n to take befroe stopping
%Output: student id, estimated solution xc
student_id = 108603919;
%code for input checking
if sign(f(a)) * sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end
%main algorithm
fa = f(a);
fb = f(b);
c = 0;
while n > 0
    n = n - 1;
    c = ((b * fa) - (a * fb)) / (fa - fb);
    if f(c) == 0
        break;
    end
    if fa * f(c) < 0
        b = c;
    else
        a = c;
    end
end
xc = c;
end
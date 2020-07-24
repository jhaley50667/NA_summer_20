function [student_id, xc] = f109413631hw03a(f,a,b,n)
%input:
% function handle f; 
% a,b - integar, the end points of the interval;
% n - the number of steps the algorithm should take before stopping;
%output:
% student_id - my id number;
% xc - approximation solustion;
student_id = 109413631
%code for checking that f(a)f(b) < 0
if f(a)*f(b)>=0
    error ('not valid point');
end
%main algorithm code
for i = 1:n
    xc = (b*f(a)-a*f(b))/(f(a)-f(b))
    if (f(xc) == 0)
   break
    elseif f(a)*f(xc)<0
        b=xc;
    else
        a=xc;
    end
end


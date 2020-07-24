function [student_id, xc] = f107738505hw03a(f,a,b,n) 
% usual input and out comments
% Input: a functionf, the end points a and b.
% and n, the number of steps the algorithm should take before stopping.
% Output: Approximate solution xc, and student id.
student_id = 107738505
% code for checking that f(a)* f(b) < 0 
if sign(f(a))*sign(f(b)) >= 0
   error('f(a)f(b)<0 not satisfied!') 
end
% main algorithm code 
for i=1:n
    xc = (b*f(a)-a*f(b))/(f(a)-f(b))
    if f(xc)==0
        break
    end
    if f(a)*f(xc)<0
        b=xc;
    else 
        a=xc;
    end
 
end
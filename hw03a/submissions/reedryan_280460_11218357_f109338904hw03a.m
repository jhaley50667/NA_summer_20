function [student_id, xc] = f109338904hw03a(f,a,b,n)
%Method of False Position with student id output
%   Finding roots with Method of False Position 
student_id= 109338904;
if (sign(f(a))*sign(fb)) >= 0
    error ('f(a)f(b)<0 not satisfied!')
end
for i= 1:n
    xc = (b*f(a)-a*f(b))/(f(a)-f(b));
    if f(xc) ==0
        return;
    end
    if (f(a)*f(xc)<0)
        b = xc;
    else
        a = xc;
    end
end
    
end


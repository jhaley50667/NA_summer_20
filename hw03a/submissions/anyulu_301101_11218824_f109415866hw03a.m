function [student_id, xc] = f109415866hw03a(f,a,b,n)
student_id=109415866
% usual input and out comments

if (f(a)*f(b)>=0)
    error ("f(a)f(b)<0 not satisfied");
end
%code for checking that f(a)f(b) <0

for i=1:n
    xc=(b*f(a)-a*f(b))/(f(a)-f(b))
    if (f(xc)==0) 
   break
    elseif (f(a)*f(xc)<0) 
        b=xc;
    else
        a=xc;
    end
end
%main algorithm code

end
     
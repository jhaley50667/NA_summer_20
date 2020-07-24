function [student_id, xc] = f109414123hw03a(f,a,b,n)
%Input: end points of the interval a,b and number of steps n before stopping
%Output: student_id,xc-estimated solution
student_id=109414123;
%code for checking that f(a)f(b)<0 and n>0
if (f(a)*f(b)>=0)
    error ("not satisfied");
elseif (n<0) 
    error ("n must greater than 0");
end
%main algorithm code
for i=1:n
    xc=(b*f(a)-a*f(b))/(f(a)-f(b));
    if (f(xc)==0)         %check for f(xc)=0
   break
    elseif (f(a)*f(xc)<0) %check for f(a)f(c)<0
        b=xc;
    else
        a=xc;             %check for f(a)f(c)>0
    end 
end
end
     
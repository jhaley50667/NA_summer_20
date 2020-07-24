function [student_id, xc] = f109321615hw03a(f,a,b,n)
% function input:function handle a,b and n times iternation
student_id=109321615
%output student_id
if (f(a)*f(b)>=0)
    error ("not valid point");
elseif (n<0) 
    error ("n must greater than 0");
end
%code for checking that f(a)f(b) > 0 and n<0
for i=1:n
    xc=(b*f(a)-a*f(b))/(f(a)-f(b))
    if (f(xc)==0) %cherck for f(xc)=0
   break
    elseif (f(a)*f(xc)<0) %check for f(xc)<0
        b=xc;
    else
        a=xc;
    end
end
%for loop iteration n times
end
     
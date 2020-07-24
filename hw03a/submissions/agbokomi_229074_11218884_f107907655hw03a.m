function [student_id, xc] = f107907655hw03a(f,a,b,n)
% This is the given interval [a,b] such that f(a)f(b)<0.
% This method shares some similarities with both the Bisection
% Method and the Newton's Method. The algorithm we will follow:
% This given interval [a,b] has to respond positively straight
% forward to f(a)*f(b)<0.
% So, for i = 1,2,3,..., c=(b*f(a)-a*f(b))/(f(a)-f(b))
% if f(c) = 0, then stop, end.
% if f(a)*f(b)<0, then b = c; else a=c, end end.
% function returns student_id and xc

student_id =107907655;
% xc is the estimated solution to the equation f(x)=0.
xc = (a+b)/2 % the midpoint between a and b: best estimation
% this estimation leads us to think about tolerance.
%(b-a)/2 > Tol
% So,we get the function to become f107907655hw03a(f,a,b,1e-6,n).
for i=1:n
    c = (b*f(a)-a*f(b))/(f(a)-f(b))
    f=@(x)x.^2 + x -1
    if f(c)== 0
        stop;
    end
    if f(a)*f(c)<0
        b = c  
    else
        a = c  
    end
end



function [student_id, xc] = f102118888hw03a(f,a,b,n) 
%Function implementing the algorithm for the Method of False Position
% calculates the estimated solution to the equation f(x)=0
%Input: inline function f; 
%       interval a,b such that f(a)*f(b)<0, 
%       n number of steps  
%Output: Approximate solution xc
%       student id student_id
%Note that I used bisect.m to help write this program as they 
% followed a similar structure 

%code for checking that f(a)f(b) < 0
%used code from bisect.m to write these lines
if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end

%main algorithm code
student_id=102118888;
for i=1:n                           %for loop starting at 1 until n steps
    fa=f(a);                        %variables to store f(a) and f(b)
    fb=f(b);
    c = (((b*fa)-(a*fb))/(fa-fb));  %calculating c
    fc=f(c);                        %variable to store f(c)
    if fc == 0                      %checking if f(c) = 0 and exiting loop if true
        break;
    end
    if sign(fc)*sign(fa)<0          %checking if f(a)f(c) < 0
        b=c;                        %setting b=c if true
        fb=fc;                      %making a and c the new interval
    else
        a=c;                        %setting a=c if false
        fa=fc;                      %making b and c the new interval
    end
end
xc=(a+b)/2;                         %making new midpoint as estimate
end

function [student_id, xc] = f109170514hw03a(f,a,b,n)
%f109170514hw03a - Summary of this function goes here
%function shows the method of false positition
%inputs:
% f - function
% a,b,- intervals
% n - # of steps the algorithm can take
%outputs:
% student_id - integer, my id number
% xc - estimation of the root

student_id = 109170514;

%code for checking that f(a)f(b) < 0
if  (f(a))*(f(b)) >= 0
    disp('Change your intervals!')
    return; %allows for program to end if this statement is true
end

%main algorithm code
plop=0;
for i = 1:n   %check from 1 until the max num of steps
    top = (b*(f(a)) - (a*f(b))); %these 3 lines are defined here because the a,b,and c 
    %keep updating
    bottom = f(a) - f(b);
    c = top/bottom;
   % disp('nums work');
    if f(c) == 0 %if the root is 0
        break;
    end
    if (f(a)*f(c)) < 0
        b = c;
    else
        a = c;
    end
    plop = c;
    %disp('root is', xc);
   
end
xc = plop;
disp(xc);
end


function [student_id, c] =  f107573463hw02a(f,a,b,tol,max_steps)
% function finds approximate solution of f(x) = 0
% using the bisection method
% Input:
% f - inline function f
% a, b - real numbers such that f(a)*f(b)<0
% tol - real number, tolerance
% max_steps - integer, maximum steps in computing f(x) = 0
% Output: 
% student_id - integer, my id number
% vector c - holds all the estimates of the value of the function 
% zero computed as the program runs

student_id = 107573463; %print out student id

fa=f(a); %simplifying the variables
fb=f(b);

if fa*fb >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end

format long; %helps with viewing sig. figs.
k = max_steps; %simplifying variable
x(1)=(a+b)/2; %begins bisection method and allows for x(i-1) to work.

for i=2:k                  %indexing the values
    if f(x(1))==0
        break              %if the intial value is a root, stop. 
    end
    if (f(x(i-1))*fa)<0    %redefines a and b under condition.
        b=x(i-1);
    else
        a=x(i-1);
    end
    x(i)=(a+b)/2;
    if (b-a)/2 < tol       %ends program if x(i) is within tolerance
        break
    elseif f(x(i))==0
        break
    end
    if i==k                %prints max steps once i=k
        fprintf('Maximum steps reached\n') 
        break
    end
end

c=x'; %creating a column vector from row vector and defining c

end %end of function
function x = newt(f,f_prime,x0,n)
% Inputs:
%           f,f_prime are function handles
%           x0  is an initial guess
%           n   is the steps to take
% Output:
%           x is list of all the solution estimates

x(1) = x0;
for i =1:n
    x(i+1) = x(i) - f(x(i))/f_prime(x(i));
end % for i
end %program
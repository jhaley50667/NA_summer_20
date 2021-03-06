function x = newt(f,f_prime,x0,n)
%Inputs:
%           f,f_prime are function handles
%           x0  is an initial guess
%           n   is the steps to take
%Output:    x is list of all the solution estimates
        
x(1) = x0;
x(2) = x(1) - f(x(1))/f_prime(x(1));
for i =2:n
    x(i+1) = x(i) - f(x(i))/f_prime(x(i));
    if x(i+1) == x(i-1)
        x(i+1) = x(i+1) -0.1;
    end
end % for i
end %program
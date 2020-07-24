function[x] = newt(f,f_prime,x0,n)
% From example 0622
% Inputs:
f = @(x) (x-pi)^2;
% f_prime is derivate of f at first order.
f_prime = 2*(x-pi);
% f,f_prime are function handles.
% x0 is initial guess.
% n is the number of steps to take.
format long
xc = bisect(f,0,1,1e-5)

x0 = 4; n=12;

%backward error |f(x0)|
abs(f(x0))

%what is machine epsilon?
eps

%forward error, |x0 - r|, r = 2/3
abs(x0-2/3)

%%%% example with f(x) = (x-pi)^2
f = @(x)(x-pi)^2;
x0 = 4;

% backwards error
abs(f(x0))

% forward error |x0 - r|
abs(x0-0)
% Outputs:
% x is the list of all the solution estimates
x(1) = x0;
for i = 1:n
    x(i+1) = x(i)-f(x(i))/f_prime(x(i))
end % for i
end % program
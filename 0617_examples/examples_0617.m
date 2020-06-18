%examples June 17

%fixed point method
%trying to find the root of f(x) = x^3 + x - 1

clear %clears all variables in the workspace
g = @(x) 1-x.^3;  %"dot let's us use vectors if we want
h = @(x) (1-x).^(1/3);

%try using the fpi.m function with guess x_0 = 0.5, 15 steps
x0 = 0.5;
max_steps = 15;
fpi(g,x0,max_steps)
fpi(h,x0,max_steps)

%derivatives g' and f' for fixed point theorem
g_prime = @(x) -3*x.^2;
h_prime = @(x) -(1/3)*(1-x).^(-2/3);
r = 0.6835;

abs(g_prime(r))
abs(h_prime(r))




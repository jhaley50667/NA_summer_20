%example 0622

f = @(x) x^3-2*x^2+4/3*x-8/27;
format long
xc = bisect(f,0,1,1e-5)

xa = 0.6666641;

%backward error |f(xa)|
abs(f(xa))

%what is machine epsilon?
eps

%forward error, |xa - r|, r = 2/3
abs(xa-2/3)

%%%% example with f(x) = sin(x) -x 
f = @(x) sin(x)-x;

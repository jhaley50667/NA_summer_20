function [student_id,c] = f109338904hw02a(f,a,b,tol,max_steps)
%Bisection Method computes approximate solution of f(x) = 0
%input:
% function handle f; a,b such that f(a)*f(b)<0, and tolerance tol
% output:
% Approximate solution xc
student_id = 109338904;
k = 0;


if sign(f(a))*sign(f(b)) >= 0
    error (' f(a)f(b)<0 not satisfied!')
end
fa = f(a);
fb = f(b);
while (b-a)/2 > tol
    k = k+1;
    c = (a+b)/2;
    fc = f(c);
    if fc == 0
        break
    end
    if sign(fc)*sign(fa)<0
        b = c; fb=fc;
    else
        a = c; fa = fc;
    end
    if k>=max_steps
        fprintf('Maximum steps reachde\n')
    end
    
    
end
c = (a+b)/2;

        

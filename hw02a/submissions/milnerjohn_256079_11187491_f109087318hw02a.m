function [student_id, xc] =  f109087318hw02a(f,a,b,tol,max_steps)

%function find vector c which is root within function f
%between interval [a,b] with error tolerance tol and maximum iteration
% max_steps.
%inputs:
% f,a,b,tol,max_steps - function, startpoint,endpoint,tolerance,maximum steps
%outputs:
% sudent_id - integer, my id number
% c - '0' of function between a,b and all steps
student_id = 109087318;

if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end
fa=f(a);
fb=f(b);
i = 0;
xc = []

while (b-a)/2>tol
  if i >= max_steps
    break
  end 
  c=(a+b)/2;
  xc(i+1) = c
  fc=f(c);
  if fc == 0.0              %c is a solution, done
    break
  end
  if sign(fc)*sign(fa)<0  %a and c make the new interval
    b=c;fb=fc;
  else                    %c and b make the new interval
    a=c;fa=fc;
  end
  i = i + 1;
end
xc(i+1)=(a+b)/2;               %new midpoint is best estimate
 
%If max_steps reached, print message and exit
if i >= max_steps
fprintf('Maximum steps reached \n')
end
 
end %end of function
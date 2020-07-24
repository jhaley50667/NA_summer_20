%Computes approximate solution of f(x)=0
%Output: Approximate solution xc
function [c, student_id] = f109415866hw02a(f,a,b,tol,max_steps)
%Input: inline function f; a,b such that f(a)*f(b)<0, 
%     tolerance tol, maximum number of steps to take
student_id = 109415866

if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end
fa=f(a);
fb=f(b);
k = 0;
while (b-a)/2>tol
  c=(a+b)/2;
  fc=f(c);
  if fc == 0  %c is a solution, done
    break
  end
  if sign(fc)*sign(fa)<0  %a and c make the new interval
    b=c;fb=fc;
    k = k + 1;
    c = (a + b)/2
  else                   %c and b make the new interval
    a=c;fa=fc;
    k = k + 1;
    c = (a + b)/2
  end  % end of function
% if max_steps reached, print message and exit
if k == max_steps
    fprintf ('Maximum steps reached\n') 
    break
end
xc = (a + b)/2   %new midpoint is best estimate
end
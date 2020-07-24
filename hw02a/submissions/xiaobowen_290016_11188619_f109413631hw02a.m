function [student_id, c] =  f109413631hw02a(f,a,b,tol,max_steps)

%comments about input
%Input: inline function f; a,b such that f(a)*f(b)<0, 
%     and tolerance tol, maximum number of steps to take
student_id = 109413631
if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end
fa=f(a);
fb=f(b);
k = 0;
while (b-a)/2>tol
  c=(a+b)/2;
  fc=f(c);
  if fc == 0              %c is a solution, done
    break
  end
  if sign(fc)*sign(fa)<0  %a and c make the new interval
    b=c;fb=fc;
    k = k+1
  else                    %c and b make the new interval
    a=c;fa=fc;
    k = k+1
  end
end
xc=(a+b)/2;               %new midpoint is best estimate

% if max_steps reached, print message and exit
if k == max_steps
    fprintf ('Maximum steps reached\n') 
    break
end
xc = (a + b)/2   %new midpoint is best estimate

end %end of function
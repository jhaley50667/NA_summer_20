%Program 1.1 Bisection Method
%Computes approximate solution of f(x)=0
%Input: inline function f; a,b such that f(a)*f(b)<0, 
%        tolerance tol and maximum steps 
%Output: student_id # and the vector c containing the estimates of the
%         zeroes
function [student_id, c] = f108569134hw02a(f,a,b,tol,steps)
if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end
student_id = 108569134;
fa=f(a);
fb=f(b);
k = 0;
c = zeros(1,steps); %steps is the number of array elements and all are stet to 0
while (b-a)/2>tol
  k = k + 1;
  c(k)=(a+b)/2;
  fc=f(c(k));
  if fc == 0              %c is a solution, done
    break
  end
  if sign(fc)*sign(fa)<0  %a and c make the new interval
    b=c(k);fb=fc;
  else                    %c and b make the new interval
    a=c(k);fa=fc;
  end
  if steps <= k
      fprintf('\nMaximum steps reached\n')
      tol = 10e15;
  end
end

c(k)=(a+b)/2;               %output is the entire c array
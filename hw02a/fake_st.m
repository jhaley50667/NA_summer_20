%Program 1.1 Bisection Method
%Computes approximate solution of f(x)=0
%Input: inline function f; a,b such that f(a)*f(b)<0, 
%     and tolerance tol
%Output: Approximate solution xc
function [s,c_vect] = hw02a(f,a,b,tol,max_steps)
if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end
fa=f(a);
fb=f(b);
k = 1;
while (b-a)/2>tol & k<= max_steps
  c=(a+b)/2;
  c_vect(k) = c;
  fc=f(c);
  if fc == 0              %c is a solution, done
    break
  end
  if sign(fc)*sign(fa)<0  %a and c make the new interval
    b=c;fb=fc;
  else                    %c and b make the new interval
    a=c;fa=fc;
  end
  k = k+2;
end
%print exit staement if max_steps reached
if k >= max_steps
    fprintf('Max steps reached \n');
end

xc=(a+b)/2;               %new midpoint is best estimate
s = 2354618;
c_vect = c_vect';
end
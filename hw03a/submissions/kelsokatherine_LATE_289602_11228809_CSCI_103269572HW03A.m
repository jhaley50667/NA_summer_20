function [student_id, xc] = f103269572a(f,a,b,n)
% usual input and out comments
%By using the bisection as the base of our algrothim, we will implement the
% Newton Method. The purpose of the Bisection method is to check between
% two end points, while the Newton Method approximates error. So the
% premise is to create a function that finds the mid-point and then
% calculates the error in which the answer is incorret. 


%code for checking that f(a)f(b) < 0
if sign(f(a))*sign(f(b)) >= 0;
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end
%I need to either make an adjustment to this algorithm or implement the new
%of false postition 
%after the bisection method. However, I've been stuck on this for days and it's already late so I just need 
%to turn it in. 
%main algorithm code

fa=f(a);
fb=f(b);
k = 0;
while (b-a)/2>tol
  c= (b+a)/2;
  fc=f(c);
  if fc == 0              %c is a solution, done
    break
  end
  if sign(fc)*sign(fa)<0  %a and c make the new interval
    b=c;
    fb=fc;
  else                    %c and b make the new interval
    a=c;fa=fc;
  end
end
end

function [student_id, c] =  f108603919hw02a(f,a,b,tol,max_steps)
%Program 1.1 Bisection Method
%Computes approximate solution of f(x)=0
%Input: inline function f; a,b such that f(a)*f(b)<0, 
%     and tolerance tol, and maximum number of steps to take max_steps
%Output: student id, vector of c values
student_id =108603919;
if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end
fa=f(a);
fb=f(b);
k = 0;
xc = []; %since c is being used for something else, this will be a placeholder for c till the end
while (b-a)/2>tol && max_steps>0 %loop will exit when max steps reached
  c=(a+b)/2;
  fc=f(c);
  xc = [xc, c];
  
  if fc == 0              %c is a solution, done
    break
  end
  if sign(fc)*sign(fa)<0  %a and c make the new interval
    b=c;fb=fc;
  else                    %c and b make the new interval
    a=c;fa=fc;
  end
  
  max_steps = max_steps - 1; %decrement max_steps with each iteration
end
if max_steps == 0 %if max steps was reached, print that
      fprintf('Maximum steps reached \n');
end
c=xc;               %vector of the c values
end

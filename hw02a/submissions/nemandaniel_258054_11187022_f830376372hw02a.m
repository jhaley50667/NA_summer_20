%{
Daniel Neman
830376372
CSCI 4650 - Summer 2020
hw02a - Bisection with max_steps implementation
%}

function [student_id, c] =  f830376372hw02a(f,a,b,tol,max_steps)
student_id=str2double(extractBetween(mfilename,"f","h"));
disp('Student ID: ')
disp(student_id)

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
  else                    %c and b make the new interval
    a=c;fa=fc;
  end
  
  disp('Estimate: ');
  disp((a+b)/2)
  max_steps = max_steps - 1;
  if max_steps == 0 
    %If max_steps reached, print message and exit
    disp('Maximum steps reached \n')
    break
  end
end
xc=(a+b)/2;               %new midpoint is best estimate
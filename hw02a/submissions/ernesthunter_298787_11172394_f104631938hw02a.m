function [student_id,xc] = f104631938hw02a(f,a,b,tol,max_steps)
%Homework Problem 02a for Numerical Analysis
%I start off by establishing my student id number
student_id = 104631938;
%If statement that looks at the signs of both points
%once multiplied, if they are greater than or equal to
%0 then it outputs an error code and exits program
if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end
%stating that fa is the same as f(a) and same with b
fa=f(a);
fb=f(b);
%k = 0 because that is the first iteration of
%the loop, starting with 0 steps until the problem
%is solved
k = 0;
%while loop that looks at the point between the two
%original ones and continues on if the point is 
%greater than the tolerance
while (b-a)/2>tol
    %c is the point between a and b
  c=(a+b)/2;
  %establish a new point in the function
  fc=f(c);
  %this means you've taken a step so you add one to k
  k = k + 1;
  %check to see if the value of k is equal to the max
  %number of steps, if yes then end the program and print
  %the statement
  if k == max_steps
     fprintf('Maximum steps reached\n')
     break
  end   
  %then if fc == 0 you also end the code, we have the solution
  if fc == 0              %c is a solution, done
    break
  end
  %a new interval will be created and it cycles back
  %through the code until the answer/maximum steps are
  %achieved
  if sign(fc)*sign(fa)<0  %a and c make the new interval
    b=c;fb=fc;
  else                    %c and b make the new interval
    a=c;fa=fc;
  end
  xc=(a+b)/2;               %new midpoint is best estimate
end

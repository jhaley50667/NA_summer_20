function [student_id, xc] = f104631938hw03a(f,a,b,n)
%Homework Problem 03a for Numerical Analysis
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
xc = 0.0;
%for loop that runs through values of k until it gets to the max steps,
%which are n, chosen by the user. Will calculate the equation.
for k = 1:n
    %c equation from the homework sheet
  c=vpa((b*fa)-(a*fb))/(fa-fb);
  %vpa is to make the output be in decimal form
  %establish a new point in the function
  fc=f(c);
  %this means you've taken a step so you add one to k
  k = k + 1;
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
end
  xc=c %this is the calculated answer for the problem 
end


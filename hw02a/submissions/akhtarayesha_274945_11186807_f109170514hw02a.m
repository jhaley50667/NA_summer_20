
function[student_id, c] = f109170514hw02a(f,a,b,tol,max_steps)
%UNTITLED Summary of this function goes here
%function conducts bisection method
%inputs:
% f - function
% a,b,- intervals
% tol - tolerance
% max_steps - max steps algorithm can take
%outputs:
% student_id - integer, my id number
% c - vector that contains all values computed from algorithm
student_id = 109170514;
c = [];
if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end
fa=f(a);
fb=f(b);
k=0;
while (b-a)/2>tol
  p=(a+b)/2;
  fp=f(p);
  xc=(a+b)/2;
  c = [c xc]; 
  if fp == 0              %c is a solution, done
    k =k+1;
    break
  end
  if sign(fp)*sign(fa)<0  %a and c make the new interval
    b=p;
    fb=fp;
    k=k+1;
  else                    %c and b make the new interval
    a=p;
    fa=fp;
    k=k+1;
  end
  if k == max_steps %if max steps reached
    disp('The max number of steps has been reached!')
    break
  end 
end
disp(c); %will output vector values

end


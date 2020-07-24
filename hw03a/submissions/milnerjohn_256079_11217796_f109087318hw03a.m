function [student_id, xc] =  f109087318hw03a(f,a,b,n)

%False Position function find vector c which is root within function f
%between interval [a,b] with total number of steps to take n.
%inputs:
% f,a,b,n - function, startpoint,endpoint,max_steps
%outputs:
% sudent_id - integer, my id number
% xc - aprrox '0' of function between a,b and all steps
student_id = 109087318;

if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end
fa=f(a);
fb=f(b);
i = 0;


while i < n % max step
  i = i + 1;              % steps taken
  c=((b*fa) - (a*fb))/(fa-fb);
  fc=f(c);
  if fc == 0.0              %
    break
  end
  if sign(fc)*sign(fa)<0  %a and c make the new interval
    b=c;fb=fc;
  else                    %c and b make the new interval
    a=c;fa=fc;
  end
  
end
xc = c;             %new c is best estimate
end %end of function
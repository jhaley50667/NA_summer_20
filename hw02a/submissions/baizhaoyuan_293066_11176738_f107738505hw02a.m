function [student_id, c] =  f107738505hw02a(f,a,b,tol,max_steps)

%Computes approximate solution of f(x)=0
%Comments about input: inline function f; a,b such that f(a)*f(b)<0, 
%     and tolerance tol
%your code goes here
%Output: Approximate solution xc and student ID

student_id = 107738505
    
if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end

i = 0;
fa=f(a);
fb=f(b);

while  (b-a)/2>tol 
  c=(a+b)/2
  i = i+1; 
  fc=f(c);
  if fc == 0              %c is a solution, done
    break
  end
  if sign(fc)*sign(fa)<0  %a and c make the new interval
    b=c;fb=fc;
  else                    %c and b make the new interval
    a=c;fa=fc;
  end
  %If max_steps reached, print message and exit
  if i == max_steps
    fprintf('Maximum steps reached \n')
    break 
  end

 end

end %end of function
            
  


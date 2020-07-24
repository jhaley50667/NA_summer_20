%Program 1.1 Bisection Method
%Computes approximate solution of f(x)=0
%Input: inline function f; a,b such that f(a)*f(b)<0, 
%     and tolerance tol
%Output: Approximate solution xc
function [student_id,c] = f109321615hw02a(f,a,b,tol,max_steps)
student_id=109321615 
%return student_id 
if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end
fa=f(a);
fb=f(b);
c = [(a+b)/2;zeros(max_steps,1)];
        for i=0:max_steps
        c1=(a+b)/2;
        fc1=f(c1);
        c(i+1)=c1 
        %a vector c that holds all the estimates of the value of the function zero computed  as the program runs
            if i>=max_steps
            fprintf('Maximum steps reached \n')
                break
    %If max_steps reached, print message and exit
                elseif fc1==0
                    break
            end
            if sign(fc1)*sign(fa)>0 %a and c make the new interval
            a=c1;
            else                    %c and b make the new interval
            b=c1;fa=fc1;
            end
        end
  c= c(max_steps+1)
end
%end of function


 

   

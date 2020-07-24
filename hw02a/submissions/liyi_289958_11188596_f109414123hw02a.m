function [student_id,c] = f109414123hw02a(f,a,b,tol,max_steps)
%function holds all the estimates of the value of the function zero
% computed as the program runs
%inputs:
% f-function
% a,b-endpoints of the interval
% tol-tolerance
% max_steps-the maximum number of steps of the algorithm to take
%outputs:
% student_id-integer, my id number
% c-vector of approximate solution
student_id=109414123;
if sign (f(a))*sign (f(b))>=0
    error ('f(a)f(b)<0 not satisfied!') %ceases execution
end
fa=f(a);
fb=f(b);
k=0
while (b-a)/2>tol
    c=(a+b)/2;
    fc=f(c);
    if fc==0                  %c is a solution, done
        break
    end
    if sign (fc)*sign (fa)<0  %a and c make the new interval
        b=c; fb=fc;
        k=k+1;
        c=(a+b)/2;
    else                      %c and b make the new interval
        a=c; fa=fc;
        k=k+1;
        c=(a+b)/2;
    end
    if k==max_steps           %if max_steps reached, print message and exit
        fprintf ('Maximum steps reached\n') 
        break
    end
end
xc=(a+b)/2;


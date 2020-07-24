function [student_id, xc] = f107573463hw03a(f,a,b,n)
%function uses the mathod of false position to find f(x)=0
%Inputs:
%f - inline function f
%a, b - real numbers such that f(a)*f(b)<0
%n - positive integer, maximum steps in computing f(x) = 0
%Outputs:
%student_id - integer, 107573463
%xc - real number, f(xc)=0

student_id=107573463;

%code for checking that f(a)f(b) < 0

if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end

%main algorithm code
fa=f(a);                         %simplifying variables
fb=f(b);
for i=1:n                        %indexing values
    xc=((b*fa)-(a*fb))/(fa-fb);  %method of false position
    if f(xc)==0
        break                    %if f(xc)=0, then xc is the answer
    end
    if (fa*f(xc))<0              %readjusts calculation
        b=xc;
    else
        a=xc;
    end
end
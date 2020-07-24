%{
Daniel Neman
830376372
CSCI 4650 - Summer 2020
hw03a - Method of False Position with max iterations implementation
%}

function [student_id, xc]=f830376372hw03a(f,a,b,n)
%{ 
INPUT
f - f(x) to evaluate
a - f(x) lower bound
b - f(x) upper bound
n - max number of itertions

OUTPUT
student_id - my student id
        xc - estimated solution to f(x)=0
%}
if f(a)*f(b)<0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end
student_id=str2double(extractBetween(mfilename,"f","h"));

%main algorithm code
for i=1:n
    xc = (b*f(a)-a*f(b))/(f(a)-f(b));
    if f(xc) == 0
        break
    end
    if f(a)*f(xc)<0
        b=xc;
    else
        a=xc;
    end
end
disp(student_id)
disp(xc)
end
function [student_id, xc] = f108569134hw03a(f,a,b,n)
%Program method of false position
%Computes approximate location of zeroes

%Input: function f; a,b such that f(a)*f(b)<0,
%and n the steps to take

%Output: student_id and the approximate solution xc
    
    if sign(f(a))*sign(f(b)) >= 0
        error('f(a)f(b)<0 not satisfied!') %ceases execution
    end
    student_id=108569134;
    for i = 1:n
        xc = (b*f(a)-a*f(b))/(f(a)-f(b));
    
        if f(xc)==0
            return;
        end
    
        if (f(a)*f(c) < 0)
            b=xc;
        else 
            a=xc;
        end
    end 

end 
%bisection method
%my function names have to be different than my script names
%in order for MatLab to allow my code to run.
%I only leave the 'a' out of the name.
% 
% format short;
% 
% f=@(x) sin(x);
% 
% [student_id,c] = f109130083hw02(f,2,4,1e-6,100)

function [student_id,c] = f109130083hw02(f,a,b,tol,max_steps)

student_id=109130083;   %student id

    if sign(f(a))*sign(f(b)) >= 0

        %stops execution if error encountered
        error('f(a)f(b)<0 not satisfied!') 

    end

    fa=f(a);

    fb=f(b);

    k = 0;

    cc=[];

    while (b-a)/2>tol

        k=k+1;

        c=(a+b)/2;

        cc(k)=c;

        fc=f(c);

    if fc == 0      %c is a solution and we are done

    break

    end

    if sign(fc)*sign(fa)<0  %a and c make the new interval

    b=c;fb=fc;

        else    %c and b make the new interval

            a=c;fa=fc;

    end

        if(k==max_steps)

    break;

        end

    end

    c=cc;

    xc=(a+b)/2; %new midpoint is best estimate

end
function [student_id,c] = f830386876hw02a(f,a,b,tol,max_steps)
    %function performs the bisection method
    %inputs:
    %f - function
    %a, b - real numbers, endpoints of interval
    %t - real number, tolerance
    %max_steps - integer, maximum steps alogrithm should take
    %outputs:
    %student_id - integer, my id number
    %c - vector, estimates of value of function zero
    
    student_id = 830386876;
    
    if sign(f(a)) * sign(f(b)) >= 0
        error('f(a)f(b)<0 not satisfied!')
    end
    fa = f(a);
    fb = f(b);
    c = [];
    step = 0;
    while (b-a)/2>tol
        
        %if max_steps reached, print message and exit
        if step > max_steps
            fprintf('Maximum steps reached\n');
            break
        end
        
        xc=(a+b)/2;
        c = [c, xc];            %add new midpoint to c vector
        fc=f(xc);
        if fc == 0              %c is a solution
            break
        end
        if sign(fc)*sign(fa)<0  %a and c make the new interval
            b=xc; fb=fc;
        else                    %c and b make the new interval
            a=xc; fa=fc;
        end
        
        step = step + 1;        %increment steps taken
    
    end %while
    
end %function

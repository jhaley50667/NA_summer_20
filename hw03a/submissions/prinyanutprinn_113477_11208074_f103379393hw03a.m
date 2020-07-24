%Program hw03a False Position
%Computes xc which is the estimated solution to the equation f(x) = 0
%Input: inline function f; a,b such that f(a)*f(b)<0, and number of steps.
%Output: My student ID, and xc which is the estimated solution
function [student_id,xc] = f103379393hw03a(f,a,b,n)

student_id = 103379393; %student id

% Evaluate both ends of the interval
fa = f(a);
fb = f(b);

% Display error and finish if signs are not different
if sign(fa) * sign(fb) >= 0
   error('f(a)f(b)<0 not satisfied!') % print error
end 

%loop thorugh max steps
for i = 1:n
    c = ((b*fa) - (a*fb)) / (fa-fb); %find c
    fc = f(c);     %get value when plug c into the function
    if fc == 0     %return results when fc is 0
        return
    end
    if fa*fc < 0   % a and c make new interval
        b = c;
    else           % b and c make new interval
        a = c;
    end
    xc = c;        %store new midpoint best estimate
    
end %end for

end %end function


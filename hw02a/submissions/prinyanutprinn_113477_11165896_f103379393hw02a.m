%Program hw02a Bisection Method
%Computes vector c that holds all the estimates of the value of the function zero computed
%Input: inline function f; a,b such that f(a)*f(b)<0, tolerance tol, and
%       max steps.
%Output: My student ID, and vector c that contains all of the values

function  [student_id, c] = f103379393hw02a(f, a, b, tol, max_steps)

student_id = 103379393; % my student ID
c = []; % c vector

% Evaluate both ends of the interval
fa = f(a);
fb = f(b);

% Display error and finish if signs are not different
if sign(fa) * sign(fb) >= 0
   error('f(a)f(b)<0 not satisfied!') % print error
end 

% loop go through the max_steps
for i = 1:max_steps
      
    % Find a new value to be tested as a root
     if (b - a) / 2 > tol
        m = (b + a)/2; % get the middle
        fm = f(m); % eval middle value with the provided function
        if fm == 0  % m is the solution, done
            return
        end 

        if fa * fm > 0 % a and m make new interval
            a = m;
            fa = fm;
        else % b and m make new interval
            b = m;
        end
     end
     
     %get and store the middle value to the vector
     xm = (a+b)/2;
     c = [c;xm]; % append new middle value to c vector
end
fprintf("Maximum steps reached \n")
end
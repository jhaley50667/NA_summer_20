function [student_id,xc] = falsepos(f,a,b,n)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%HW 3a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Input:      function handle (f), 
%            End points of interval (a,b), 
%            maximum number of interations (n)
%
%Output:     Student id
%            approximate solution (xc)


student_id = 10;


if(f(a)*f(b) > 0)
    xc = [];
    disp('Condition f(a)*f(b) < 0 is not satisfied\n');
    disp('Please select proper interval');
    return
end

for i = 1:n,

   c = (b*f(a)-a*f(b))/(f(a)-f(b));
  
   %if(f(c) == 0)
   if(abs(f(c)) < 0.0001)
       xc = c;
       break
   end
   
   if(f(a)*f(c) < 0)
       b = c;
   else
       a = c;
   end
    
end

if(i == n)
    disp('Max. iteration has reached')
    xc = c;
end
    
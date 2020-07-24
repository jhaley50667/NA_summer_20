function [student_id, xc ] = f102391445hw03a(f,a,b,n)


student_id = 102391445;

% Validity of number of steps chosen and 

if (n <= 0)
    error('steps must be greater than 0');
    
    %code for checking f(a)*f(b) < 0
    
else if (f(a)*f(b) >= 0)
        error ('invalid endpoints');
        
    end
    
    %main algorithm code
    
    for i = 1:n
     
     xc = (b*f(a)-a*f(b))/(f(a)-f(b));
     
     if (f(xc) == 0)
         
         break;
         
     else if (f(a)*f(xc) < 0)
             
             b=xc;
         else
             a=xc;
         end
         
     end 
    end

    
end
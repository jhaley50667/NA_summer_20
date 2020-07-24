function [student_id, xc] = f830373075hw02a(f,a,b,tol,max_steps)

                          %f = input funtion,
                          %a = low estimate
                          %b = high estimate
                          %tol = input tollerance
                          %max_steps = max amount of steps taken

if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end

fa=f(a);
fb=f(b);
k = 0;

while (b-a)/2>tol
  c=(a+b)/2;
  fc=f(c);
  
  if max_steps == k
                          %If max_steps reached, print message and exit

        fprintf('Maximum steps reached \n')
      break
  end
  
  k=k+1;                  %steps
  
  xc(k) = c;              %stores current estimate in output
  
  
  if fc == 0              %c is a solution, done
    break
  end
  
  if sign(fc)*sign(fa)<0  %a and c make the new interval
    b=c;fb=fc;
  else                    %c and b make the new interval
    a=c;fa=fc;
  end
end  
 
student_id = 830373075;   %my student ID
 
xc = xc';                 %transposes output array

end                       %end of function
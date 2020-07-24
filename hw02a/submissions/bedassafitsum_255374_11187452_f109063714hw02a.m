clear all
close all
f=@(x) sin(x);
a=3;
b=4;
[student_id,c]=bisect(f,a,b,1e-4,100)
function [student_id,c]=bisect(f,a,b,tol,max_steps)
% input:
% f,a,b,tol,max_steps
%output: 
% student_id,c
e=tol;
c=[];
student_id=1;
iter = 0; % Set itteration to zero
if f(a)*f(b)>=0
disp('No Root')
else
prev = (a+b)/2;
p=a;
while (abs(f(p))>e)
prev=p;
   iter =iter+ 1;
p = (a+b)/2;
if f(p) == 0
break;
end % End of while loop
if f(a)*f(p)<0
b = p;
else
a = p;
end  
  
   if(iter>=max_steps)% if itteration greater than or equal maximum max steps
fprintf('Maximum steps reached\n');
   end 
end
end
c=p;
end % end of function




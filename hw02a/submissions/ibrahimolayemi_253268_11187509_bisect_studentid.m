clc
f=@(x) sin(x);
a=3;
b=4;
[student_id,c]=bisect(f,a,b,1e-4,100)
function [student_id,c]=bisect(f,a,b,tol,max_steps)
d=tol;
c=[];
student_id=1;
iter = 0;
if f(a)*f(b)>=0
disp('No Root')
else
previous = (a+b)/2;
q=a;
while (abs(f(q))>d)
previous=q;
   iter =iter+ 1;
q = (a+b)/2;
if f(q) == 0
break;
end
if f(a)*f(q)<0
b = q;
else
a = q;
end
if(iter>=max_steps)
fprintf('Maximum steps reached\n');
end

end

end

c=q;

end
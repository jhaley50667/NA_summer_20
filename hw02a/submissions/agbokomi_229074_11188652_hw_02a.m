% Homework hw2a
%function[student_id, c] = f(107907655hw02a(f,a,b,tol,max_steps)
%[student_id,c] = bisect(f,a,b,le-4.100)
function[student_id,c] = bisect(f,a,b,tol,max_steps)

f=@(x) sin(x);
a=3;
b=4;
tol = input('e > (b-a)/2');
e=tol;
c=[];
student_id=1;
iter = 0;
if f(a)*f(b)>=0
disp('No Root')
else
prev = (a+b)/2;
p=a;
while (abs(f(p))>e)
prev = p;
   iter =iter+ 1;
p = (a+b)/2;
if f(p) == 0
break;
end
if f(a)*f(p)<0
b = p;
else
a = p;
end
   if(iter>=max_steps)
fprintf('Maximum steps reached\n');
   end
% end
end
c=p;
end
% Finally, the interval [a,b] contains a root.
% The approximate root is p = (a + b)/2.





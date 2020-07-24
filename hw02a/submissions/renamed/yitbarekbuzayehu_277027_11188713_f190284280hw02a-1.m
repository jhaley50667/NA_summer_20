clc
clear all
close all
% ths equation is sin(x) you want to solve
f=@(x) sin(x);
% Give initial guesses.
a=3;
b=4;

%function [student_id, c] =  fxxxxxxxxhw02a(f,a,b,tol,max_steps)
[student_id,c]=fxxxxxxxhw02a(f,a,b,1e-4,100)
function [student_id,c]=fxxxxxxxhw02a(f,a,b,tol,max_steps)
e=tol;
c=[];
% print student id
student_id=190284280;
iter = 0;

% Solves it by method of bisection.
if f(a)*f(b)>=0
    disp('choose another guess')
else
    % divide
    prev = (a+b)/2;
    p=a;
    while (abs(f(p))>e)
        prev=p;
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
        
        % if it reach maximum steps print maximum step reached
        if(iter>=max_steps)
            fprintf('Maximum steps reached\n');
        % end if stetement 
        end
    end
end
c=p;
end

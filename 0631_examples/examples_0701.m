% Examples
% July 1, 2020

%(2-10^20)x2 = 4-10^20
%LHS l for left
l =2-10^20

%RHS r for right
r = 4-10^20

r/l

%curiosity
for i = 1:20,fprintf('(2 - 10^%d) = %f \n',i,2-10^i),end   


%condition number for the matrix
A = [10^(-20) 1;1 2]
cond(A)

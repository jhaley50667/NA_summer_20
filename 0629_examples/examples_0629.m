%examples June 29

%Solve Ax=b with random data


% define a 4x4 matrix with random numbers
A = rand(4)

%define a column vector b with random data
b = rand(4,1)

%factor A = LU
[L,U] = lu(A)

%check to see if A=LU
L*U - A

%Ax = b ==> LUx = b, let y = Ux
try
y = U*x
catch  
   warning('oops')
end

%oops Matlab has no idea what x is yet
% y = Ux & LUx = b ==> Ly = b
% solve for y, using "backslash" method
y = L\b

%we know y = Ux, solve for x with "backslash"
x = U\y

%Check by solving Ax = b directly

A\b


%%%%%%% Section 2.3 %%%%%%%%
clear

%Set up the problem, enter approximation xa
A = [1 1;1.0001 1];
b = [2 ; 2.0001];
xa = [-1;3.0001]


x = A\b

%finding the forward and backwards errors:
help norm

%forward error: ||x-xa||_inf, usually we don't know x
fwd_err = norm(x-xa,Inf)

%Backward error, we know all the pieces: A,b,xa
bwd_err = norm(A*xa -b,Inf)

%compute a ratio
fwd_err/bwd_err

%%%%  Condition Number %%%%
%cond(A) = ||A||_inf||A^(-1)||_inf
A = [1,1;1.0001,1];

A_norm = norm(A,Inf)
A_inv_norm = norm(inv(A),Inf)

A_norm*A_inv_norm

%as usual, Matlab is way ahead of us
cond(A)

%% Let's look at condition numbers for some badly beahved matrices:
clear
A = ones(3)

cond(A)
%That's pretty bad, let's make it a bit better
A(1,1) = A(1,1)+1e-6
cond(A)

A(2,2) = A(2,2)+1e-6
cond(A)

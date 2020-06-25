%examples June 24

%Newton weirdness
f = @(x) x.^3 - 5*x;
f_prime = @(x) 3*x.^2 - 5;
x0 = 1;
steps = 9;

x = newt(f,f_prime,x0,steps);
figure,plot(x)

%linear algebra starts here
%type in matrix A

%type in column vector b

%solve Ax=b with "backslash'

%find Ai = A^(-1)

%solve Ax=b with inverse

%Invertible matrices have no eignevalues = 0
[V,D] = eig(A)


%A = V*D*V^(-1) ==> A*V = V*D ==> A*V - V*D = 0 ?



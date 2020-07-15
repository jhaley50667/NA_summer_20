% examples July 8

%cholesky to determine if a matrix SPD
a1 = [2 2;2 5]
r1 = chol(a1)

%check that r1'*r1 = a1
norm(a1-r1'*r1)

%see if a random matrix is SPD
a2 = rand(3)
try
r2 = chol(a2)
catch
    error('Bad matrix, not SPD')
end
%special matrix
a3 = a2'*a2
%is a3 SPD?
r3 = chol(a3)


% example  1/2*x'Ax = x'b ==> 
% left side
f = @(u,v) 2*(u+v).^2+3*v.^2;
% right side
g = @(u,v) 6*u + 3*v;

%set up x-y plane
[x,y] = meshgrid(-2:8,-4:4);
%quaratic shape z= f(u,v)=1/2*x'Ax-x'b
z = 1/2*f(x,y)-g(x,y);
figure,surf(x,y,z)


figure(23),contour(x,y,z,15),xlabel('u'),ylabel('v'),grid on

%A-conjugate...
A = [2 2;2 5];
d0 = [6;3];
d1 = [180/49;-120/49];
Ad1=A*d1
dot(d0,Ad1)


%%plot the approximations
xa = [0 0;10/7 5/7;4 -1];
figure(23),hold on,plot(xa(:,1),xa(:,2))


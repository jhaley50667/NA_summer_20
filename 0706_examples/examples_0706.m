%Examples July 6

% make a random matrix
A = rand(3);
%now make it strictly diagonally dominant
A = A + 2*eye(3)
% random right side
b = 10*randn(3,1)

%try to solve with jacobi, using k = 6 steps.
k = 20;
x = jacobi(A,b,k)

%make a plot of how the value of x1 is converging
figure,plot(x(:,1)),title('x1')

%show x1 and x2 converging in the plane
figure,plot(x(:,1),x(:,2),'*:k'),title('x1 x2');

%make a plot showing how x1,x2,x3 converge in space
figure,plot3(x(:,1),x(:,2),x(:,3),'*:k'),title('x1 x2 x3'),xlabel('x1'),ylabel('x2'),zlabel('x3')



%%% SPD system
f = @(x,y) 2*(x+y).^2+3*y.^2;
t = -4:4;
[x,y] = meshgrid(t,t);
z = f(x,y);
figure,surf(x,y,z)

%%%%%%%  Symmetric Positive definite %%%%%%%
a = [2 4;4 5]

% is a SPD?
chol(a)
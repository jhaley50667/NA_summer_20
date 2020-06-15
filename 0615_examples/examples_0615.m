%examples_0615.m

%use "debugging mode"

%defining a function handle
f=@(x) x.^3+x-1;
f(0)
f(1)
%what does the "dot" after x do? We can send in vectors
f([0,1])

%compare, g has "no dot"
g=@(x) x^3+x-1;

%plotting
help linspace
t = linspace(0,1,10); %10 numbers in the interval [0,1]
z = f(t);
figure,plot(t,z)



%use bisect.m to solve for the root in the interval [0,1] tol = 5e-6
edit bisect.m

%never hurts to look at such code...

%run it with our function f,a = 0, b = 1, tol = 5e-6
xc = bisect(f,0,1,5e-6)

%how about the function h(x) = x, interval [-pi,e] ?
% what would Newton's method do?
h=@(x) x;
xd = bisect(h,-pi,exp(1),5e-16)



%checking errors
tol = 0.5e-6;
for n = 1:50
    %record errors in vector
    e(n) = 0.5^(n+1);
    fprintf('n =%d   error < %0.8f \n',n,e(n))
    if e(n) < tol
        fprintf('Done, tolerance reached \n')
        break
    end
end
plot(e),title('Errors'),xlabel('n'),ylabel('Error')



%Examples July 10

%Newton for system
f = @(x) [-x(1).^3+x(2);x(1).^2+x(2).^2-1];
df = @(x)[-3*x(1)^2,1;2*x(1),2*x(2)];
x0 = [1;2];

x = newt_s(f,df,x0,6)

%plot the solution vector
figure,plot(x(:,1),x(:,2))

%check the convergence
for i=1:length(x)
    back(i) = norm(f([x(i,1);x(i,2)]));
end
figure,plot(back)



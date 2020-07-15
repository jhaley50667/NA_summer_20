%Examples July 15

%data with points close to each other
x = [0.99 1 2 3 4 4.01];
y = [1 1 2 3  4 4];
p_new = polyfit(x,y,5)
x_plot = -1:0.2:6;
y_plot = polyval(p_new,x_plot);
figure,scatter(x,y)
hold on,plot(x_plot,y_plot)
clear

%interpolation error interpolate exp(x) on [-1,1]
x = linspace(-1,1,5);
y = exp(x);
y_fit = polyfit(x,y,4);

%plot function and interpolant on [-3,3]
x1 = linspace(-3,3,20);
y = exp(x1);
y1 = polyval(y_fit,x1);
figure,plot(x1,y,x1,y1);
clear,close all

%Runge example
f = @(x) 1./(1+12*x.^2);
x = linspace(-1,1,25);
y = f(x);
figure,plot(x,y)
% now, interpolate a function through those points
y_fit = polyfit(x,y,24);
x1 = linspace(-1,1,40);
y1 = polyval(y_fit,x1);
figure,plot(x1,y1);

%% Least Squares %%
%find the least quares solution to Ax=b in from the notes
A = [1 1;1 -1;1 1];
b = [2;1;3];

%Matlab "magic backslash" does it all

x_bar = A\b


%% fitting a quadratic
A = [1 -1 1;1  0 0;1 1 1;1 2 4];
b =[1;0;0;-2];

%curiosty: What is A'A?
ata = A'*A

%is A'A SPD?
chol(ata)

c = A\b

%% check out the Matlab polyfit function
y = [1 0 0 -2];
t = [-1 0 1 2];
    
c1 = polyfit(t,y,2)


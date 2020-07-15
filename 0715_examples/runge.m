function  runge(n)
%Function that shows the Runge phenomena
%
% The Polynomial interpolation of f(x) =1/(1 +12 * x^2)
% on equaly distributed n nodes on [-1 1]
% causes  extreme variation near the ends 
% as n increases
%INPUT n the # of equaly distributed nodes in [-1 1]
% Written by Constantin Bacuta
%
close all
x=-1:0.02:1; % mesh points on [-1 1] used for plotting 
y=1./(1 + 12 * x.^2);
plot(x,y) % a plot of f 
xp=linspace(-1,1,n); % the interpolation nodes
yp=1./(1 + 12 * xp.^2); %y_i=f(x_i) 
hold on
plot(xp,yp,'o') %ploting the data points on the graph of f
C=polyfit(xp,yp,n-1); %computes the coefficients of P_{n-1}
Interp=polyval(C,x); %evaluates the Interpolant  P_{n-1} at the mesh points
plot(x,Interp,'r')
end


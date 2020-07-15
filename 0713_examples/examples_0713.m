%Examples July 11, 2020

% edit splinecoeff.m

%splines find natural spline through the points (1,2),(2,1),(4,4),(5,3)
x = [1 2 4 5];
y = [2 1 4 3];

c = splinecoeff(x,y)
%verify against what the book example has

%use the splineplot function to plot the result with k = 3 points per
%segment
%edit splineplot.m
[x1,y1]=splineplot(x,y,3);

%try with 7 points per segment
close all
[x2,y2]=splineplot(x,y,7);

%try the Maltab polyfit and polyval functions
pfit = polyfit(x,y,3);
yfit = polyval(pfit,x2);
figure,plot(x2,yfit),title('Polyfit function')

%plot the difference between the two interpolations
diff = yfit-y2;
figure,plot(x2,diff),title('Difference of Interploations'),grid on


%data with points close to each other
x = [0.99 1 2 3 3 4 4.01];
y = [1 1 2 3  4 4];
p_new = polyfit(x,y,5)
x_plot = -1:0.2:6;
y_plot = polyval(p_new,x_plot);
figure,scatter(x,y)
hold on,plot(x_plot,y_plot)
clear




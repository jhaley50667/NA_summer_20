%example script

% declaring a variable
a = 2

% end a statement with seimicolon to supress output
b = 2.7;

%basic built-in funtions
%highlight code with mouse and right click for options

c = (a+b)^2

% finding which variables are in the workspace
who

% with more details
whos

%clear a variable
clear b

%now see what variables we have
who

%build a small matrix by hand
M = [1,3;2,4]  %[m11,m12;m21,m22]

%scalar times a matrix
3*M

%make an Identity matrix
I = eye(2)

%multiply matrices
I*M

%add two matrices
N = I + M

%find the first column of N
N(:,1)

%find second row of N
N(2,:)

%what does this do?
N(2,2)

%find the size of a matrix
size(N)

%Make a random matrix
R = rand(5,6)


%Lets make some loops to add up all the numbers in the matrix R
[n,m] = size(R);
s = 0;
%right click on the following block and choose "smart indent"
for i = 1:n
    for j = 1:m
        s = s + R(i,j);
    end
end

%what is our answer?
s

%matlab usually has a better way to do things
sum(R(:))


%let's clear all variables
clear i j m n R s


%plotting
x = -2:0.1:2; % list of numbers from -2 to 2 with spacing 0.1

%what are the first 7 numbers in x
x(1:7)

%put x into a built-in function
y = exp(x);

%plot and label the axes
plot(x,y)
xlabel('x')
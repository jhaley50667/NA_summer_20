%examples June 26

% solving by hand, using matlab
%define tableau matrix
A = [1, 1, 3;3 -4 2]

% store the top row in a "temp" variable
t = A(1,:)

%copy bottom row to the top
A(1,:) = A(2,:)

%copy t into row 2
A(2,:) = t

%multiply row 2 by -3
A(2,:) = -3*A(2,:)

%add row 1 and row 2, store in row 2
A(2,:) = A(1,:)+A(2,:)

%multiply row 2 by -1/7
A(2,:) = (-1/7)*A(2,:)

y = 1;
%y = 1 ==> 3x = 2+4*y ==> x = (2+4*y)/3
x = (2+4*y)/3

%a little bit about Matlab and columns
%third column
A(:,3)

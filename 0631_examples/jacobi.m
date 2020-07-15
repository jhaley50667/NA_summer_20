% Program 2.2  Jacobi Method
% Inputs: full or sparse matrix a, r.h.s. b,
%         number of Jacobi iterations k
% Output: solution vector x_out
function x_out = jacobi(a,b,k)
n=length(b);      % find n
d=diag(a);        % extract diagonal of a
r=a-diag(d);      % r is the remainder  (L+U)
x=zeros(n,1);     % initialize vector x 
x_out = x';
for j=1:k         % loop for Jacobi iteration
  x=(b-r*x)./d
  x_out = [x_out;x'];
end               % End of Jacobi iteration loop

function xc=fpi2(g,x0,k, tol)
%% FPI:  Fixed-Point Iteration
%       Computes approximate solution xc of g(x)=x
%       Input: function handle g, initial guess x0, 
%           number of steps k, bakwards error tolerance tol
%       Output: approximate solution xc
%       Usage: xc=fpi(g,x0,k)
x(1) = x0;
err = 1+tol;
steps = 0;

while steps < k && err < tol
  steps = steps + 1;
  x(i+1) = g(x(i))
  err = abs(x(i+1)-x(i));
  if abs(err) < tol
      fprintf('Backwards error tolerance reached \n')
  end
end
xc = x;
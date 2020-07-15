function [xout] = newt_s(f,df,x0,n)
%newton for systems
%input f,df   - function handles, vector-valued
%      x0     - initial guess 
%      n      - steps to take
%output:
%      xout      - vector with approximations    
x = x0;
xout=x';
for i = 1:n
    % form of newtons
    %x(i+1) = x(i) - f(x(i))/f'(x(i))
    %we use matrix operations : Matlab "backslash" is division of matrices
    x = x - df(x)\f(x);
    xout = [xout;x']
end
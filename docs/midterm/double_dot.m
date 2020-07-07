function dd = double_dot(u,v)
%returns the 2*<u,v>, twice the dot-product of 3-vectors u,v

%check size of input vectors
if length(u) ~= 3 || length(v) ~= 3
    error('Vectors not right size')
end
dd = 0;
for i = 1:3
  dd = dd + u(i)*v(i);
end
dd = 2*dd;

end
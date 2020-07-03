function dd = double_dot(u,v)
%returns the 2*<u,v>, twice the dot-product of 4-vectors u,v

%check size of input vectors
if length(u) ~= 4 || length(v) ~= 4
    error('Vectors not right size')
end
dd = 0;
for i = 1:4
  dd = dd + u(i)*v(i);
end
dd = 2*dd;

end
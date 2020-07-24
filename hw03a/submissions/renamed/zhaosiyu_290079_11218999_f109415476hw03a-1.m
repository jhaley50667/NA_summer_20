function [student_id,xc] = f109415476hw03a(f,a,b,n)
% % inputs include function f, end points of the interval a, b such that
% f(a)*f(b)<0, and n, the number of steps should take before stopping
student_id = 109415476
if sign(f(a))*sign(f(b)) >= 0   % code for chekcing that f(a)*f(b)<0
  error('f(a)f(b)<0 not satisfied!')
end
fa = f(a);
fb = f(b);
i = 0;
while i < n && sign(f(a))*sign(f(b)) < 0
    c = (b*fa - a*fb)/(fa - fb);
    fc = f(c);
    if fc == 0  %c is a solution, done
        break
    end
    if sign(fc)*sign(fa)<0  %b and c make the new interval
        b = c; fb = fc;
        i = i + 1;
        xc = c
    else                 %a and c make the new interval
        a = c;fa = fc; 
        i = i + 1;
        xc = c
    end
if i == n
    fprintf ('Maximum steps reached\n') 
    break
end
end
xc = (b*fa - a*fb)/(fa - fb)   % estimated solutioin
end


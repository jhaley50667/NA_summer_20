function [student_id, xc] = f830373075hw03a(f,a,b,n)

i = 0;

%check that f(a)f(b) < 0
if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end

%function
while i <= n
    
    i=i+1;
    
    c = ((b*f(a))-(a*f(b)))/(f(a)-f(b));
    
    xc(i) = c;
    
    if f(c)==0
        break
    end
    if(f(a)*f(c))<0
        b = c;
    else
        a=c;
    end
    
end

%transpose output array
xc = xc';   

%student ID
student_id = 830373075;

end
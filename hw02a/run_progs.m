function run_progs()

os = 1;
d = dir('*.m')
f = @(x) cos(x) -x;
a = 0;
b = 2;
tol = 1e-12
max_steps = 3;
[st,answer]=hw02a(f,a,b,tol,max_steps);


for i = 1:length(d)
    clc
    fstr = d(i).name(1:end-2);
    fprintf('**********************\n');
    fprintf('****** file %d *******\n',i);
    fprintf('****** %s  ***********\n',fstr);
    try
        tic
        [s,v] = feval(fstr,f,a,b,tol,max_steps);
        if length(s) > 1
            tmp = s;
            s = v;
            v = tmp;
            frpintf('output backwards \n')
        end
        v
        timings(i,1) = toc;
        evals(i,1) = s;
        evals(i,2) = norm(v(end)-answer(end))/norm(answer(end));
        
    catch
        warning('Function Problem, i = %d, function = %s',i,fstr)
        evals(i,2) = -100;
        timings(i,1) = -100;
    end
    %% check for commenting
%     if os == 0   %% windows
%         comment_str = sprintf('findstr %s %s','%',d(i).name);
%     else   %% linux
%         comment_str = sprintf('grep %s %s','%',d(i).name);
%     end
%     check_comments = ~system(comment_str);
%     if  check_comments > 0
%         fprintf('Comments found \n')
%         comments(i,1) = 1;
%     else
%         fprintf('No comments found \n');
%     end
    fprintf('%s:  student_id:%d    relative_error:%0.5f time: %0.4f \n',fstr,evals(i,1),evals(i,2),timings(i,1));
end


end

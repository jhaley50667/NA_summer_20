function grade_hw03a(list)

os = rename_functions();
addpath('submissions')
d = dir('submissions/*.m')
fprintf('%d files found, %d students on the list \n\n',length(d),length(list));
evals = zeros(length(d),2);
timings = zeros(length(d),1);
comments = zeros(length(d),1);
fprintf('Starting Evaluations of downloaded functions\n\n')

tol = 10^-(12);
%f = @(x) sin(x-1)+x;
f = @(x) x^2-2;
a = 0;
b = 2;
n =2;
[fake_id,answer] = millsdennis_214736_11218514_f104650604hw03a(f,a,b,n);
%[fake_id,answer] = prinyanutprinn_113477_11208074_f103379393hw03a(f,a,b,n);

for i = 1:length(d)
    fstr = d(i).name(1:end-2);
    fprintf('**********************\n');
    fprintf('****** file %d *******\n',i);
    fprintf('****** %s  ***********\n',fstr);
    fprintf('Attempting to run %s \n',d(i).name)
    try
        tic
        [s,v] = feval(fstr,f,a,b,n);
        timings(i,1) = toc;
        evals(i,1) = s;
        evals(i,2) = norm(v-answer)/norm(answer);   
    catch
        warning('Function Problem, i = %d, function = %s',i,fstr)
        evals(i,2) = -100;
        timings(i,1) = -100;
    end
    
    %% check for commenting
    if os == 0   %% windows
        comment_str = sprintf('findstr %s %s','%',d(i).name);
    else   %% linux
        comment_str = sprintf('grep %s %s','%',d(i).name);
    end
    [check_comments,~] = system(comment_str);
    if  check_comments ~= 0
        fprintf('Comments found \n')
        comments(i,1) = 1;
    else
        fprintf('No comments found : deduct 0.5 points\n');
    end
    fprintf('student id: %d    answer: %f       expected answer: %f  \n',s,v,answer);
    %fprintf('%s:  student_id:%d    relative_error:%0.5f time: %0.4f \n',fstr,evals(i,1),evals(i,2),timings(i,1));
    clc
end

% %%% assign grades %%%
% fprintf('************************\n')
% fprintf('************************\n')
% fprintf('************************\n\n')
% fprintf('Assigning Grades \n')
% for i = 1:length(list)
%     fprintf('*************** \n')
%     for j = 1:length(d)
%         score = 0;
%         if list(i).SISUserID== evals(j,1)
% %             if  list(i).SISUserID == 109087318
% %                 fprintf('breaking\n');
% %             end
%             fprintf('Name: %s \n',list(i).Student)
%             fprintf('student_id: %d, match found\n',list(i).SISUserID)
%             fprintf('Relative error: %0.5f \n',evals(j,2));
%             if abs(evals(j,2)) < tol
%                 score = 4;
%             else
%                 score = 1; %input('Enter assignment score:  ')
%             end
%             if  comments(j,1) == 0
%                 score = score - 0.5;
%                 fprintf('Deduction for missing comments \n')
%             end
%             fprintf('score = %d \n',score)
%             if rand < 0.5
%                 if os == 0
%                     look_str = sprintf('notepad++ %s',d(j).name);
%                     %% linux
%                 else
%                     look_str = sprintf('gedit %s',d(j).name);
%                 end
%                 %                system(look_str);
%             end
%             break %found student, leave
%         end     
%     end
%     if score == 0
%         fprintf('Name: %s \n',list(i).Student)
%         fprintf('Student_id: %d , No matching file found \n\n',list(i).SISUserID)
%         fprintf('score = %d \n',score)
%         %% windows
%         if os == 0
%             findstr_id = sprintf('findstr %d *.m',list(i).SISUserID);
%             [~,cmdout] = system(findstr_id);
%             fprintf('findstr finds : %s \n',cmdout);
%         else
%             %% linux
%             grep_id = sprintf('grep %d *.m',list(i).SISUserID);
%             [~,cmdout] = system(grep_id);
%             fprintf('grep finds : %s \n',cmdout)
%         end
%     end
%     list(i).score = score;
% end  %for i
% 
% 
% %%% print csv
% fprintf('\n\n******************************\n')
% fprintf('***** Printing Grades ********\n\n')
% fprintf('student_id,name,score\n')
% for i = 1:length(list)
%     fprintf('%d,%s,%0.1f\n',list(i).SISUserID,list(i).Student,list(i).score)
% end
% 
% results = list;



end
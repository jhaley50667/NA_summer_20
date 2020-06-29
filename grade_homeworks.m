function [results] = grade_homeworks(list, varargin)
% function [results] = homeworks(prefix, answer)
% returns evaluations of programming assignments
% inputs:
%   list - struct containing student names and student id numbers
%   varargin - optional, can include testing input and expected function
%              output
% output:
%   results  - struct with results of evaluating the functions

%%%% input and expected answer
format shortG
p = 2;
q = 3;
answer = p/q;
tol = 1e-12
%%%% run the functions
for i = 1:6
    fprintf('************** \n')
end
d = dir('*.m');
fprintf('%d files found, %d students on the list \n\n',length(d),length(list));
evals = zeros(length(d),2);
timings = zeros(length(d),1);
comments = zeros(length(d),1);
fprintf('Starting Evaluations of downloaded functions\n\n')
for i = 1:length(d)
    fprintf('**********************\n');
    fprintf('****** file %d *******\n',i);
    fstr = d(i).name(1:end-2);
    try
        tic
        [u,v] = feval(fstr,p,q);
        timings(i,1) = toc;
        evals(i,1) = u;
        evals(i,2) = abs(abs(v-answer)/answer);
    catch
        warning('Function Problem, i = %d, function = %s',i,fstr)
        evals(i,2) = -100;
        timings(i,1) = -100;
    end
    %% check for commenting
    %% windows
    %comment_str = sprintf('findstr %s %s','%',d(i).name);
    %% linux
    comment_str = sprintf('grep %s %s','%',d(i).name);
    check_comments = ~system(comment_str);
    if  check_comments > 0
        fprintf('Comments found \n')
        comments(i,1) = 1;
    else
        fprintf('No comments found \n');
    end
    fprintf('%s:  student_id:%d    relative_error:%0.5f time: %0.4f \n',fstr,evals(i,1),evals(i,2),timings(i,1));
end

%%% assign grades %%%
fprintf('************************\n')
fprintf('************************\n')
fprintf('************************\n\n')
fprintf('Assigning Grades \n')
for i = 1:length(list)
    fprintf('*************** \n')
    for j = 1:length(d)
        score = 0;
        if list(i).SISUserID== evals(j,1)
            fprintf('student_id: %d, match found\n',list(i).SISUserID)
            fprintf('Relative error: %0.5f \n',evals(j,2));
            if abs(evals(j,2)) < tol
                score = 4;
            else
                score = 1; %input('Enter assignment score:  ')
            end
            if  comments(i,1) == 0
                score = score - 0.5;
                fprintf('Deduction for missing comments \n')
            end
            fprintf('score = %d \n',score)
            if rand < 0.7
                %% windows
                 look_str = sprintf('notepad++ %s',d(j).name);
                %% linux
%                 look_str = sprintf('gedit %s',d(j).name);
%                system(look_str);
            end
            break
        end
        
    end
    if score == 0
        fprintf('Student_id: %d , No matching file found \n\n',list(i).SISUserID)
        fprintf('score = %d \n',score)
        %% windows
%         findstr_id = sprintf('findstr %d *.m',list(i).SISUserID);
%         [~,cmdout] = system(findstr_id);
%        fprintf('findstr finds : %s \n',cmdout);
        %% linux
        grep_id = sprintf('grep %d *.m',list(i).SISUserID);
        [~,cmdout] = system(grep_id);
        fprintf('grep finds : %s \n',cmdout)
    end
    list(i).score = score;
end  %for i


%%% print csv
fprintf('\n\n******************************\n')
fprintf('***** Printing Grades ********\n\n')
fprintf('student_id,name,score\n')
for i = 1:length(list)
    fprintf('%d,%s,%0.1f\n',list(i).SISUserID,list(i).Student,list(i).score)
end

results = list;
end % function

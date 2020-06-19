
function [results] = grade_homeworks(list, varargin)
% function [results] = homeworks(prefix, answer)
% returns evaluations of programming assignments
% inputs:
%   list - struct containing student names and student id numbers
%   varargin - optional, can include testing input and expected function
%              output
% output:
%   results  - struct with results of evaluating the functions


os = 1;
%%%% input and expected answer
format shortG
%solve ax^2+bx+c=0
a=2;
b=5;
c=-3;
answer = [-3,0.5];
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
        [s,r1,r2] = feval(fstr,a,b,c);
        v = [r1,r2];
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
        if list(i).SISUserID == evals(j,1)
            fprintf('student_id: %d, match found\n',list(i).SISUserID)
            fprintf('Relative error: %0.5f \n',evals(j,2));
            if abs(evals(j,2)) < tol
                score = 4;
            else
                score = 1; %input('Enter assignment score:  ')
            end
            if  comments(j,1) == 0
                score = score - 0.5;
                fprintf('Deduction for missing comments \n')
            end
            fprintf('score = %d \n',score)
            if rand < 0.7
                if os == 0
                    look_str = sprintf('notepad++ %s',d(j).name);
                    %% linux
                else
                    look_str = sprintf('gedit %s',d(j).name);
                end
                %                system(look_str);
            end
            break
        end
        
    end
    if score == 0
        fprintf('Student_id: %d , No matching file found \n\n',list(i).SISUserID)
        fprintf('score = %d \n',score)
        %% windows
        if os == 0
            findstr_id = sprintf('findstr %d *.m',list(i).SISUserID);
            [~,cmdout] = system(findstr_id);
            fprintf('findstr finds : %s \n',cmdout);
        else
            %% linux
            grep_id = sprintf('grep %d *.m',list(i).SISUserID);
            [~,cmdout] = system(grep_id);
            fprintf('grep finds : %s \n',cmdout)
        end
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

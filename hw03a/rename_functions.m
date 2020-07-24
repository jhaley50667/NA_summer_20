function op_sys = rename_functions()

d = dir('*.m');

%windows: os = 0, linux: os = 1
os = input('Enter 0 for windows, 1 for linux :  ');
%folder for copying to
if ~exist('renamed','dir')
    fprintf('Creating folder for renamed functions\n')
    system('mkdir renamed');
end

for i = 1:length(d)
    hyph = regexp(d(i).name,'-');
    if ~isempty(hyph)
        old_name = d(i).name;
        new_name = old_name;
        new_name(hyph:hyph+1)=[];
        if os == 1
            copy_str = sprintf('cp %s renamed/.',d(i).name);
            rename_str = sprintf('mv %s %s',old_name,new_name);
        else
            copy_str = sprintf('xcopy % renamed',d(i).name);
            rename_str = sprintf('ren %s %s',old_name,new_name);
        end
        system(copy_str);
        system(rename_str);
        %fprintf('old: %s new: %s\n',old_name,new_name)
    end
end
op_sys = os;
end


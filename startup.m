function msg = startup(os)
% adds daily directories to the path
% input: 
%     os - integer 0=windows 1=linux
d = dir('*_*');
for i = 1:length(d)
    if d(i).isdir
        if os == 0
            s = [pwd,'\',d(i).name];
        else
            s = [d(i).folder,'/',d(i).name];
        end
        addpath(s);
    end
end

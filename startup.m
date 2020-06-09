function msg = startup()
% adds daily directories to the path

d = dir('*_*');
for i = 1:length(d)
    if d(i).isdir
       s = [d(i).folder,'/',d(i).name];
       addpath(s)
    end
end

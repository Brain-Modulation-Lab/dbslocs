function [fsroot] = dbs_getrecentfsfolder

% small function determining the location of the fs root directory.
root = dbs_getroot;
load(fullfile(root,'dbs_recentfsfolders.mat'))
fsroot = fullrfs{1};

end
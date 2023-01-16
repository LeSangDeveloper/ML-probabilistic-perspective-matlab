w = which(mfilename()); 
thisDir = fileparts(w);
cd(thisDir);
addpath(thisDir);

include  = @(d)addpath(genpathPMTK(d));
include(fullfile(thisDir,'data'))
include(fullfile(thisDir, 'tools'))
include(fullfile(thisDir, 'toolbox')); 
include(fullfile(thisDir, 'matlabTools')); 
include(fullfile(thisDir, 'pmtksupportCopy')); % may be initially empty
w = which(mfilename()); 
thisDir = fileparts(w);
cd(thisDir);
addpath(thisDir);

include  = @(d)addpath(genpathPMTK(d));
include(fullfile(thisDir, 'toolbox')); % may be initially empty
include(fullfile(thisDir, 'matlabTools')); % may be initially empty
include(fullfile(thisDir, 'pmtksupportCopy')); % may be initially empty
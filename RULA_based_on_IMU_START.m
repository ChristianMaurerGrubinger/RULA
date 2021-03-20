PathName = pwd;
addpath([pwd '\skripts'])

% the following line loads the SPM code from Todd Pataky
% License Information
% spm1d is a package for one-dimensional Statistical Parametric Mapping (SPM). 
% spm1d uses Random Field Theory expectations regarding smooth, one-dimensional 
% (random) Gaussian fields to make statistical inferences regarding a set 
% of 1D measurements.
% Copyright (C) 2016  Todd Pataky
addpath([pwd '\skripts\spm1dmatlab-master'])
PathNameMAT  = [pwd '\data'];

%%
[ConditionTable,Subject_db,Condition_db] = MF_01Conditiontable(PathName,PathNameMAT);

%%

[ConditionTable_loaded,Data,Settings] = MF_02SelectAndRULA(PathName,Condition_db,ConditionTable,Subject_db);
%%
[Summary_table,Smalles_val] = MF_combine_RULA(Data,ConditionTable_loaded);
%%
writetable(Summary_table,'Results.xlsx','Sheet','Results_detail');

%% Damit die histogramme geplottet werden können musst du den Pfat der spm Dateiein includieren.
[Angle_int,Angles,spm_results]  = MF_combine_RULA_hist(Data,ConditionTable_loaded);
% save('Summary_table.mat','Summary_table','Angle_int','Angles','spm_results')

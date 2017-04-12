function dbs_addnormmethods(handles,options,mstr)

if ~exist('mstr','var')
    mstr=''; % no macaque mode
end

% add normalization methods to menu
cnt=1;

dbsroot=dbs_getroot;
ndir=dir([dbsroot,mstr,'dbs_normalize_*.m']);

for nd=length(ndir):-1:1
    [~,methodf]=fileparts(ndir(nd).name);
    try
        [thisndc,spmvers]=eval([methodf,'(','''prompt''',')']);
        if ismember(spm('ver'),spmvers)
        ndc{cnt}=thisndc;
        normmethod{cnt}=methodf;
        if strcmp(ndc{cnt},eval([options.prefs.normalize.default,'(','''prompt''',')']))
         defentry=cnt;
        end
        cnt=cnt+1;
        end
    end
end



try
setappdata(handles.leadfigure,'normmethod',normmethod);
set(handles.normmethod,'String',ndc);
catch
    if isempty(which('spm'))
    warning('It seems that SPM is not installed.');
    end
end
try % set selection of normmethod to default entry (specified in ea_prefs).
    if defentry<=length(get(handles.normmethod,'String'))
        set(handles.normmethod,'Value',defentry);
    end
end
clear defentry
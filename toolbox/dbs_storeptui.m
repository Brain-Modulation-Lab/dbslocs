function dbs_storeptui(handles)

try
chooseptboxname=get(handles.patdir_choosebox,'String');
catch
    return
end

% determine if patientfolder is set
switch chooseptboxname
    case 'Choose Patient Directory'
        outdir=[dbs_getroot];
    otherwise
        if strcmp(chooseptboxname(1:8),'Multiple')
                    outdir=[dbs_getroot];

        else
        outdir=[get(handles.patdir_choosebox,'String'),filesep];
        end
end

try % only works when calling from core dbs
    updatestatus(handles);
end
options=dbs_handles2options(handles);
try save([outdir,'dbs_ui'],'-struct','options'); 
end
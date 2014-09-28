unit Current_Loader;

interface

uses Classes, IBase, Current_Zarplata, Current_Filter, ZProc,
     Controls;

function View_FZCurrent(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_FZCurrent;

implementation

function View_FZCurrent(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZCurrent;
    CurrentFilter:TzCurrentFilter;
begin
if IsMDIChildFormShow(TFZCurrent) then Exit;
with CurrentFilter do
 begin
  Is_Smeta:=False;
  Is_Department:=False;
  Is_Man:=False;
  Is_VidOpl:=False;
  Is_KodSetup:=True;
  Is_OperationsFilter:=True;
  Id_smeta:=0;
  Id_department:=0;
  Id_man:=0;
  Id_VidOpl:=0;
  Kod_Setup1:=0;
  Kod_Setup2:=0;
  FIO:='';
  Name_Smeta:='';
  Name_Department:='';
  Name_VidOpl:='';
  Tn:=0;
  Kod_Smeta:=0;
  Kod_department:='';
  Kod_VidOpl:=0;
 end;
CurrentFilter := ViewFilter(AOwner,DB,CurrentFilter);
if CurrentFilter.ModalResult=mrCancel then Exit;
ViewForm  :=  TFZCurrent.Create(AOwner, DB, CurrentFilter);
end;

end.


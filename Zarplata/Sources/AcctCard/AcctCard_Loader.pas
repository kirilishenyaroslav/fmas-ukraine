unit AcctCard_Loader;

interface

uses Classes, IBase, ZProc, AcctCard_MainForm,
     Controls, AcctCard_Filter;

function View_AcctCard(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE):variant;stdcall;
exports View_AcctCard;

implementation

function View_AcctCard(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE):variant;
var ViewForm:TFZAcctCard_MainForm;
begin
  if IsMDIChildFormShow(TFZAcctCard_MainForm) then Exit;
  ViewForm:=TFZAcctCard_MainForm.Create(AOwner,DB_Handle);
end;

end.

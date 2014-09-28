unit SpPeople_Loader;

interface
uses Classes,IBase, Variants, Controls, SpPeople_MainForm, SpPeople_ModForm, SpPeople_Types,
     SpCommon;

  function GetMan(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;MultiSelect:Boolean=False;
                  CanEdit:Boolean=False;Id_Man:Integer=-1):Variant; stdcall;

  procedure ShowSp(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;CanEdit:Boolean=True); stdcall;

  function  ShowManEditForm(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;
                            IdMan:Integer;CanEdit:Boolean=False):Variant; stdcall;

  function GetManForASUP(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;MultiSelect:Boolean=False;
                         CanEdit:Boolean=False;Id_Man:Integer=-1):Variant; stdcall;

  exports GetMan,ShowSp,ShowManEditForm,GetManForASUP;

implementation

function GetMan(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;MultiSelect:Boolean=False;
                  CanEdit:Boolean=False;Id_Man:Integer=-1):Variant;
var SpForm:TfSpPeople;
begin
  SpForm:=TfSpPeople.Create(AOwner,DBHANDLE,CanEdit,True,MultiSelect,Id_Man);
  if SpForm.ShowModal=mrOk then
    Result:=SpForm.ResultArray;
  SpForm.Free;
end;

procedure ShowSp(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;CanEdit:Boolean=True);
var SpForm:TfSpPeople;
begin
  SpForm:=TfSpPeople.Create(AOwner,DBHANDLE,True,False,False);
end;

function  ShowManEditForm(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;
                            IdMan:Integer;CanEdit:Boolean=False):Variant;
var Mode:TEditMode;
begin
  if (CanEdit) then
    Mode:=emModify
  else
    Mode:=EmView;
  ShowModForm(AOwner,DB_HANDLE,Mode,IdMan);
  Result:=Null;
end;

function GetManForASUP(AOwner:TComponent;DBHANDLE:TISC_DB_HANDLE;MultiSelect:Boolean=False;
                         CanEdit:Boolean=False;Id_Man:Integer=-1):Variant;
var SpForm:TfSpPeople;
begin
  SpForm:=TfSpPeople.Create(AOwner,DBHANDLE,CanEdit,True,MultiSelect,Id_Man);
  SpForm.Timer1.Interval:=1;
  SpForm.SearchBtn.Visible:=True;
  SpForm.SearchPanel.Align:=alTop;
  if SpForm.ShowModal=mrOk then
    Result:=SpForm.ResultArray;
  SpForm.Free;
end;

end.

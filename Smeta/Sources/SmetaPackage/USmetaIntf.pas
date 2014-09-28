unit USmetaIntf;

interface

uses Classes, Ibase, Forms, GlobalSpr, USprSmeta, Variants, UEditSmet, UGetSmPeriods;


procedure GL_WIZARDInsertBudget(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;Id_User:Integer);stdcall;
function GL_WIZARD_GetPlan(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime;Filter:TSmetaFilterValues;Id_User:Integer):Variant;stdcall;
function GetSprMdi(AOwner: TComponent;DBHandle: TISC_DB_HANDLE; FS: TFormStyle; Book_Date: TDateTime;Filter:TSmetaFilterValues;Id_User:Integer):integer;stdcall;
function GetSprModal(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime;Filter:TSmetaFilterValues;Id_User:Integer):Variant;stdcall;
function GL_WIZARD_GetSmPeriod(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;Id_User:Integer;Id_smeta:Int64):Variant;stdcall;
function GL_WIZARD_CreateNewSmPlan(AOwner:TComponent;DBHandle:TISC_DB_Handle;Id_smeta:Int64;id_user:Int64):Variant;stdcall;

exports GetSprMdi,
        GetSprModal,
        GetSmGrp,
        GL_WIZARDInsertBudget,
        GL_WIZARD_GetPlan,
        GL_WIZARD_GetSmPeriod,
        GL_WIZARD_CreateNewSmPlan;

implementation

procedure GL_WIZARDInsertBudget(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;Id_User:Integer);
begin
     with TfrmEditSmet.Create(AOwner,
                              DBHandle,
                              nil,
                              nil,
                              Id_User,
                              nil,
                              true,
                              false) do
     begin
           ShowModal;
           Free;
     end
end;

function GetSprModal(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime;Filter:TSmetaFilterValues;Id_User:Integer):Variant;stdcall;
var T:TfrmSmetaSpr;
    Res:Variant;
begin
    Res:=null;
    T:=TfrmSmetaSpr.Create(AOwner,DBHandle,FSNormal,Book_Date,Filter,Id_user,false);
    T.DockPanelGrid.Hide;
    T.ShowModal;
    Res:=T.ResultValue;
    T.Free;
    GetSprModal:=Res;
end;

function GetSprMdi(AOwner: TComponent;DBHandle: TISC_DB_HANDLE; FS: TFormStyle; Book_Date: TDateTime;Filter:TSmetaFilterValues;Id_User:Integer):integer;stdcall;
begin
     TfrmSmetaSpr.Create(AOwner,DBHandle,FSMdiChild,Book_Date,Filter,Id_User, true);
     Result:=0;
end;

function GL_WIZARD_GetPlan(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Book_Date:TDateTime;Filter:TSmetaFilterValues;Id_User:Integer):Variant;stdcall;
var Res:Variant;
begin
      Res:=null;

      with TfrmSmetaSpr.Create(AOwner,DBHandle,FSNormal,Book_Date,Filter,Id_user,False, true) do
      begin
           ShowModal;
           Res:=ResultValue;
           Free;
      end;

      GL_WIZARD_GetPlan:=Res;
end;

function GL_WIZARD_GetSmPeriod(AOwner: TComponent; DBHandle:TISC_DB_HANDLE;Id_User:Integer;Id_smeta:Int64):Variant;stdcall;
var Res:Variant;
begin
     Res:=Null;
     with TfrmSmPeriods.Create(AOwner,DBHandle,Id_User,id_smeta) do
     begin
          ShowModal;
          Res:=ResultValue;
          Free;
     end;
     GL_WIZARD_GetSmPeriod:=RES;
end;

function GL_WIZARD_CreateNewSmPlan(AOwner:TComponent;DBHandle:TISC_DB_Handle;Id_smeta:Int64;id_user:Int64):Variant;
begin
     Result:=Null;
end;


end.

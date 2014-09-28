unit SpTuTemplet_Loader;

interface
uses iBase,Classes,SpTuTemplet_MainForm,Controls,Variants,TuCommonLoader,Forms,TuCommonTypes,
       SpTuTemplet_DM;



function View_TuSpTemplet(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE; KodSetup:variant;tuFormStyle:TtuFormStyle;AidTemplate:variant ):Variant; stdcall;
 exports View_TuSpTemplet;
implementation


function View_TuSpTemplet(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE; KodSetup:variant;tuFormStyle:TtuFormStyle; AidTemplate:variant):Variant; stdcall;
var     DM:TDM;
    Form: TFormTemplet_Main;
begin
  DM:=TDM.Create(AOwner);
  DM.DB.Handle:=ADB_Handle;
  Form:= TFormTemplet_Main.Create(AOwner,DM, KodSetup,tuFormStyle, AidTemplate);
  if (tuFormStyle=tfsModal) or (tuFormStyle=tfsModalParent) then
  begin
    Form.FormStyle:=fsNormal;
    Form.Visible:=false;
    if Form.ShowModal=mrYes then
    Result:=Form.Res;
    Dm.Free;
    DM:=nil;
  end
  else
  begin
    Form.WindowState:=wsMaximized;
    Form.Show;
   end;

  end;
{ TTuTemplet }


{ TTuTemplet }


end.

unit cn_Roles_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxTextEdit, cxButtons, cxLabel,
  cxContainer, cxEdit, cxMaskEdit, cxButtonEdit, cxControls, cxGroupBox,
  Ibase, cnConsts, cn_DM_Roles, cn_Common_Funcs, cnConsts_Messages, GlobalSPR;

type
  TfrmAddEdit = class(TForm)
    GroupBox: TcxGroupBox;
    Smeta_Edit: TcxButtonEdit;
    Smeta_Label: TcxLabel;
    Smeta_description_Label: TcxLabel;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    TextEdit: TcxTextEdit;
    Group_Label: TLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure Smeta_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Smeta_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Smeta_EditKeyPress(Sender: TObject; var Key: Char);
  private
    PLanguageIndex: byte;
    DB_sp_Handle : TISC_DB_HANDLE;
    procedure FormIniLanguage;
  public
    ID_SMET : int64;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE; Li : byte);reintroduce;
  end;



implementation

{$R *.dfm}
     constructor  TfrmAddEdit.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE; Li : byte);
     begin
      Screen.Cursor:=crHourGlass;
      PLanguageIndex := Li;
      DB_sp_Handle := DB_Handle;
      inherited Create(AOwner);
      FormIniLanguage;
      Screen.Cursor:=crDefault;
     end;

procedure TfrmAddEdit.FormIniLanguage;
begin
 Group_Label.Caption :=    cnConsts.cn_roles_Group[PLanguageIndex];
 Smeta_Label.Caption:=     cnConsts.cn_Smeta[PLanguageIndex];
 OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
 CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure TfrmAddEdit.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmAddEdit.OKButtonClick(Sender: TObject);
begin
 if not cn_Common_Funcs.IntegerCheck(Smeta_Edit.Text) then begin
  ShowMessage(cnConsts_Messages.cn_warningVvod_Smeta[PLanguageIndex]);
  Smeta_description_Label.Clear;
  Smeta_description_Label.Visible:=false;
  Smeta_Edit.SetFocus;
  exit;
 end;
ModalResult:= MrOk;
end;

procedure TfrmAddEdit.Smeta_EditPropertiesEditValueChanged(
  Sender: TObject);
  var
       DM:TDM_ROLES;
       kav : string;
       CurrentDate : TDateTime;
  begin

if Smeta_Edit.Text= '' then exit;
 if not cn_Common_Funcs.IntegerCheck(Smeta_Edit.Text) then begin
  ShowMessage(cnConsts_Messages.cn_warningVvod_Smeta[PLanguageIndex]);
  Smeta_description_Label.Clear;
  Smeta_description_Label.Visible:=false;
  Smeta_Edit.SetFocus;
  exit;
 end;

kav := '''';
   DM:=TDM_ROLES.Create(Self);
   DM.DB.Handle:=DB_sp_Handle;
   DM.StProc.StoredProcName := 'ST_GET_CURRENT_DATE';
   DM.StProc.Transaction.StartTransaction;
   DM.StProc.Prepare;
   DM.StProc.ExecProc;
   CurrentDate := DM.StProc.ParamByName('CUR_DATE').AsDateTime;
   DM.StProc.Transaction.Commit;

 DM.ReadDataSet.SQLs.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+Smeta_Edit.Text+','+kav+ datetostr(CurrentDate)+kav+',' +'1)';
 DM.DB.Handle:=DB_sp_Handle;
 DM.ReadDataSet.Open;

  if DM.ReadDataSet['ID_OBJECT']<> null then begin
  ID_SMET  := DM.ReadDataSet['ID_OBJECT'];
 if DM.ReadDataSet['TITLE_OBJECT']<> null then begin
  Smeta_description_Label.Caption:= DM.ReadDataSet['TITLE_OBJECT'];
  Smeta_description_Label.Visible:=true;
  end
  else begin
  Smeta_description_Label.Clear;
  Smeta_description_Label.Visible:=false;
  end
 end
 else begin
  ShowMessage(cnConsts_Messages.cn_warningVvod_Smeta[PLanguageIndex]);
  Smeta_description_Label.Clear;
  Smeta_description_Label.Visible:=false;
  Smeta_Edit.SetFocus;
  DM.ReadDataSet.close;
  DM.Free;
  exit;
 end;

 DM.ReadDataSet.close;
 DM.Free;
end;

procedure TfrmAddEdit.Smeta_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
  DM:TDM_ROLES;
  CurrentDate : TDateTime;
begin
   DM:=TDM_ROLES.Create(Self);
   DM.DB.Handle:=DB_sp_Handle;
   DM.StProc.StoredProcName := 'ST_GET_CURRENT_DATE';
   DM.StProc.Transaction.StartTransaction;
   DM.StProc.Prepare;
   DM.StProc.ExecProc;
   CurrentDate := DM.StProc.ParamByName('CUR_DATE').AsDateTime;
   DM.StProc.Transaction.Commit;

    id:=GlobalSPR.GetSmets(self,DB_sp_Handle,CurrentDate,psmSmet);
    if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
    then begin
     if id[0]<>NULL
     then begin
      ID_SMET  := id[0];
     Smeta_Edit.Text:=vartostr(id[3]);
     Smeta_description_Label.Caption:=vartostr(id[2]);
     Smeta_description_Label.Visible:=true;
     end;
   end;
end;

procedure TfrmAddEdit.Smeta_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then OKButton.SetFocus;
end;

end.

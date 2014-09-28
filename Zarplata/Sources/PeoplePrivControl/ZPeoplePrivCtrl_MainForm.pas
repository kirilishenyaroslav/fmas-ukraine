unit ZPeoplePrivCtrl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  cxSpinEdit, FIBQuery, pFIBQuery, pFIBStoredProc, Unit_ZGlobal_Consts,
  ActnList, zProc, zMessages, zPeoplePrivCtrl_DM;

type
  TFZPeoplePrivControl = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    BoxOptions: TcxGroupBox;
    EditDateEnd: TcxDateEdit;
    EditDateBeg: TcxDateEdit;
    DateBegLabel: TcxLabel;
    DateEndLabel: TcxLabel;
    LabelAmountPriv: TcxLabel;
    BoxMan: TcxGroupBox;
    EditMan: TcxButtonEdit;
    LabelMan: TcxLabel;
    BoxPriv: TcxGroupBox;
    LabelPrivilege: TcxLabel;
    EditPrivilege: TcxButtonEdit;
    SpinEditPrivAmount: TcxSpinEdit;
    Actions: TActionList;
    Action1: TAction;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditPrivilegePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    PId_man:LongWord;
    PId_Priv:Integer;
    PParameter:TZPeoplePrivParameters;
    PResault:Variant;
    PLanguageIndex:Byte;
    DM:TDM_Ctrl;
  public
    constructor Create(AOwner:TComponent;ComeDB:TISC_DB_HANDLE;AParameter:TZPeoplePrivParameters);reintroduce;
    property Resault:Variant read PResault;
  end;

implementation

uses VarConv;

{$R *.dfm}

constructor TFZPeoplePrivControl.Create(AOwner: TComponent;ComeDB:TISC_DB_HANDLE;AParameter:TZPeoplePrivParameters);
begin
 inherited Create(AOwner);
 PParameter:=AParameter;
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 YesBtn.Caption               := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption            := CancelBtn_Caption[PLanguageIndex];
 LabelMan.Caption             := LabelMan_Caption[PLanguageIndex];
 LabelPrivilege.Caption       := LabelPrivilege_Caption[PLanguageIndex];
 LabelAmountPriv.Caption      := LabelExpense_Caption[PLanguageIndex];
 DateBegLabel.Caption         := LabelDateBeg_Caption[PLanguageIndex]+' - ';
 DateEndLabel.Caption         := ' - '+AnsiLowerCase(LabelDateEnd_Caption[PLanguageIndex]);
//******************************************************************************
 self.EditDateEnd.Date        := date;
 self.EditDateBeg.Date        := date;
//******************************************************************************
 DM:=TDM_Ctrl.Create(self);
//******************************************************************************
 case AParameter.TypeId of
  zppctIdPeoplePriv: DM.DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_PEOPLE_PRIV_SELECTONE('+IntToStr(AParameter.ID)+',2)';
  zppctIdPeople: DM.DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_PEOPLE_PRIV_SELECTONE('+IntToStr(AParameter.ID)+',1)';
 end;
 IF AParameter.TypeId<>zppctNULL then
  begin
   DM.DataBase.Handle:=ComeDB;
   DM.DSet.Open;
   if not VarIsNULL(DM.DSet['FIO']) then
    begin
     PId_man := DM.DSet['ID_MAN'];
     EditMan.Text := VarToStr(DM.DSet['TN'])+' - '+VarTostr(DM.DSet['FIO']);
    end;
   if not VarIsNull(DM.DSet['NAME_PRIV']) then
    begin
     PId_Priv := DM.DSet['ID_PRIV'];
     EditPrivilege.Text := VarToStr(DM.DSet['KOD_PRIV'])+' - '+VarToStr(DM.DSet['NAME_PRIV']);
    end;
   if not VarIsNull(DM.DSet['EXPENSE']) then SpinEditPrivAmount.Value := DM.DSet['EXPENSE'];
   if not VarIsNull(DM.DSet['MIN_AMOUNT_PRIV']) then
      SpinEditPrivAmount.Properties.MinValue := DM.DSet['MIN_AMOUNT_PRIV'];
   if not VarIsNull(DM.DSet['MAX_AMOUNT_PRIV']) then
      SpinEditPrivAmount.Properties.MaxValue := DM.DSet['MAX_AMOUNT_PRIV'];
   if not VarIsNull(DM.DSet['PRIV_DBEG']) then
    begin
      EditDateBeg.Properties.MinDate := VarToDateTime(DM.DSet['PRIV_DBEG']);
      EditDateEnd.Properties.MinDate := VarToDateTime(DM.DSet['PRIV_DBEG']);
      EditDateBeg.Date := VarToDateTime(DM.DSet['PRIV_DBEG']);
    end;
   if not VarIsNull(DM.DSet['PRIV_DEND']) then
    begin
      EditDateBeg.Properties.MaxDate := VarToDateTime(DM.DSet.FieldValues['PRIV_DEND']);
      //EditDateEnd.Properties.MaxDate := VarToDateTime(DM.DSet.FieldValues['PRIV_DEND']);
      EditDateEnd.Date := VarToDateTime(DM.DSet['PRIV_DEND']);
    end;
   if (not VarIsNull(DM.DSet['MIN_AMOUNT_PRIV'])) and
      (DM.DSet['MAX_AMOUNT_PRIV']=DM.DSet['MIN_AMOUNT_PRIV']) then    begin
     SpinEditPrivAmount.Value := DM.DSet['MIN_AMOUNT_PRIV'];
     SpinEditPrivAmount.Properties.ReadOnly := True;
    end;
   if (not VarIsNull(DM.DSet['PRIV_DBEG'])) and
      (DM.DSet['PRIV_DEND']=DM.DSet['PRIV_DBEG']) then
    begin
     EditDateEnd.Date := VarToDateTime(DM.DSet['PRIV_DEND']);
     EditDateEnd.Properties.ReadOnly := True;
     EditDateBeg.Date := VarToDateTime(DM.DSet['PRIV_DBEG']);
     EditDateBeg.Properties.ReadOnly := True;
    end;
   case AParameter.ControlFormStyle of
    zcfsInsert:
     begin
      BoxMan.Enabled := False;
      Caption := ZPeoplePrivCtrl_Caption_Insert[PLanguageIndex];
     end;
    zcfsUpdate:
     begin
      BoxMan.Enabled := False;
      BoxOptions.Enabled := True;
      Caption        := ZPeoplePrivCtrl_Caption_Update[PLanguageIndex];
      if not VarIsNull(DM.DSet['DATE_BEG']) then
         EditDateBeg.Date := VarToDateTime(DM.DSet['DATE_BEG']);
      if not VarIsNull(DM.DSet['DATE_END']) then
         EditDateEnd.Date := VarToDateTime(DM.DSet['DATE_END']);
     end;
    zcfsShowDetails:
     begin
      BoxOptions.Enabled := False;
      BoxMan.Enabled     := False;
      BoxPriv.Enabled    := False;
      YesBtn.Visible     := False;
      CancelBtn.Caption  := ExitBtn_Caption[PLanguageIndex];
      Caption            := ZPeoplePrivCtrl_Caption_Detail[PLanguageIndex];
     end;
   end;
  end;
end;

procedure TFZPeoplePrivControl.CancelBtnClick(Sender: TObject);
begin
ModalResult  := mrCancel;
end;

procedure TFZPeoplePrivControl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if DM.DefaultTransaction.Active then DM.DefaultTransaction.Commit;
end;

procedure TFZPeoplePrivControl.EditManPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Man:Variant;
begin
Man:=LoadPeopleModal(self,DM.DataBase.Handle);
if VarArrayDimCount(Man)> 0 then
 if Man[0]<>NULL then
  begin
   EditMan.Text  := Man[1]+' '+Man[2]+' '+Man[3];
   PId_Man       := Man[0];
  end;
end;

procedure TFZPeoplePrivControl.EditPrivilegePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Privilege:Variant;
begin
Privilege:=LoadPrivileges(self,DM.DataBase.Handle,zfsModal);
if VarArrayDimCount(Privilege)> 0 then
 if Privilege[0]<>NULL then
  begin
   EditPrivilege.Text := Privilege[1];
   PId_Priv           := Privilege[0];
   if Privilege[2]=Privilege[3] then
    begin
     SpinEditPrivAmount.Value := Privilege[2];
     SpinEditPrivAmount.Properties.ReadOnly := True;
    end
   else
    begin
     SpinEditPrivAmount.Properties.MaxValue := Privilege[3];
     SpinEditPrivAmount.Value := Privilege[2];
     SpinEditPrivAmount.Properties.MinValue := Privilege[2];
     SpinEditPrivAmount.Properties.ReadOnly := False;
    end;
   if Privilege[4]=Privilege[5] then
    begin
     EditDateEnd.Date := VarToDateTime(Privilege[4]);
     EditDateBeg.Date := VarToDateTime(Privilege[4]);
     EditDateEnd.Properties.ReadOnly := True;
     EditDateBeg.Properties.ReadOnly := True;
    end
   else
    begin
     EditDateEnd.Properties.MaxDate  := VarToDateTime(Privilege[5]);
     EditDateEnd.Properties.MinDate  := VarToDateTime(Privilege[4]);
     EditDateBeg.Properties.MaxDate  := VarToDateTime(Privilege[5]);
     EditDateBeg.Properties.MinDate  := VarToDateTime(Privilege[4]);
     EditDateEnd.Properties.ReadOnly := False;
     EditDateBeg.Properties.ReadOnly := False;
    end;
   BoxOptions.Enabled := True;
  end;
end;

procedure TFZPeoplePrivControl.FormCreate(Sender: TObject);
begin
if PParameter.ControlFormStyle=zcfsDelete then
 begin
 if ZShowMessage(ZPeoplePrivCtrl_Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
  with DM do
  try
   StoredProc.Database := DataBase;
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName := 'Z_PEOPLE_PRIV_D';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_PEOPLE_PRIV').AsInteger := PParameter.ID;
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
   ModalResult:=mrYes;
  except
   on e:exception do
    begin
     ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
     StoredProc.Transaction.Rollback;
    end;
  end
 else
  ModalResult:=mrCancel;
  Exit;
 end;
end;

procedure TFZPeoplePrivControl.Action1Execute(Sender: TObject);
begin
If EditMan.Text = '' then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ManInput_ErrorText[PLanguageIndex],mtWarning,[mbOK]);
  if BoxMan.Enabled then EditMan.SetFocus;
  Exit;
 end;
If EditPrivilege.Text = '' then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputPrivilege_Error_Text[PLanguageIndex],mtWarning,[mbOK]);
  if BoxPriv.Enabled then EditPrivilege.SetFocus;
  Exit;
 end;
If (SpinEditPrivAmount.Text = '') or (SpinEditPrivAmount.Value=0) then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputExpense_Error_Text[PLanguageIndex],mtWarning,[mbOK]);
  if BoxOptions.Enabled then SpinEditPrivAmount.SetFocus;
  Exit;
 end;
if EditDateEnd.Date < EditDateBeg.Date then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputTerms_ErrorText[PLanguageIndex],mtWarning,[mbOK]);
  if BoxPriv.Enabled then EditDateBeg.SetFocus;
  Exit;
 end;

case PParameter.ControlFormStyle of
 zcfsInsert:
  with DM do
  try
   StoredProc.Database := DataBase;
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName := 'Z_PEOPLE_PRIV_I';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_PEOPLE').AsInteger := PId_man;
   StoredProc.ParamByName('ID_PRIV').AsInteger   := PId_Priv;
   StoredProc.ParamByName('DATE_BEG').AsDate     := StrToDate(EditDateBeg.Text);
   StoredProc.ParamByName('DATE_END').AsDate     := StrToDate(EditDateEnd.Text);
   StoredProc.ParamByName('EXPENSE').AsInteger   := SpinEditPrivAmount.Value;
   StoredProc.ExecProc;
   PResault := StoredProc.ParamByName('ID_PEOPLE_PRIV').AsInteger;
   StoredProc.Transaction.Commit;
   ModalResult:=mrYes;
  except
   on e:exception do
    begin
     ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
     StoredProc.Transaction.Rollback;
    end;
   end;
 zcfsUpdate:
  with DM do
  try
   StoredProc.Database := DataBase;
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName := 'Z_PEOPLE_PRIV_U';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_PEOPLE_PRIV').AsInteger := PParameter.ID;
   StoredProc.ParamByName('ID_PEOPLE').AsInteger := PId_man;
   StoredProc.ParamByName('ID_PRIV').AsInteger   := PId_Priv;
   StoredProc.ParamByName('DATE_BEG').AsDate     := StrToDate(EditDateBeg.Text);
   StoredProc.ParamByName('DATE_END').AsDate     := StrToDate(EditDateEnd.Text);
   StoredProc.ParamByName('EXPENSE').AsInteger   := SpinEditPrivAmount.Value;
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
   ModalResult:=mrYes;
  except
   on e:exception do
    begin
     ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
     StoredProc.Transaction.Rollback;
    end;
  end;
end;
end;

procedure TFZPeoplePrivControl.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

end.

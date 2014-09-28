unit ZPeoplePrivControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  cxSpinEdit, FIBQuery, pFIBQuery, pFIBStoredProc, Unit_ZGlobal_Consts,
  ActnList, zProc, zMessages;

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
    DataBase: TpFIBDatabase;
    DSet: TpFIBDataSet;
    DefaultTransaction: TpFIBTransaction;
    DSource: TDataSource;
    BoxMan: TcxGroupBox;
    EditMan: TcxButtonEdit;
    LabelMan: TcxLabel;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
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
  private
    PId_man:LongWord;
    PId_Priv:Integer;
    PParameter:TZPeoplePrivParameters;
    PResault:Variant;
    PLanguageIndex:Byte;
  public
    constructor Create(AOwner:TComponent;ComeDB:TISC_DB_HANDLE;AParameter:TZPeoplePrivParameters);reintroduce;
    property Resault:Variant read PResault;
  end;

function View_FZPeoplePrivControl(AOwner:TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeoplePrivParameters):Variant; stdcall;
exports View_FZPeoplePrivControl;

implementation

uses VarConv;

{$R *.dfm}

function View_FZPeoplePrivControl(AOwner : TComponent;DB:TISC_DB_HANDLE;AParameter:TZPeoplePrivParameters):Variant; stdcall;
var ViewForm:TFZPeoplePrivControl;
    Res:variant;
begin
ViewForm := TFZPeoplePrivControl.Create(AOwner,DB,AParameter);
if ViewForm.ModalResult=mrNone then
   ViewForm.ShowModal;
If AParameter.ControlFormStyle=zcfsInsert then
 begin
  Res:=VarArrayCreate([0,1],varVariant);
  Res[1]:=ViewForm.Resault;
 end
else
 Res:=VarArrayCreate([0,0],varVariant);
res[0]:=ViewForm.ModalResult;
ViewForm.Free;
View_FZPeoplePrivControl:=Res;
end;

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
 DateBegLabel.Caption         := LabelDateBeg_Caption[PLanguageIndex];
 DateEndLabel.Caption         := LabelDateEnd_Caption[PLanguageIndex];
//******************************************************************************
 self.EditDateEnd.Date        := date;
 self.EditDateBeg.Date        := date;
//******************************************************************************
 case AParameter.TypeId of
  zppctIdPeoplePriv: DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_PEOPLE_PRIV_SELECTONE('+IntToStr(AParameter.ID)+',2)';
  zppctIdPeople: DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_PEOPLE_PRIV_SELECTONE('+IntToStr(AParameter.ID)+',1)';
 end;
 IF AParameter.TypeId<>zppctNULL then
  begin
   DataBase.Handle:=ComeDB;
   DSet.Open;
   if DSet.FieldValues['FIO']<>NULL then
    begin
     PId_man := DSet.FieldValues['ID_PEOPLE'];
     EditMan.Text := varTostr(DSet.FieldValues['FIO']);
    end;
   if DSet.FieldValues['NAME_PRIV']<>NULL then
    begin
     PId_Priv := DSet.FieldValues['ID_PRIV'];
     EditPrivilege.Text := VarToStr(DSet.FieldValues['NAME_PRIV']);
    end;
   if DSet.FieldValues['EXPENSE']<>NULL then SpinEditPrivAmount.Value := DSet.FieldValues['EXPENSE'];
   if DSet.FieldValues['MIN_AMOUNT_PRIV']<>NULL then
      SpinEditPrivAmount.Properties.MinValue := DSet.FieldValues['MIN_AMOUNT_PRIV'];
   if DSet.FieldValues['MAX_AMOUNT_PRIV']<>NULL then
      SpinEditPrivAmount.Properties.MaxValue := DSet.FieldValues['MAX_AMOUNT_PRIV'];
   if DSet.FieldValues['DATE_BEG']<>NULL then
      EditDateBeg.Date := VarToDateTime(DSet.FieldValues['DATE_BEG']);
   if DSet.FieldValues['DATE_END']<>NULL then
      EditDateEnd.Date := VarToDateTime(DSet.FieldValues['DATE_END']);
   if DSet.FieldValues['PRIV_DBEG']<>NULL then
    begin
      EditDateBeg.Properties.MinDate := VarToDateTime(DSet.FieldValues['PRIV_DBEG']);
      EditDateEnd.Properties.MinDate := VarToDateTime(DSet.FieldValues['PRIV_DBEG']);
    end;
   if DSet.FieldValues['PRIV_DEND']<>NULL then
    begin
      EditDateBeg.Properties.MaxDate := VarToDateTime(DSet.FieldValues['PRIV_DEND']);
      EditDateEnd.Properties.MaxDate := VarToDateTime(DSet.FieldValues['PRIV_DEND']);
    end;
   if (DSet.FieldValues['MIN_AMOUNT_PRIV']<>NULL) and
      (DSet.FieldValues['MAX_AMOUNT_PRIV']=DSet.FieldValues['MIN_AMOUNT_PRIV']) then
    begin
     SpinEditPrivAmount.Value := DSet.FieldValues['MIN_AMOUNT_PRIV'];
     SpinEditPrivAmount.Properties.ReadOnly := True;
    end;
   if (DSet.FieldValues['PRIV_DBEG']<>NULL) and
      (DSet.FieldValues['PRIV_DEND']=DSet.FieldValues['PRIV_DBEG']) then
    begin
     EditDateEnd.Date := VarToDateTime(DSet.FieldValues['PRIV_DEND']);
     EditDateEnd.Properties.ReadOnly := True;
     EditDateBeg.Date := VarToDateTime(DSet.FieldValues['PRIV_DBEG']);
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
if DefaultTransaction.Active then DefaultTransaction.Commit;
end;

procedure TFZPeoplePrivControl.EditManPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Man:Variant;
begin
Man:=LoadPeopleModal(self,DataBase.Handle);
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
Privilege:=LoadPrivileges(self,DataBase.Handle,zfsModal);
if VarArrayDimCount(Privilege)> 0 then
 if Privilege[0]<>NULL then
  begin
   EditPrivilege.Text := Privilege[1];
   PId_Priv           := Privilege[0];
{   ShowMessage(VarToStr(Privilege[0])+#13+
               VarToStr(Privilege[1])+#13+
               VarToStr(Privilege[2])+#13+
               VarToStr(Privilege[3])+#13+
               VarToStr(Privilege[4])+#13+
               VarToStr(Privilege[5]));}
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
  try
   StoredProc.Database := DataBase;
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName := 'Z_PEOPLE_PRIV_I';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_PEOPLE').AsInteger := PId_man;
   StoredProc.ParamByName('ID_PRIV').AsInteger   := PId_Priv;
   StoredProc.ParamByName('DATE_BEG').AsDate     := EditDateBeg.Date;
   StoredProc.ParamByName('DATE_END').AsDate     := EditDateEnd.Date;
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
  try
   StoredProc.Database := DataBase;
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName := 'Z_PEOPLE_PRIV_U';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_PEOPLE_PRIV').AsInteger := PParameter.ID;
   StoredProc.ParamByName('ID_PEOPLE').AsInteger := PId_man;
   StoredProc.ParamByName('ID_PRIV').AsInteger   := PId_Priv;
   StoredProc.ParamByName('DATE_BEG').AsDate     := EditDateBeg.Date;
   StoredProc.ParamByName('DATE_END').AsDate     := EditDateEnd.Date;
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

end.

unit AlimonyCtrl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxDropDownEdit,
  cxCalendar, cxSpinEdit, cxTextEdit, cxMaskEdit, cxContainer, cxEdit,
  cxLabel, ExtCtrls, cxControls, cxGroupBox, cxButtonEdit, Kernel,
  Unit_ZGlobal_Consts, IBase, PackageLoad, FIBQuery, pFIBQuery,ZTypes,
  pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  ZMessages, ActnList, AlimonyCtrl_DM, zProc;

type
  TFAlimonyControl = class(TForm)
    IdentificationBox: TcxGroupBox;
    PeopleLabel: TcxLabel;
    OptionsBox: TcxGroupBox;
    Bevel2: TBevel;
    MaxPercentLabel: TcxLabel;
    PercentLabel: TcxLabel;
    PochtaPercentLabel: TcxLabel;
    PochtaPercentEdit: TcxMaskEdit;
    PeriodBox: TcxGroupBox;
    DateEnd: TcxDateEdit;
    DateBeg: TcxDateEdit;
    DateBegLabel: TcxLabel;
    DateEndLabel: TcxLabel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    maxPercentEdit: TcxMaskEdit;
    PercentEdit: TcxMaskEdit;
    SendBox: TcxGroupBox;
    Bevel3: TBevel;
    SendPeopleLabel: TcxLabel;
    SendAdressLabel: TcxLabel;
    SendPeopleEdit: TcxMaskEdit;
    SendAdressEdit: TcxMaskEdit;
    PeopleEdit: TcxButtonEdit;
    DolgEdit: TcxMaskEdit;
    Bevel4: TBevel;
    DolgLabel: TcxLabel;
    DocumentEdit: TcxMaskEdit;
    DocumentLabel: TcxLabel;
    Bevel1: TBevel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    procedure CancelBtnClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
    PParameter:TZAlimonyParameters;
    DM:TDM_Ctrl;
    PLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AParameter:TZAlimonyParameters);reintroduce;
    property Parameter:TZAlimonyParameters read PParameter;
  end;


implementation

{$R *.dfm}

constructor TFAlimonyControl.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AParameter:TZAlimonyParameters);
var RecInfo:RECORD_INFO_STRUCTURE;
    DecimalSeparator:string;
begin
 inherited Create(AOwner);
 PParameter:=AParameter;
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 PeopleLabel.Caption:=LabelMan_Caption[PLanguageIndex];
 DocumentLabel.Caption:=LabelDocument_Caption[PLanguageIndex];
 MaxPercentLabel.Caption:=LabelMaxPercent_Caption[PLanguageIndex];
 PercentLabel.Caption:=LabelPercent_Caption[PLanguageIndex];
 PochtaPercentLabel.Caption:=LabelPochtaPercent_Caption[PLanguageIndex];
 DateBegLabel.Caption:=LabelDateBeg_Caption[PLanguageIndex];
 DateEndLabel.Caption:=LabelDateEnd_Caption[PLanguageIndex];
 SendPeopleLabel.Caption:=LabelSender_Caption[PLanguageIndex];
 SendAdressLabel.Caption:=LabelAdress_Caption[PLanguageIndex];
 DolgLabel.Caption:=LabelDolg_Caption[PLanguageIndex];
 YesBtn.Caption:=YesBtn_Caption[PLanguageIndex];
//******************************************************************************
//100,00 | \d\d? ([,]\d\d?)?
 DecimalSeparator := ZSystemDecimalSeparator;
 DolgEdit.Properties.EditMask := '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+DecimalSeparator+']\d\d?)?';
 maxPercentEdit.Properties.EditMask := '(100 (['+DecimalSeparator+']00?)?) | (\d\d? (['+DecimalSeparator+']\d\d?)?)';
 PercentEdit.Properties.EditMask := '(100 (['+DecimalSeparator+']00?)?) | (\d\d? (['+DecimalSeparator+']\d\d?)?)';
 PochtaPercentEdit.Properties.EditMask := '(100 (['+DecimalSeparator+']00?)?) | (\d\d? (['+DecimalSeparator+']\d\d?)?)';
//******************************************************************************
 DM:=TDM_Ctrl.Create(self,ADB_HANDLE,PParameter);
 DM.DSetData.Open;
 case PParameter.ControlFormStyle of
 zcfsInsert:
  begin
   Caption:=ZAlimonyCtrl_Caption_Insert[PLanguageIndex];
   IdentificationBox.Enabled := False;
   PeopleEdit.Text := VarToStr(dm.DSetData['TN'])+' - '+VarToStr(DM.DSetData['FIO']);
   DateBeg.Date    := VarToDateTime(DM.DSetData['DATE_BEG']);
   DateEnd.Date    := VarToDateTime(DM.DSetData['DATE_END']);
   CancelBtn.Caption:= CancelBtn_Caption[PLanguageIndex];
  end;
 zcfsUpdate:
  begin
   with DM do
    try
     StoredProc.Transaction.StartTransaction;
      RecInfo.TRHANDLE       :=WriteTransaction.Handle;
      RecInfo.DBHANDLE       :=DB.Handle;
      RecInfo.ID_RECORD      :=VarArrayOf([PParameter.ID]);
      RecInfo.PK_FIELD_NAME  :=VarArrayOf(['ID_ALIMONY']);
      RecInfo.TABLE_NAME     :='Z_ALIMONY';
      RecInfo.RAISE_FLAG     :=True;
      LockRecord(@RecInfo);
    except
     on E:exception do
      begin
       ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOk]);
       WriteTransaction.Rollback;
       PParameter.ID := -1;
       Exit;
      end;
    end;
   Caption:=ZAlimonyCtrl_Caption_Update[PLanguageIndex];
   IdentificationBox.Enabled := False;
   PeopleEdit.Text := VarToStr(dm.DSetData['TN'])+' - '+VarToStr(DM.DSetData['FIO']);
   DateBeg.Date    := VarToDateTime(DM.DSetData['DATE_BEG']);
   DateEnd.Date    := VarToDateTime(DM.DSetData['DATE_END']);
   DocumentEdit.Text := VarToStr(DM.DSetData['DOCUMENT']);
   DolgEdit.Text := VarToStr(DM.DSetData['SUMMA_DOLG']);
   maxPercentEdit.Text := VarToStr(DM.DSetData['MAX_PERCENT']);
   PercentEdit.Text  := VarToStr(DM.DSetData['PERCENT']);
   PochtaPercentEdit.Text := VarToStr(DM.DSetData['POCHTA_PERCENT']);
   SendPeopleEdit.Text := VarToStr(DM.DSetData['SEND_PEOPLE']);
   SendAdressEdit.Text := VarToStr(DM.DSetData['SEND_ADRESS']);
   CancelBtn.Caption:= CancelBtn_Caption[PLanguageIndex];
  end;
 zcfsShowDetails:
  begin
   Caption:=ZAlimonyCtrl_Caption_Detail[PLanguageIndex];
   IdentificationBox.Enabled:=False;
   OptionsBox.Enabled:=False;
   PeriodBox.Enabled:=False;
   SendBox.Enabled:=False;
   YesBtn.Visible:=False;
   PeopleEdit.Text := VarToStr(dm.DSetData['TN'])+' - '+VarToStr(DM.DSetData['FIO']);
   DateBeg.Date    := VarToDateTime(DM.DSetData['DATE_BEG']);
   DateEnd.Date    := VarToDateTime(DM.DSetData['DATE_END']);
   DocumentEdit.Text := VarToStr(DM.DSetData['DOCUMENT']);
   DolgEdit.Text := VarToStr(DM.DSetData['SUMMA_DOLG']);
   maxPercentEdit.Text := VarToStr(DM.DSetData['MAX_PERCENT']);
   PercentEdit.Text  := VarToStr(DM.DSetData['PERCENT']);
   PochtaPercentEdit.Text := VarToStr(DM.DSetData['POCHTA_PERCENT']);
   SendPeopleEdit.Text := VarToStr(DM.DSetData['SEND_PEOPLE']);
   SendAdressEdit.Text := VarToStr(DM.DSetData['SEND_ADRESS']);
   CancelBtn.Caption:= ExitBtn_Caption[PLanguageIndex];
  end;
 end;
YesBtn.Hint := YesBtn.Caption;
CancelBtn.Hint := CancelBtn.Caption+' (Esc)';
end;

procedure TFAlimonyControl.CancelBtnClick(Sender: TObject);
begin
 ModalResult          := mrCancel;
end;

procedure TFAlimonyControl.Action1Execute(Sender: TObject);
var TId:Integer;
begin
if DocumentEdit.Text = '' then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputDocument_Error_Text[PLanguageIndex],mtWarning,[mbOk]);
  DocumentEdit.SetFocus;
  exit;
 end;
if DolgEdit.Text = '' then
 begin
  DolgEdit.Text := '0';
{  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputDolg_Error_Text[PLanguageIndex],mtWarning,[mbOk]);
  DolgEdit.SetFocus;
  Exit;}
 end;
If maxPercentEdit.Text = '' then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputMaxPercent_Error_Text[PLanguageIndex],mtWarning,[mbOk]);
  maxPercentEdit.SetFocus;
  Exit;
 end;
if PercentEdit.Text = '' then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputPercent_Error_Text[PLanguageIndex],mtWarning,[mbOk]);
  PercentEdit.SetFocus;
  Exit;
 end;
if PochtaPercentEdit.Text = '' then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputPochtaPercent_Error_Text[PLanguageIndex],mtWarning,[mbOk]);
  PochtaPercentEdit.SetFocus;
  Exit;
 end;
if DateBeg.Date > DateEnd.Date then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputTerms_ErrorText[PLanguageIndex],mtWarning,[mbOk]);
  DateBeg.SetFocus;
  Exit;
 end;
if SendPeopleEdit.Text = '' then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputSender_Error_Text[PLanguageIndex],mtWarning,[mbOk]);
  SendPeopleEdit.SetFocus;
  Exit;
 end;
if SendAdressEdit.Text = '' then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputAddress_Error_Text[PLanguageIndex],mtWarning,[mbOk]);
  SendAdressEdit.SetFocus;
  Exit;
 end;
if StrToFloat(PercentEdit.Text)>StrToFloat(maxPercentEdit.Text) then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputPercents_Error_Text[PLanguageIndex],mtWarning,[mbOK]);
  PercentEdit.SetFocus;
  Exit;
 end;
if StrToFloat(PochtaPercentEdit.Text)>StrToFloat(PercentEdit.Text) then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputPercents_Error_Text[PLanguageIndex],mtWarning,[mbOk]);
  PochtaPercentEdit.SetFocus;
  Exit;
 end;
case PParameter.ControlFormStyle of
 zcfsInsert:
 with DM do
  try
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName                       := 'Z_ALIMONY_INSERT';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_MAN').AsInteger      := PParameter.ID;
   StoredProc.ParamByName('SUMMA_DOLG').AsExtended := StrToFloat(DolgEdit.Text);
   StoredProc.ParamByName('DATE_BEG').AsDate       := DateBeg.Date;
   StoredProc.ParamByName('DATE_END').AsDate       := DateEnd.Date;
   StoredProc.ParamByName('PERCENT').AsFloat       := StrToFloat(PercentEdit.Text);
   StoredProc.ParamByName('MAX_PERCENT').AsFloat   := StrToFloat(maxPercentEdit.Text);
   StoredProc.ParamByName('POCHTA_PERCENT').AsFloat:= StrToFloat(PochtaPercentEdit.Text);
   StoredProc.ParamByName('DOCUMENT').AsString     := DocumentEdit.Text;
   StoredProc.ParamByName('SEND_PEOPLE').AsString  := SendPeopleEdit.Text;
   StoredProc.ParamByName('SEND_ADRESS').AsString  := SendAdressEdit.Text;
   StoredProc.ExecProc;
   TID                                   := StoredProc.ParamByName('ID_ALIMONY').AsInteger;
   StoredProc.Transaction.Commit;
   PParameter.ID := TId;
   ModalResult:=mrYes;
   except
    on E: Exception do
     begin
      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOk]);
      WriteTransaction.Rollback;
     end
   end;
 zcfsUpdate:
 with DM do
  try
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName                       := 'Z_ALIMONY_UPDATE';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_ALIMONY').AsInteger  := PParameter.ID;
   StoredProc.ParamByName('ID_MAN').AsInteger      := DSetData.FieldValues['ID_MAN'];
   StoredProc.ParamByName('SUMMA_DOLG').AsExtended := StrToFloat(DolgEdit.Text);
   StoredProc.ParamByName('DATE_BEG').AsDate       := DateBeg.Date;
   StoredProc.ParamByName('DATE_END').AsDate       := DateEnd.Date;
   StoredProc.ParamByName('PERCENT').AsFloat       := StrToFloat(PercentEdit.Text);
   StoredProc.ParamByName('MAX_PERCENT').AsFloat   := StrToFloat(maxPercentEdit.Text);
   StoredProc.ParamByName('POCHTA_PERCENT').AsFloat:= StrToFloat(PochtaPercentEdit.Text);
   StoredProc.ParamByName('DOCUMENT').AsString     := DocumentEdit.Text;
   StoredProc.ParamByName('SEND_PEOPLE').AsString  := SendPeopleEdit.Text;
   StoredProc.ParamByName('SEND_ADRESS').AsString  := SendAdressEdit.Text;
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
   ModalResult:=mrYes;
   except
    on E: Exception do
     begin
      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOk]);
      WriteTransaction.Rollback;
     end
   end;
end;
end;

procedure TFAlimonyControl.FormCreate(Sender: TObject);
var RecInfo:RECORD_INFO_STRUCTURE;
begin
if PParameter.ControlFormStyle=zcfsDelete then
 begin
  with DM do
  try
   StoredProc.Transaction.StartTransaction;
   RecInfo.TRHANDLE       :=WriteTransaction.Handle;
   RecInfo.DBHANDLE       :=DB.Handle;
   RecInfo.ID_RECORD      :=VarArrayOf([PParameter.ID]);
   RecInfo.PK_FIELD_NAME  :=VarArrayOf(['ID_ALIMONY']);
   RecInfo.TABLE_NAME     :='Z_ALIMONY';
   RecInfo.RAISE_FLAG     :=True;
   LockRecord(@RecInfo);
   if ZShowMessage(ZAlimonyCtrl_Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
    begin
     StoredProc.StoredProcName                       := 'Z_ALIMONY_DELETE';
     StoredProc.Prepare;
     StoredProc.ParamByName('ID_ALIMONY').AsInteger  := PParameter.ID;
     StoredProc.ExecProc;
     StoredProc.Transaction.Commit;
     ModalResult:=mrYes;
     PParameter.ID:=-1;
    end
   else
    begin
     PParameter.ID := -1;
     StoredProc.Transaction.Rollback;
     ModalResult:=mrCancel;
    end;
  except
   on E:exception do
    begin
     ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOk]);
     WriteTransaction.Rollback;
     PParameter.ID := -1;
     ModalResult:=mrCancel;
    end;
   end;
 end;
end;

procedure TFAlimonyControl.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

procedure TFAlimonyControl.Action2Execute(Sender: TObject);
begin
     SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

end.

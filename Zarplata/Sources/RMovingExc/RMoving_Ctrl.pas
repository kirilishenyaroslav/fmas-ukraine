unit RMoving_Ctrl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxLabel, zProc, zTypes, cxLookAndFeelPainters,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, ActnList,
  ExtCtrls, StdCtrls, cxButtons, iBase, unit_zGlobal_Consts, zmessages;

type
  TFRmovingCtrl = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    Bevel1: TBevel;
    ActionList: TActionList;
    DB: TpFIBDatabase;
    StProcTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    Panel1: TPanel;
    LabelMan: TcxLabel;
    MaskEditMan: TcxMaskEdit;
    ActionYes: TAction;
    ActionCancel: TAction;
    Panel2: TPanel;
    LabelBeg: TcxLabel;
    DateEditBeg: TcxDateEdit;
    DateEditEnd: TcxDateEdit;
    LabelEnd: TcxLabel;
    cxLabel1: TcxLabel;
    Bevel2: TBevel;
    NoteText: TcxTextEdit;
    cxLabel2: TcxLabel;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
  private
    pLanguageIndex:Byte;
    pResult:integer;
    rmoving:integer;
    pid:integer;
    pcfs:TZControlFormStyle;
    pIsCreated:boolean;
  public
    constructor Create(aOwner:TComponent;DB_handle:TISC_DB_HANDLE;cfs:TZControlFormStyle;id:integer);reintroduce;
    property IsCreated:boolean read pIsCreated;
    property Result:integer read pResult;
    function DeleteRecord:boolean;
  end;

var
  FRmovingCtrl: TFRmovingCtrl;

function ShowRmovingExcCtrlForm(aOwner:TComponent;DB_handle:TISC_DB_HANDLE;cfs:TZControlFormStyle;id:integer):variant;stdcall;
 exports ShowRmovingExcCtrlForm;

implementation

{$R *.dfm}

function ShowRmovingExcCtrlForm(aOwner:TComponent;DB_handle:TISC_DB_HANDLE;cfs:TZControlFormStyle;id:integer):variant;
var CtrlForm:TFRmovingCtrl;
begin
Result:=0;
 CtrlForm := TFRmovingCtrl.Create(aOwner,DB_handle,cfs,id);
 if cfs=zcfsDelete then
  begin
   If (CtrlForm.IsCreated) and (CtrlForm.DeleteRecord) then Result:=1;
  end
 else
  If (CtrlForm.IsCreated) and (CtrlForm.ShowModal=mrYes) then Result := CtrlForm.Result;
 CtrlForm.Destroy;
end;


constructor TFRmovingCtrl.Create(aOwner:TComponent;DB_handle:TISC_DB_HANDLE;cfs:TZControlFormStyle;id:integer);
begin
 inherited Create(aOwner);
 pLanguageIndex := LanguageIndex;
 pResult := 0;
 pIsCreated := True;
 pcfs := cfs;
//------------------------------------------------------------------------------
 LabelMan.Caption := LabelMan_Caption[pLanguageIndex];
 LabelBeg.Caption := LabelDateBeg_Caption[pLanguageIndex];
 LabelEnd.Caption := LabelDateEnd_Caption[pLanguageIndex];
 YesBtn.Caption   := YesBtn_Caption[pLanguageIndex];
 CancelBtn.Caption:= CancelBtn_Caption[pLanguageIndex];
 YesBtn.Hint      := YesBtn.Caption;
 CancelBtn.Hint   := CancelBtn.Caption;
//------------------------------------------------------------------------------
 DB.Handle := DB_handle;
 case cfs of
  zcfsInsert:
   try
    Caption := Caption_Insert[pLanguageIndex];
    rmoving := id;
    StProc.StoredProcName := 'Z_GET_MAN_BY_RMOVING';
    StProcTransaction.StartTransaction;
    StProc.Prepare;
    StProc.ParamByName('RMOVING').AsInteger := rmoving;
    StProc.ParamByName('DATE_TN').AsVariant := NULL;
    StProc.ExecProc;
    MaskEditMan.Text := ifThen(varIsNUll(StProc.ParamByName('TN').AsVariant),'',StProc.ParamByName('TN').AsString+' - ')+StProc.ParamByName('FIO').AsString;
    StProc.Transaction.Commit;
   except
   on e:exception do
    begin
     pIsCreated := False;
     ZShowMessage(Error_Caption[pLanguageIndex],e.Message,mtError,[mbOK]);
     StProc.Transaction.Rollback;
    end;
   end;
  zcfsUpdate:
   try
    Caption := Caption_Update[pLanguageIndex];
    pId := id;
    StProc.StoredProcName := 'Z_RMOVING_EXC_S_BY_ID';
    StProcTransaction.StartTransaction;
    StProc.Prepare;
    StProc.ParamByName('IN_ID').AsInteger := pid;
    StProc.ExecProc;
    MaskEditMan.Text := ifThen(varIsNUll(StProc.ParamByName('TN').AsVariant),'',StProc.ParamByName('TN').AsString+' - ')+StProc.ParamByName('FIO').AsString;
    rmoving := StProc.ParamByName('RMOVING').AsInteger;
    DateEditBeg.Date := StProc.ParamByName('DATE_BEG').AsDate;
    DateEditEnd.Date := StProc.ParamByName('DATE_END').AsDate;
    NoteText.Text    := StProc.ParamByName('NOTE').Value;
    StProc.Transaction.Commit;
   except
   on e:exception do
    begin
     pIsCreated := False;
     ZShowMessage(Error_Caption[pLanguageIndex],e.Message,mtError,[mbOK]);
     StProc.Transaction.Rollback;
    end;
   end;
  zcfsShowDetails:
   try
    Caption := Caption_Detail[pLanguageIndex];
    CancelBtn.Visible:=False;
    YesBtn.Left:=CancelBtn.Left;
    DateEditBeg.Properties.ReadOnly:=True;
    DateEditEnd.Properties.ReadOnly:=True;
    pId := id;
    StProc.StoredProcName := 'Z_RMOVING_EXC_S_BY_ID';
    StProcTransaction.StartTransaction;
    StProc.Prepare;
    StProc.ParamByName('IN_ID').AsInteger := pid;
    StProc.ExecProc;
    MaskEditMan.Text := ifThen(varIsNUll(StProc.ParamByName('TN').AsVariant),'',StProc.ParamByName('TN').AsString+' - ')+StProc.ParamByName('FIO').AsString;
    rmoving := StProc.ParamByName('RMOVING').AsInteger;
    DateEditBeg.Date := StProc.ParamByName('DATE_BEG').AsDate;
    DateEditEnd.Date := StProc.ParamByName('DATE_END').AsDate;
    StProc.Transaction.Commit;
   except
   on e:exception do
    begin
     pIsCreated := False;
     ZShowMessage(Error_Caption[pLanguageIndex],e.Message,mtError,[mbOK]);
     StProc.Transaction.Rollback;
    end;
   end;
  zcfsDelete:
   begin
    pId:=Id;
   end;
 end;
end;

procedure TFRmovingCtrl.ActionCancelExecute(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TFRmovingCtrl.ActionYesExecute(Sender: TObject);
begin
 if VarIsNULL(DateEditBeg.EditValue) or VarIsNULL(DateEditEnd.EditValue) or
    (DateEditBeg.Date>DateEditEnd.Date) then
  begin
   ZShowMessage(ZeInputError_Caption[pLanguageIndex],ZeInputTerms_ErrorText[pLanguageIndex],mtWarning,[mbOk]);
   DateEditBeg.SetFocus;
  end
 else
 try
  if pcfs=zcfsInsert then StProc.StoredProcName := 'Z_RMOVING_EXC_I';
  if pcfs=zcfsUpdate then StProc.StoredProcName := 'Z_RMOVING_EXC_U';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;

  StProc.ParamByName('RMOVING').AsInteger := rmoving;
  StProc.ParamByName('DATE_BEG').AsVariant := DateEditBeg.EditValue;
  StProc.ParamByName('DATE_END').AsVariant := DateEditEnd.EditValue;
  StProc.ParamByName('NOTE').AsVariant := NoteText.Text;
  if pcfs=zcfsUpdate then
     StProc.ParamByName('ID').AsInteger := pId;

  StProc.ExecProc;
  zShowStProcParametersData(StProc);

  pResult := StProc.ParamByName('ID').AsInteger;
  StProc.Transaction.Commit;
  ModalResult := mrYes;
 except
 on e:exception do
  begin
   ZShowMessage(Error_Caption[pLanguageIndex],e.Message,mtError,[mbOK]);
   StProc.Transaction.Rollback;
  end;
 end;
end;

function TFRmovingCtrl.DeleteRecord:boolean;
begin
 Result:=True;
 if ZShowMessage(Caption_Delete[pLanguageIndex],DeleteRecordQuestion_Text[pLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
 try
  if pcfs=zcfsDelete then StProc.StoredProcName := 'Z_RMOVING_EXC_D';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('ID').AsInteger := pId;
  StProc.ExecProc;
  zShowStProcParametersData(StProc);
  StProc.Transaction.Commit;
  ModalResult := mrYes;
 except
 on e:exception do
  begin
   ZShowMessage(Error_Caption[pLanguageIndex],e.Message,mtError,[mbOK]);
   StProc.Transaction.Rollback;
   Result:=False;
  end;
 end
 else
  begin
   Result:=False;
   StProc.Transaction.StartTransaction;
   StProc.Transaction.Rollback;
  end;
end;

end.

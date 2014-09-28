unit Stud_Terms_Edu_Ctrl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons, gr_uCommonConsts,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  Stud_Terms_Edu_Ctrl_DM, gr_uMessage, ActnList, ZProc, uCommonSp,
  Unit_NumericConsts, Dates, gr_uCommonLoader, gr_uCommonProc, cxSpinEdit,
  cxGraphics, dxStatusBar,  Registry;

type
  TFCtrlEduStudTerms = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    BoxMan: TcxGroupBox;
    LabelMan: TcxLabel;
    EditMan: TcxButtonEdit;
    BoxDatesSum: TcxGroupBox;
    DateBegLabel: TcxLabel;
    EditDateBeg: TcxDateEdit;
    EditDateEnd: TcxDateEdit;
    DateEndLabel: TcxLabel;
    Actions: TActionList;
    ActionYes: TAction;
    PrikazMaskEdit: TcxMaskEdit;
    PrikazLabel: TcxLabel;
    dxStatusBar1: TdxStatusBar;
    Action1: TAction;
    Action2: TAction;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionYesExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure RestoreFromBuffer(Sender:TObject);
    procedure FormShow(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
   PIdStud:int64;
   PIdMan:int64;
   DM:TDM;
   PRes:Variant;
   PDb_Handle:TISC_DB_HANDLE;
   Pcfs:TZControlFormStyle;
   PLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:int64):boolean;
    function PrepareData(Db_Handle:TISC_DB_HANDLE;fs:TZControlFormStyle;Id:int64):boolean;
    property Res:Variant read PRes;
  end;

function ViewStudTermsCtrl(AParameter:TObject):Variant;stdcall;
 exports ViewStudTermsCtrl;

implementation

uses FIBQuery, Math;

{$R *.dfm}


function TFCtrlEduStudTerms.DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:int64):boolean;
var PLanguageIndex:byte;
begin
 Result:=False;
 PLanguageIndex := IndexLanguage;
 if grShowMessage(Caption_Delete[PLanguageIndex],
                  DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbCancel])=mrYes then
   with DM do
    try
     DB.Handle:=Db_Handle;
     StProc.Transaction.StartTransaction;
     StProc.StoredProcName:='GR_CN_DT_STUD_D';
     StProc.Prepare;
     StProc.ParamByName('ID_STUD').AsInt64 :=Id;
     StProc.ExecProc;
     StProc.Transaction.Commit;
     Result:=True;
    except
     on E:Exception do
      begin
       grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOK]);
       StProc.Transaction.Rollback;
       Result:=False;
      end;
     end;
end;

function ViewStudTermsCtrl(AParameter:TObject):Variant;stdcall;
var Form:TFCtrlEduStudTerms;
begin
 Form:=TFCtrlEduStudTerms.Create(TgrCtrlSimpleParam(AParameter).Owner);
 if TgrCtrlSimpleParam(AParameter).fs=zcfsDelete then
    result:=Form.DeleteRecord(TgrCtrlSimpleParam(AParameter).DB_Handle,
                              TgrCtrlSimpleParam(AParameter).Id)
 else
  begin
   result := Form.PrepareData(TgrCtrlSimpleParam(AParameter).DB_Handle,
                              TgrCtrlSimpleParam(AParameter).fs,
                              TgrCtrlSimpleParam(AParameter).Id);
   if Result<>False then
    begin
     Result := Form.ShowModal;
     if Result=mrYes then  Result:=Form.Res
     else Result := NULL;
    end;
  end;
  Form.Destroy;
end;

constructor TFCtrlEduStudTerms.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 DM:=TDM.Create(Self);
//******************************************************************************
 PLanguageIndex:=LanguageIndex;
 PRes:=NULL;
//******************************************************************************
 LabelMan.Caption        := LabelStudent_Caption[PLanguageIndex];
 DateBegLabel.Caption    := LabelDateBeg_Caption[PLanguageIndex];
 DateEndLabel.Caption    := LabelDateEnd_Caption[PLanguageIndex];
 BoxMan.Caption          := '';
 BoxDatesSum.Caption     := '';
 YesBtn.Caption          := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption       := CancelBtn_Caption[PLanguageIndex];
 CancelBtn.Hint          := CancelBtn.Caption+' (Esc)';
//******************************************************************************
 dxStatusBar1.Panels[0].Text := 'F9 - '+ToBuffer_Caption[PLanguageIndex];
 dxStatusBar1.Panels[1].Text := 'F10 - '+YesBtn.Caption;
 dxStatusBar1.Panels[2].Text := 'Esc - '+CancelBtn.Caption;
end;

function TFCtrlEduStudTerms.PrepareData(Db_Handle:TISC_DB_HANDLE;fs:TZControlFormStyle;Id:int64):boolean;
begin
 Result:=True;
 Pcfs := fs;
 PDb_Handle := Db_Handle;
 case fs of
  zcfsInsert:
   begin
    Caption:=Caption_Insert[PLanguageIndex];
    with DM do
     try
      DB.Handle := PDb_Handle;
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='GR_MAN_BY_ID';
      StProc.Prepare;
      StProc.ParamByName('IN_ID_MAN').AsInt64:=Id;
      StProc.ExecProc;
      PIdStud            := 0;
      PIdMan             := StProc.ParamByName('ID_MAN').AsInt64;
      EditMan.Text       := StProc.ParamByName('FIO').AsString;
      //EditDateBeg.Date   := strtodate('01.09.2010');
      //EditDateEnd.Date   := strtodate('30.06.2011');
       EditDateBeg.Date   := strToDate('01.09.'+FormatDateTime('yyyy',Date));
       EditDateEnd.Date   := IncMonth(strToDate('30.06.'+FormatDateTime('yyyy',Date)),12);
      StProc.Transaction.Commit;
     except
      on E:Exception do
       begin
        grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
        StProc.Transaction.Rollback;
        Result:=false;
       end;
     end;
   end;
  zcfsUpdate:
   begin
    Caption:=Caption_Update[PLanguageIndex];
    with DM do
     try
      DB.Handle:=PDb_Handle;
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='GR_CN_DT_STUD_S_BY_KEY';
      StProc.Prepare;
      StProc.ParamByName('OLD_ID_STUD').AsInt64:=Id;
      StProc.ExecProc;
      PIdStud            := Id;
      PIdMan             := StProc.ParamByName('ID_MAN').AsInt64;
      EditMan.Text       := StProc.ParamByName('FIO').AsString;
      EditDateEnd.Date   := StProc.ParamByName('DATE_END').AsDate;
      EditDateBeg.Date   := StProc.ParamByName('DATE_BEG').AsDate;
      PrikazMaskEdit.Text:= StProc.ParamByName('PRIKAZ').AsString;
      StProc.Transaction.Commit;
     except
      on E:Exception do
       begin
        grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
        StProc.Transaction.Rollback;
        Result:=false;
       end;
     end;
   end;
  zcfsShowDetails:
   begin
    Caption:=Caption_Detail[PLanguageIndex];
    self.BoxDatesSum.Enabled     := false;
    YesBtn.Visible:=False;
    CancelBtn.Caption := ExitBtn_Caption[PlanguageIndex];
    with DM do
     try
      DB.Handle:=PDb_Handle;
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='GR_CN_DT_STUD_S_BY_KEY';
      StProc.Prepare;
      StProc.ParamByName('OLD_ID_STUD').AsInt64:=Id;
      StProc.ExecProc;
      PIdStud            := Id;
      EditMan.Text       := StProc.ParamByName('FIO').AsString;
      EditDateEnd.Date   := StProc.ParamByName('DATE_END').AsDate;
      EditDateBeg.Date   := StProc.ParamByName('DATE_BEG').AsDate;
      PrikazMaskEdit.Text:= StProc.ParamByName('PRIKAZ').AsString;
      StProc.Transaction.Commit;
     except
      on E:Exception do
       begin
        grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
        StProc.Transaction.Rollback;
        Result:=false;
       end;
     end;
   end;
 end;
end;

procedure TFCtrlEduStudTerms.CancelBtnClick(Sender: TObject);
begin
ModalResult  := mrCancel;
end;

procedure TFCtrlEduStudTerms.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if DM.DefaulttTransaction.InTransaction then DM.DefaulttTransaction.Commit;
end;

procedure TFCtrlEduStudTerms.ActionYesExecute(Sender: TObject);
begin
if DateToStr(EditDateBeg.Date)='00.00.0000' then
 begin
  grShowMessage(ECaption[PLanguageIndex],EDateNullText[PLanguageIndex],mtWarning,[mbOk]);
  EditDateBeg.SetFocus;
  exit;
 end;

if DateToStr(EditDateEnd.Date)='00.00.0000' then
 begin
  grShowMessage(ECaption[PLanguageIndex],EDateNullText[PLanguageIndex],mtWarning,[mbOk]);
  EditDateEnd.SetFocus;
  exit;
 end;

if StrToDate(EditDateBeg.Text)>StrToDate(EditDateEnd.Text) then
 begin
  grShowMessage(ECaption[PLanguageIndex],EInputTerms_Text[PLanguageIndex],mtWarning,[mbOk]);
  EditDateEnd.SetFocus;
  exit;
 end;

with DM do
try
 DB.Handle := PDb_Handle;
 StProcTransaction.StartTransaction;
 case Pcfs of
  zcfsInsert: StProc.StoredProcName:='GR_CN_DT_STUD_I';
  zcfsUpdate: StProc.StoredProcName:='GR_CN_DT_STUD_U';
 end;
 StProc.Prepare;

 StProc.ParamByName('ID_MAN').AsInteger:=PIdMan;
 StProc.ParamByName('DATE_BEG').AsDate:=StrToDate(EditDateBeg.Text);
 StProc.ParamByName('DATE_END').AsDate:=StrToDate(EditDateEnd.Text);
 StProc.ParamByName('PRIKAZ').AsString:=PrikazMaskEdit.Text;



 case Pcfs of
  zcfsUpdate:
    StProc.ParamByName('ID_STUD').AsInt64:=PIdStud;
 end;

 StProc.ExecProc;
 if pcfs=zcfsInsert then PRes := StProc.ParamByName('ID_STUD').AsInt64
 else PRes:=PIdStud;
 StProc.Transaction.Commit;
 ModalResult:=mrYes;
except
 on e:Exception do
  begin
   grShowMessage(ECaption[PLanguageIndex],e.message,mtError,[mbOk]);
   StProc.transaction.RollBack;
   PRes:=NULL;
  end;
end;
end;

procedure TFCtrlEduStudTerms.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

procedure TFCtrlEduStudTerms.Action1Execute(Sender: TObject);
var reg: TRegistry;
    Key:string;
begin
 Key := '\Software\Grant\CtrlEduStudTerms';
 reg:=TRegistry.Create;
 
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey(Key,True);
  reg.WriteString('IsBuffer','1');
  reg.WriteDate('DateBegGrant',EditDateBeg.EditValue);
  reg.WriteDate('DateEndGrant',EditDateEnd.EditValue);
  reg.WriteString('PrikazMaskEdit',PrikazMaskEdit.Text);
  
 finally
  reg.Free;
 end;
 CancelBtn.SetFocus;
end;


procedure TFCtrlEduStudTerms.RestoreFromBuffer(Sender:TObject);
var reg:TRegistry;
    Kod:integer;
    Key:string;
begin
  Key := '\Software\Grant\CtrlEduStudTerms';

  reg := TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;
  if not reg.OpenKey(Key,False) then
   begin
    reg.free;
    Exit;
   end;

 if reg.ReadString('IsBuffer')<>'1' then
  begin
   reg.Free;
   exit;
  end;
 //try

 EditDateBeg.EditValue:=reg.ReadDate('DateBegGrant');
 EditDateEnd.EditValue:=reg.ReadDate('DateEndGrant');
 PrikazMaskEdit.EditValue:=reg.ReadString('PrikazMaskEdit');

 //finally
 EditDateBeg.SetFocus;
 Reg.Free;
 //end;
end;

procedure TFCtrlEduStudTerms.FormShow(Sender: TObject);
begin
  if Pcfs=zcfsInsert then RestoreFromBuffer(self);
end;

procedure TFCtrlEduStudTerms.Action2Execute(Sender: TObject);
begin
if CancelBtn.Focused=true then Close;
if YesBtn.Focused=true then  ActionYes.Execute;
if PrikazMaskEdit.Focused=true then  YesBtn.SetFocus;
if EditDateEnd.Focused=true then  PrikazMaskEdit.SetFocus;
if EditDateBeg.Focused=true then  EditDateEnd.SetFocus;



end;

procedure TFCtrlEduStudTerms.FormCreate(Sender: TObject);
begin
 dxStatusBar1.Panels[0].Text := 'F9 - '+ToBuffer_Caption[PLanguageIndex];
 dxStatusBar1.Panels[1].Text := 'F10 - '+YesBtn.Caption;
 dxStatusBar1.Panels[2].Text := 'Esc - '+CancelBtn.Caption;
end;

end.

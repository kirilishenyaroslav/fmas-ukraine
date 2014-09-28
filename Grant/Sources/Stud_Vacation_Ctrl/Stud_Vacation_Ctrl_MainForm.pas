unit Stud_Vacation_Ctrl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons, gr_uCommonConsts,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  Stud_Vacation_Ctrl_DM, gr_uMessage, ActnList, ZProc, uCommonSp,
  Unit_NumericConsts, Dates, gr_uCommonLoader, gr_uCommonProc, cxGraphics,
  dxStatusBar,Registry;

type
  TFCtrlStudVacation = class(TForm)
    BoxMan: TcxGroupBox;
    LabelMan: TcxLabel;
    EditMan: TcxButtonEdit;
    BoxDates: TcxGroupBox;
    DateBegLabel: TcxLabel;
    EditDateBeg: TcxDateEdit;
    EditDateEnd: TcxDateEdit;
    DateEndLabel: TcxLabel;
    EditPrikaz: TcxButtonEdit;
    LabelPrikaz: TcxLabel;
    YesBtn: TcxButton;
    Actions: TActionList;
    ActionYes: TAction;
    ActionEnter: TAction;
    CancelBtn: TcxButton;
    dxStatusBar1: TdxStatusBar;
    ActionF9: TAction;
    procedure YesBtnClick(Sender: TObject);
    procedure ActionEnterExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionF9Execute(Sender: TObject);
    procedure RestoreFromBuffer(Sender:TObject);
  private
      PRes:Variant;
      PLanguageIndex:byte;
      Pcfs:TZControlFormStyle;
      PIdStud:int64;
      PIdStudVac:integer;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function PrepareData(Db_Handle:TISC_DB_HANDLE;fs:TZControlFormStyle;Id:int64):boolean;
    function DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:integer):boolean;
    property Res:Variant read PRes;
  end;

var
  FCtrlStudVacation: TFCtrlStudVacation;
 function ViewStudVacationCtrl(AParameter:TObject):Variant;stdcall;
 exports ViewStudVacationCtrl;
implementation

uses FIBQuery;

{$R *.dfm}
//******************************************************************************
function ViewStudVacationCtrl(AParameter:TObject):Variant;stdcall;
var Form:TFCtrlStudVacation;
begin

 Form:=TFCtrlStudVacation.Create(TgrCtrlSimpleParam(AParameter).Owner);
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

     if Result=mrYes then Result:=Form.Res 
     else Result := NULL;
    end
   else Result:=NULL;
  end;
  Form.Destroy;
end;
//******************************************************************************

constructor TFCtrlStudVacation.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 DM:=TDM.Create(Self);
 PRes:=NULL;
 PLanguageIndex:=LanguageIndex;
 LabelMan.Caption        := LabelStudent_Caption[PLanguageIndex];
 DateBegLabel.Caption    := LabelDateBeg_Caption[PLanguageIndex];
 DateEndLabel.Caption    := LabelDateEnd_Caption[PLanguageIndex];
 LabelPrikaz.Caption     := LabelPrikaz_Caption[PLanguageIndex];
 BoxMan.Caption          := '';
 BoxDates.Caption        := '';
 YesBtn.Caption          := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption       := CancelBtn_Caption[PLanguageIndex];
 CancelBtn.Hint          := CancelBtn.Caption+' (Esc)';
end;
//******************************************************************************
function TFCtrlStudVacation.DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:integer):boolean;
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
     StProc.StoredProcName:='GR_CN_DT_STUD_VAC_D';
     StProc.Prepare;
     StProc.ParamByName('ID_VACATION').AsInteger:=Id;
     StProc.ExecProc;
     StProc.Transaction.Commit;
     Result:=True;
     PRes:=-1;
    except
     on E:Exception do
      begin
       grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOK]);
       StProc.Transaction.Rollback;
       Result:=False;
      end;
   end;
end;
//******************************************************************************
function TFCtrlStudVacation.PrepareData(Db_Handle:TISC_DB_HANDLE;fs:TZControlFormStyle;Id:int64):boolean;
var PDay,PMonth,PYear:word;
    DBegStud,DEndStud,DBeg,DEnd:TDate;
begin
 Result:=True;
 Pcfs := fs;
 case fs of
  zcfsInsert:
   begin
    Caption:=Caption_Insert[PLanguageIndex];
    with DM do
     try
      DB.Handle:=Db_Handle;
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='GR_CN_DT_STUD_INF_FOR_I';
      StProc.Prepare;
      StProc.ParamByName('ID_STUD').AsInt64:=Id;
      StProc.ExecProc;
      PIdStud            := Id;
      EditMan.Text       := StProc.ParamByName('FIO').AsString;
      EditDateBeg.Date   :=StProc.ParamByName('DATE_BEG_STUD').AsDate;
      EditDateEnd.Date   :=StProc.ParamByName('DATE_END_STUD').AsDate;
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

      DB.Handle:=Db_Handle;
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='GR_DT_STUD_VAC_S_BY_KEY';
      StProc.Prepare;
      StProc.ParamByName('old_ID_VACATION').AsInteger:=Id;
      StProc.ExecProc;
      PIdStudVac              := Id;
      PIdStud                 := StProc.ParamByName('ID_STUD').AsInt64;
      EditMan.Text            := StProc.ParamByName('FIO').AsString;
      EditDateBeg.Date        := StProc.ParamByName('DATE_BEG').asDate;
      EditDateEnd .date       := StProc.ParamByName('DATE_END').asDate;
      EditPrikaz.Text         := StProc.paramByName('PRIKAZ').AsString;
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
     self.BoxDates.Enabled        := false;
    YesBtn.Visible:=False;
    CancelBtn.Caption := ExitBtn_Caption[PlanguageIndex];
    ///EditDepartment.Properties.Buttons[0].Visible:=False;
    with DM do
     try
      DB.Handle:=Db_Handle;
      //DSetCatStud.Open;
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='GR_DT_STUD_VAC_S_BY_KEY';
      StProc.Prepare;
      StProc.ParamByName('old_ID_VACATION').AsInt64:=Id;
      StProc.ExecProc;
      PIdStud:=StProc.ParamByName('ID_STUD').AsInteger;
      EditMan.Text       := StProc.ParamByName('FIO').AsString;
      EditDateEnd.Date   := StProc.ParamByName('DATE_END').AsDate;
      EditDateBeg.Date   := StProc.ParamByName('DATE_BEG').AsDate;
      EditPrikaz.Text    := StProc.ParamByNAme('PRIKAZ').Asstring;
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
//******************************************************************************
procedure TFCtrlStudVacation.YesBtnClick(Sender: TObject);
var Res:Int64;
begin
YesBtn.SetFocus;
if EditDateBeg.Date>EditDateEnd.Date then
 begin
  grShowMessage(ECaption[PLanguageIndex],EInputTerms_Text[PLanguageIndex],mtWarning,[mbOk]);
  exit;
 end;


with DM do
try
 StProcTransaction.StartTransaction;
 case Pcfs of
  zcfsInsert: StProc.StoredProcName:='GR_CN_DT_STUD_VAC_I';
  zcfsUpdate: StProc.StoredProcName:='GR_CN_DT_STUD_VAC_U';
 end;
 StProc.Prepare;
 StProc.ParamByName('ID_STUD').AsInt64:=PIdStud;
 StProc.ParamByName('DATE_BEG').AsDate:=StrToDate(EditDateBeg.Text);
 StProc.ParamByName('DATE_END').AsDate:=StrToDate(EditDateEnd.Text);
 StProc.ParamByName('PRIKAZ').AsString:=EditPrikaz.Text;

 case Pcfs of
  zcfsUpdate:  StProc.ParamByName('ID_VACATION').AsInteger:=PIdStudVac;
 end;
 StProc.ExecProc;
 if pcfs=zcfsInsert then
  Res:=StProc.ParamByName('ID_VACATION').AsInteger
 else Res:=0;
 StProc.Transaction.Commit;
 PRes:=Res;
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
//******************************************************************************
procedure TFCtrlStudVacation.ActionEnterExecute(Sender: TObject);
begin
if CancelBtn.Focused=true then begin ModalResult  := mrCancel; exit; end;
if YesBtn.Focused=true then  begin ActionYes.Execute;exit; end;
if EditPrikaz.Focused=true then  YesBtn.SetFocus;
if EditDateEnd.Focused=true then  EditPrikaz.SetFocus;
if EditDateBeg.Focused=true then  EditDateEnd.SetFocus;
end;

procedure TFCtrlStudVacation.FormShow(Sender: TObject);
begin
if Pcfs=zcfsInsert then RestoreFromBuffer(self);
  //FormResize(sender);
  //if PUpdateDateEnd=1 then EditDateEnd.Setfocus;

end;

procedure TFCtrlStudVacation.RestoreFromBuffer(Sender:TObject);
var reg:TRegistry;
    Kod:integer;
    Key:string;
begin

  Key := '\Software\Grant\CtrlStudVacation';
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
 EditDateBeg.EditValue:=reg.ReadDate('DateBegPeriod');
 EditDateEnd.EditValue:=reg.ReadDate('DateEndPeriod');
 EditPrikaz.Text:=reg.ReadString('EditPrikaz');
 EditDateBeg.SetFocus;
 Reg.Free;
end;

procedure TFCtrlStudVacation.CancelBtnClick(Sender: TObject);
begin
ModalResult  := mrCancel;
end;

procedure TFCtrlStudVacation.FormCreate(Sender: TObject);
begin
 dxStatusBar1.Panels[0].Text := 'F9 - '+ToBuffer_Caption[PLanguageIndex];
 dxStatusBar1.Panels[1].Text := 'F10 - '+YesBtn.Caption;
 dxStatusBar1.Panels[2].Text := 'Esc - '+CancelBtn.Caption;
end;

procedure TFCtrlStudVacation.ActionF9Execute(Sender: TObject);
var reg: TRegistry;
    Key:string;
begin
 CancelBtn.SetFocus; 
 Key := '\Software\Grant\CtrlStudVacation';

 reg:=TRegistry.Create;
 try   
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey(Key,True);
  reg.WriteString('IsBuffer','1'); 
  reg.WriteDate('DateBegPeriod',EditDateBeg.EditValue);
  reg.WriteDate('DateEndPeriod',EditDateEnd.EditValue); 
  reg.WriteString('EditPrikaz',EditPrikaz.Text);
 finally
  reg.Free;
 end;
end;

end.


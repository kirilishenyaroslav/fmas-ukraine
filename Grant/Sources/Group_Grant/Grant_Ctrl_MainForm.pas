unit Grant_Ctrl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons, gr_uCommonConsts,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  gr_uMessage, ActnList, ZProc, uCommonSp,
  Unit_NumericConsts, Dates, gr_uCommonLoader, gr_uCommonProc, cxSpinEdit,
  cxCheckBox,UpKernelUnit, cxGraphics, dxStatusBar, Registry, gr_Stud_Group_DM,
  gr_uWaitForm;

type
  TFGrantCtrl = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    BoxDatesSum: TcxGroupBox;
    LabelSumma: TcxLabel;
    Actions: TActionList;
    ActionYes: TAction;
    BoxVidOpl: TcxGroupBox;
    EditVidopl: TcxButtonEdit;
    LabelVidoplData: TcxLabel;
    LabelVidopl: TcxLabel;
    LabelSmetadata: TcxLabel;
    EditSmeta: TcxButtonEdit;
    LabelSmeta: TcxLabel;
    MaskEditSumma: TcxMaskEdit;
    LabelBal: TcxLabel;
    MaskEditBal: TcxMaskEdit;
    BoxDates: TPanel;
    EditDateBeg: TcxDateEdit;
    DateBegLabel: TcxLabel;
    EditDateEnd: TcxDateEdit;
    DateEndLabel: TcxLabel;
    PrikazMaskEdit: TcxMaskEdit;
    PrikazLabel: TcxLabel;
    dxStatusBar1: TdxStatusBar;
    Action1: TAction;
    Action2: TAction;
    procedure CancelBtnClick(Sender: TObject);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionYesExecute(Sender: TObject);
    procedure EditVidoplExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditSmetaExit(Sender: TObject);
    procedure EditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Action1Execute(Sender: TObject);
    procedure RestoreFromBuffer(Sender:TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private

  public
   PIdGrant:Integer;
   PIdStud:int64;
   PIdVidopl:integer;
   PKodVidopl:integer;
   PIdSmeta:int64;
   PKodSmeta:integer;
   PRes:Variant;
   Pcfs:TZControlFormStyle;
   PLanguageIndex:byte;
   DParam:TParamGG;

   constructor Create(CParam:TParamGG);reintroduce;
   function DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:integer):boolean;
   function PrepareData(Db_Handle:TISC_DB_HANDLE):boolean;
   property Res:Variant read PRes;
  end;

function ViewGrantCtrl(CParam:TParamGG):Variant;stdcall;
exports ViewGrantCtrl;

implementation

uses FIBQuery, Math;

{$R *.dfm}


function TFGrantCtrl.DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:integer):boolean;
var PLanguageIndex:byte;
begin
 {Result:=False;
 PLanguageIndex := IndexLanguage;
 if grShowMessage(Caption_Delete[PLanguageIndex],
                  DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbCancel])=mrYes then
   with DM do
    try
     Result:=True;
     DB.Handle:=Db_Handle;
     StProc.Transaction.StartTransaction;
     StProc.StoredProcName:='GR_DT_GRANTS_D';
     StProc.Prepare;
     StProc.ParamByName('ID_GRANT').AsInteger:=Id;
     StProc.ExecProc;
     StProc.Transaction.Commit;
     PRes:=-1;
    except
     on E:Exception do
      begin
       grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOK]);
       StProc.Transaction.Rollback;
       Result:=False;
      end;
     end;     }
end;

function ViewGrantCtrl(CParam:TParamGG):Variant;stdcall;
var Form:TFGrantCtrl;
begin
 Form:=TFGrantCtrl.Create(CParam);
 {if TgrCtrlSimpleParam(AParameter).fs=zcfsDelete then
    result:=Form.DeleteRecord(TgrCtrlSimpleParam(AParameter).DB_Handle,
                              TgrCtrlSimpleParam(AParameter).Id)
 else
  begin}
   result := Form.PrepareData(DM.DB.Handle);
   if Result<>False then
    begin
     Result := Form.ShowModal;
    end
   else Result:=NULL; 
  //end;
  Form.Destroy;
end;

constructor TFGrantCtrl.Create(CParam:TParamGG);
begin
 inherited Create(CParam.Owner);
 DParam:=CParam;
 PLanguageIndex:=LanguageIndex;

//******************************************************************************
 DateBegLabel.Caption    := LabelDateBeg_Caption[PLanguageIndex];
 DateEndLabel.Caption    := LabelDateEnd_Caption[PLanguageIndex];
 LabelSmeta.Caption      := LabelSmeta_Caption[PLanguageIndex];
 LabelVidopl.Caption     := LabelVidOpl_Caption[PLanguageIndex];
 LabelSumma.Caption      := LabelSumma_Caption[PLanguageIndex];
 LabelBal.Caption        := LabelBal_Caption[PLanguageIndex];
 BoxVidOpl.Caption       := '';
 BoxDatesSum.Caption     := '';
 YesBtn.Caption          := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption       := CancelBtn_Caption[PLanguageIndex];
 CancelBtn.Hint          := CancelBtn.Caption+' (Esc)';
//******************************************************************************
 dxStatusBar1.Panels[0].Text := 'F9 - '+ToBuffer_Caption[PLanguageIndex];
 dxStatusBar1.Panels[1].Text := 'F10 - '+YesBtn.Caption;
 dxStatusBar1.Panels[2].Text := 'Esc - '+CancelBtn.Caption;
//******************************************************************************
 MaskEditSumma.Properties.EditMask := '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';

end;

function TFGrantCtrl.PrepareData(Db_Handle:TISC_DB_HANDLE):boolean;
var PDay,PMonth,PYear:word;
    DBegStud,DEndStud,DBeg,DEnd:TDate;
    Smeta:variant;
begin
 Result:=True;
   Caption:=Caption_Insert[PLanguageIndex];
    with DM do
     try
     
      EditDateBeg.Date   := strToDate('01.09.'+FormatDateTime('yyyy',Date));
      EditDateEnd.Date   := IncMonth(strToDate('30.06.'+FormatDateTime('yyyy',Date)),12);

      Smeta := grValueFieldFromZSetup(DB.Handle,'GR_DEFAULT_SMETA');
      if not VarIsNull(Smeta) then
         begin
              EditSmeta.Text := VarToStr(Smeta);
              EditSmetaExit(self);
         end;
     except
      on E:Exception do
       begin
        grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
        Result:=false;
       end;
     end;



 
end;

procedure TFGrantCtrl.CancelBtnClick(Sender: TObject);
begin
ModalResult  := mrCancel;
end;

procedure TFGrantCtrl.EditVidOplPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var VidOpl:Variant;
begin
VidOPl:=LoadVidOpl(self,
                   DM.DB.Handle,zfsModal,
                   0,ValueFieldZSetup(DM.DB.Handle,'GR_ID_SYSTEM'));
 if VarArrayDimCount(VidOpl)>0 then
  begin
   PIdVidopl:=VidOpl[0];
   PKodVidopl:=VidOPl[2];
   LabelVidOplData.Caption := VidOpl[1];
   EditVidOpl.Text := IntToStr(PKodVidOpl);
  end
 else
  EditVidOpl.SetFocus; 
end;

procedure TFGrantCtrl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//if DM.DefaulttTransaction.InTransaction then DM.DefaulttTransaction.Commit;
end;

procedure TFGrantCtrl.ActionYesExecute(Sender: TObject);
var res:variant;
wf:TForm;
begin

if PIdVidopl=0 then
 begin
  grShowMessage(ECaption[PLanguageIndex],EVidOplInput_Text[PLanguageIndex],mtWarning,[mbOk]);
  exit;
 end;
if EditDateBeg.Date>EditDateEnd.Date then
 begin
  grShowMessage(ECaption[PLanguageIndex],EInputTerms_Text[PLanguageIndex],mtWarning,[mbOk]);
  exit;
 end;

wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);
if DParam.Mode<>'U' then
with DM do
begin
  try
    StProc.Transaction.StartTransaction;
    StProc.StoredProcName:='GR_MASS_PAYMENT_DUBL';          //history of payment
    StProc.Prepare;
    StProc.ParamByName('SUMMA').AsCurrency           := StrToFloat(MaskEditSumma.Text);
    StProc.ParamByName('PRIKAZ').AsString            := PrikazMaskEdit.Text;
    StProc.ParamByName('ID_VIDOPL').AsInteger        := PIdVidOpl;
    StProc.ParamByName('ID_SMETA').AsInt64           := PIdSmeta;
    StProc.ParamByName('TYPE_MASS_PAYMENT').AsString := 'G';
    StProc.ParamByName('DATE_BEG').AsDate            := StrToDate(EditDateBeg.Text);
    StProc.ParamByName('DATE_END').AsDate            := StrToDate(EditDateEnd.Text);
    StProc.ParamByName('BAL').AsCurrency             := StrToFloat(MaskEditBal.Text);
//    showMessage(StProc.ParamByName('TYPE_MASS_PAYMENT').AsString);
    StProc.ExecProc;
//    showMessage(IntToStr(StProc.ParamByName('ID_GR_MASS_PAYMENT').AsInt64));
    if StProc.ParamByName('ID_GR_MASS_PAYMENT').AsInt64<>0  then
    begin
      StProc.Transaction.Commit;
      CloseWaitForm(wf);
      ShowMessage('Запис вже існує');
      exit;
    end;
    StProc.Transaction.Commit;
  except
    ShowMessage('Помилка перевірки дублікату');
    StProcTransaction.Rollback;
    CloseWaitForm(wf);
    exit;
  end;
end;

with DM do
begin
 StProcTransaction.StartTransaction;
 StProc.StoredProcName:='GR_DT_GRANTS_I';
 StProc.Prepare;
 DM.RxMemoryData1.First;
 while not DM.RxMemoryData1.Eof do
  try
    StProc.Prepare;
    StProc.ParamByName('ID_STUD').AsInt64   := RxMemoryData1['ID_STUD'];
    StProc.ParamByName('DATE_BEG').AsDate   := StrToDate(EditDateBeg.Text);
    StProc.ParamByName('DATE_END').AsDate   := StrToDate(EditDateEnd.Text);
    StProc.ParamByName('ID_SMETA').AsInt64  := PIdSmeta;
    StProc.ParamByName('ID_VIDOPL').AsInt64 := PIdVidopl;
    StProc.ParamByName('SUMMA').AsCurrency  := StrToFloat(MaskEditSumma.Text);
    StProc.ParamByName('BAL').AsCurrency    := StrToFloat(MaskEditBal.Text);
    StProc.ParamByName('PRIKAZ').AsString   := PrikazMaskEdit.Text;
    StProc.ExecProc;
    //PRes:=StProc.ParamByName('ID_GRANT').AsInteger
    //StProc.Transaction.Commit;
    RxMemoryData1.Next;
  except
    CloseWaitForm(wf);
    ShowMessage('Помилка додання стипендії!');
    StProcTransaction.Rollback;
    exit;
  end;

  try
    StProc2.StoredProcName:='GR_MASS_PAYMENT_I';          //history of payment
    StProc2.Prepare;
    //StProc2.ParamByName('KOD_SETUP').AsInteger     := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
    //StProc2.ParamByName('END_MONTH').AsString      := IfThen(CheckBoxMonthFinish.Checked,'T','F');
    StProc2.ParamByName('SUMMA').AsCurrency           := StrToFloat(MaskEditSumma.Text);
    StProc2.ParamByName('PRIKAZ').AsString            := PrikazMaskEdit.Text;
    StProc2.ParamByName('ID_VIDOPL').AsInteger        := PIdVidOpl;
    StProc2.ParamByName('ID_SMETA').AsInt64           := PIdSmeta;
    StProc2.ParamByName('TYPE_MASS_PAYMENT').AsString := 'G';
    StProc2.ParamByName('DATE_BEG').AsDate            := StrToDate(EditDateBeg.Text);
    StProc2.ParamByName('DATE_END').AsDate            := StrToDate(EditDateEnd.Text);
    StProc2.ParamByName('BAL').AsCurrency             := StrToFloat(MaskEditBal.Text);

    grShowStProcParametersData(StProc2);
    StProc2.ExecProc;
    Res := StProc2.ParamByName('ID_GR_MASS_PAYMENT').AsInt64;
    //StProc.Transaction.Commit;
  except
    CloseWaitForm(wf);
    ShowMessage('Помилка додання історії!');
    StProcTransaction.Rollback;
    exit;
  end;

  DM.RxMemoryData1.First;
  while not DM.RxMemoryData1.Eof do
    try
      StProc3.StoredProcName:='GR_MASS_PAYMENT_MAN_I';
      StProc3.Transaction.StartTransaction;
      StProc3.Prepare;
      StProc3.ParamByName('ID_GR_MASS_PAYMENT').AsInt64 :=   Res;
      StProc3.ParamByName('ID_MAN').AsInt64 :=               RxMemoryData1['ID_MAN'];
      StProc3.ParamByName('ID_STUD').AsInt64 :=              RxMemoryData1['ID_STUD'];
      StProc3.ExecProc;
      //StProc.Transaction.Commit;
      RxMemoryData1.Next;
    except
      CloseWaitForm(wf);
      showMessage('Помилка додання історії людини людини');
      StProc3.Transaction.Rollback;
      exit;
    end;

CloseWaitForm(wf);

  try
    StProc.Transaction.Commit;
    showMessage('Операцію успішно здійснено!');
    DSetEditPayment.CloseOpen(True);
    DM.RxMemoryData1.First;
    DM.DSetEditPayment.Locate('ID_GR_MASS_PAYMENT',Res,[]);
  except
    ShowMessage('Помилка фіксації змінень!');
    exit;
  end;
end;

ModalResult:=mrYes;

end;

procedure TFGrantCtrl.EditVidoplExit(Sender: TObject);
var VidOpl:Variant;
begin
if EditVidOpl.Text<>'' then
 begin
  if StrToInt(EditVidOpl.Text)=PKodVidopl then Exit;
  VidOpl:=VoByKod(StrToInt(EditVidOpl.Text),date,DM.DB.Handle,ValueFieldZSetup(DM.DB.Handle,'GR_ID_SYSTEM'),0);
  if VarArrayDimCount(VidOpl)>0 then
   begin
    PIdVidOpl:=VidOpl[0];
    PKodVidopl:=VidOPl[1];
    LabelVidOplData.Caption := Vidopl[2];
   end
  else
   EditVidOpl.SetFocus;
 end;
end;

procedure TFGrantCtrl.FormDestroy(Sender: TObject);
begin
//if DM<>nil then DM.Destroy;
end;

procedure TFGrantCtrl.EditSmetaExit(Sender: TObject);
var Smeta:Variant;
begin
if EditSmeta.Text<>'' then
 begin
  if StrToInt(EditSmeta.Text)=PKodSmeta then Exit;
  Smeta:=SmetaByKod(StrToInt(EditSmeta.Text),DM.DB.Handle);
  if VarArrayDimCount(Smeta)>0 then
   begin
    PIdsmeta:=Smeta[0];
    PKodSmeta:=Smeta[1];
    LabelSmetaData.Caption := Smeta[2];
   end
  else
   EditSmeta.SetFocus;
 end;
end;

procedure TFGrantCtrl.EditSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
begin
Smeta:=GetSmets(self,DM.DB.Handle,Date,psmSmet);
if VarArrayDimCount(Smeta)> 0 then
 If Smeta[0]<>NULL then
  begin
   PIdsmeta := Smeta[0];
   PKodSmeta := Smeta[3];
   EditSmeta.Text := IntToStr(PKodSmeta);
   LabelSmetaData.Caption := Smeta[2];
  end;
end;

procedure TFGrantCtrl.Action1Execute(Sender: TObject);
var reg: TRegistry;
    Key:string;
begin
{ CancelBtn.SetFocus;
 Key := '\Software\Grant\GroupGrant\GrantCtrl';
 reg:=TRegistry.Create;
 
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey(Key,True);
  reg.WriteString('IsBuffer','1');
  reg.WriteDate('DateBegGrant',EditDateBeg.EditValue);
  reg.WriteDate('DateEndGrant',EditDateEnd.EditValue);
  if(MaskEditSumma.Text<>'') then
  reg.WriteCurrency('Summa',StrToFloat(MaskEditSumma.Text));
  if(MaskEditBal.Text<>'') then
  reg.WriteCurrency('Bal',StrToFloat(MaskEditBal.Text));  
  reg.WriteString('Prikaz',PrikazMaskEdit.Text);
  reg.WriteString('KodVidOpl',EditVidopl.Text);
  reg.WriteString('KodSmeta',EditSmeta.Text);
  
 finally
  reg.Free;
 end;   }
end;

procedure TFGrantCtrl.RestoreFromBuffer(Sender:TObject);
var reg:TRegistry;
    Kod:integer;
    Key:string;
begin
{  Key := '\Software\Grant\GroupGrant\GrantCtrl';

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
 EditSmeta.Text := reg.ReadString('KodSmeta');
 EditSmetaExit(sender);
 EditVidOpl.Text := reg.ReadString('KodVidOpl');
 EditVidOplExit(sender);
 EditDateBeg.EditValue:=reg.ReadDate('DateBegGrant');
 EditDateEnd.EditValue:=reg.ReadDate('DateEndGrant');
 if(reg.ReadCurrency('Summa')<>Null) then
 MaskEditSumma.Text:=FloatToStr(reg.ReadCurrency('Summa'))
 else MaskEditSumma.Text:='';
 if(reg.ReadCurrency('Bal')<>Null) then
 MaskEditBal.Text:=FloatToStr(reg.ReadCurrency('Bal'))
 else MaskEditBal.Text:='';
 PrikazMaskEdit.Text := reg.ReadString('Prikaz');
 //finally
 EditDateBeg.SetFocus;
 Reg.Free;
 //end;        }
end;

procedure TFGrantCtrl.FormShow(Sender: TObject);
begin
//RestoreFromBuffer(self);
//  FormResize(sender);
end;

procedure TFGrantCtrl.FormResize(Sender: TObject);
var i:integer;
begin
for i:=0 to dxStatusBar1.Panels.Count-1 do
    dxStatusBar1.Panels[i].Width := Width div dxStatusBar1.Panels.Count;
end;

procedure TFGrantCtrl.Action2Execute(Sender: TObject);
begin
if YesBtn.Focused=true then ActionYes.Execute;
if EditSmeta.Focused=true then YesBtn.SetFocus;
if EditVidopl.Focused=true then EditSmeta.SetFocus;
if PrikazMaskEdit.Focused=true then EditVidopl.SetFocus;
if MaskEditBal.Focused=true then PrikazMaskEdit.SetFocus;
if MaskEditSumma.Focused=true then MaskEditBal.SetFocus;
if EditDateEnd.Focused=true then MaskEditSumma.SetFocus;
if EditDateBeg.Focused=true then EditDateEnd.SetFocus;
if CancelBtn.Focused=true then  Close();
end;

end.

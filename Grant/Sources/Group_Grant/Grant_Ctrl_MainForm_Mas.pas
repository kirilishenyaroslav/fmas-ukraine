unit Grant_Ctrl_MainForm_Mas;

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
  gr_uWaitForm, cxMemo, cxGridDBTableView;

type
  TFGrantCtrlMas = class(TForm)
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
   Memo :TcxMemo;
   Result:Variant;
   FRes:Variant;
   CParam:TParamGG;
   function RResult: Variant;
   procedure WResult(const Value: Variant);
   procedure Update_Mas_Payment();
   procedure Delete_Mas_Payment;
  public
   PIdGrant:Integer;
   PIdStud:int64;
   PIdVidopl:integer;
   PKodVidopl:integer;
   PIdSmeta:int64;
   PKodSmeta:integer;
   Pcfs:TZControlFormStyle;
   PLanguageIndex:byte;

   constructor Create(BParam:TParamGG);reintroduce;
   function DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:integer):boolean;
   function PrepareData(Db_Handle:TISC_DB_HANDLE):boolean;
   property Res:Variant read RResult write WResult;
  end;

function ViewGrantCtrl(BParam:TParamGG):Variant;stdcall;
exports ViewGrantCtrl;

implementation

uses FIBQuery, Math;

{$R *.dfm}


function TFGrantCtrlMas.DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:integer):boolean;
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

function ViewGrantCtrl(BParam:TParamGG):Variant;stdcall;
var Form:TFGrantCtrlMas;
begin

  Form:=TFGrantCtrlMas.Create(BParam);
  if  BParam.Mode='A' then
    begin
      result := Form.PrepareData(DM.DB.Handle);
      if Result<>False then
        begin
         Form.ShowModal;
         Result :=Form.RResult;
        end
      else Result:=NULL;
    end
  else  if BParam.Mode='U'
    then Form.Update_Mas_Payment
  else  if BParam.Mode='D'
    then Form.Delete_Mas_Payment;
  Form.Destroy;

end;

constructor TFGrantCtrlMas.Create(BParam:TParamGG);
begin
 inherited Create(BParam.Owner);
 CParam:=BParam;
 Memo:=TcxMemo(CParam.PMemo);
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
 //dxStatusBar1.Panels[0].Text := 'F9 - '+ToBuffer_Caption[PLanguageIndex];
 dxStatusBar1.Panels[0].Text := 'F10 - '+YesBtn.Caption;
 dxStatusBar1.Panels[1].Text := 'Esc - '+CancelBtn.Caption;
//******************************************************************************
 MaskEditSumma.Properties.EditMask := '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';

end;

function TFGrantCtrlMas.PrepareData(Db_Handle:TISC_DB_HANDLE):boolean;
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

procedure TFGrantCtrlMas.CancelBtnClick(Sender: TObject);
begin
ModalResult  := mrCancel;
end;

procedure TFGrantCtrlMas.EditVidOplPropertiesButtonClick(
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

procedure TFGrantCtrlMas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//if DM.DefaulttTransaction.InTransaction then DM.DefaulttTransaction.Commit;
end;

procedure TFGrantCtrlMas.ActionYesExecute(Sender: TObject);
var wf:TForm;
ID_GRANT,ID_GR_MASS_PAYMENT:variant;
Stream: TMemoryStream;
t:integer;
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


   with DM do
    begin
      wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);
      TcxMemo(CParam.PMemo).Lines.Clear;
      TcxMemo(CParam.PMemo).Lines.Append('Старт '+DateToStr(Now)+'  в  '+TimeToStr(Now));
      try

        StProcTransaction.StartTransaction;
        StProc2.StoredProcName:='GR_MASS_PAYMENT_I';          //history of payment
        StProc2.Prepare;
        StProc2.ParamByName('SUMMA').AsCurrency           := StrToFloat(MaskEditSumma.Text);
        StProc2.ParamByName('PRIKAZ').AsString            := PrikazMaskEdit.Text;
        StProc2.ParamByName('ID_VIDOPL').AsInteger        := PIdVidOpl;
        StProc2.ParamByName('ID_SMETA').AsInt64           := PIdSmeta;
        StProc2.ParamByName('TYPE_MASS_PAYMENT').AsString := 'G';
        StProc2.ParamByName('DATE_BEG').AsDate            := StrToDate(EditDateBeg.Text);
        StProc2.ParamByName('DATE_END').AsDate            := StrToDate(EditDateEnd.Text);
        StProc2.ParamByName('BAL').AsCurrency             := StrToFloat(MaskEditBal.Text);
        //для начислений(шоб в степендии не показ конец мес и период)
        StProc2.ParamByName('KOD_SETUP').AsVariant        := Null;
        StProc2.ParamByName('END_MONTH').AsVariant        := Null;
        StProc2.ExecProc;
        ID_GR_MASS_PAYMENT := StProc2.ParamByName('ID_GR_MASS_PAYMENT').AsInt64;
        StProcTransaction.Commit;
        WResult(ID_GR_MASS_PAYMENT);
      except
        TcxMemo(CParam.PMemo).Lines.Append('Помилка:      неможливо додати  масову стипендію');
        TcxMemo(CParam.PMemo).Lines.Append('Операцію відмінено');
        StProcTransaction.Rollback;
        CloseWaitForm(wf);
        exit;
      end;

      TcxGridDBTableView(CParam.PGrid).Controller.GoToFirst;

      For t:=0 to  TcxGridDBTableView(CParam.PGrid).DataController.RowCount-1 do
        begin
          if  TcxGridDBTableView(CParam.PGrid).DataController.Controller.FocusedRecord.Values[0]=Checked then
            begin
              try
                StProcTransaction.StartTransaction;
                StProc.StoredProcName:='GR_DT_GRANTS_I';
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
                ID_GRANT:= StProc.ParamByName('ID_GRANT').AsVariant;


                StProc3.StoredProcName:='GR_MASS_PAYMENT_MAN_I';
                StProc3.Prepare;
                StProc3.ParamByName('ID_GR_MASS_PAYMENT').AsInt64 :=   ID_GR_MASS_PAYMENT;
                StProc3.ParamByName('ID_MAN').AsInt64 :=               RxMemoryData1['ID_MAN'];
                StProc3.ParamByName('ID_STUD').AsInt64 :=              RxMemoryData1['ID_STUD'];
                StProc3.ParamByName('ID_VIPL').AsInt64 :=              StrToInt64(VarToStr(ID_GRANT));
                StProc3.ExecProc;
                StProcTransaction.Commit;
              except
                TcxMemo(CParam.PMemo).Lines.Append('Помилка:     неможливе додання людини - '+RxMemoryData1['FIO']);
                ID_GRANT:=NULL;
                StProcTransaction.Rollback;
              end;

              if ID_GRANT<>null then
                try
                  StProcTransaction.StartTransaction;
                  StProcImport.StoredProcName:='GR_CURRENT_PERESECH';
                  StProcImport.Prepare;
                  StProcImport.ParamByName('ID').AsInt64        := StrToInt64(VarToStr(ID_GRANT)); //IFThen(isNull(ResCurr),0,ResCurr;
                  StProcImport.ExecProc;
                  if StProcImport.ParamByName('RES').AsInteger=1 then TcxMemo(CParam.PMemo).Lines.Append('Попередження: пересічення термінів - '+RxMemoryData1['FIO']);
                  StProcTransaction.Commit;
                except
                  StProcTransaction.Rollback;
                  TcxMemo(CParam.PMemo).Lines.Append('Попередження: помилка перевірення пересічення термінів - '+RxMemoryData1['FIO']);
                end;

              ID_GRANT:=Null;
            end;

          TcxGridDBTableView(CParam.PGrid).Controller.GotoNext(True,True);
        end;
      CloseWaitForm(wf);
      TcxMemo(CParam.PMemo).Lines.Append('Операцію завершено  '+DateToStr(Now)+'  в  '+TimeToStr(Now));

      try
        Stream:=TMemoryStream.Create;
        TcxMemo(CParam.PMemo).Lines.SaveToStream(Stream);
        StProc.Transaction.StartTransaction;
        StProc.StoredProcName:='GR_MASS_PAYMENT_U';             //добавление отчета
        StProc.Prepare;
        StProc.ParamByName('ID_GR_MASS_PAYMENT').AsInt64 :=   ID_GR_MASS_PAYMENT;
        StProc.ParamByName('OTCHET').LoadFromStream(Stream);
        StProc.ExecProc;
        StProc.Transaction.Commit;
      except
        StProc.Transaction.Rollback;
        TcxMemo(CParam.PMemo).Lines.Append('Неможливо додати доповідь');
      end;
      Stream.Free;
    end;

  ModalResult:=mrYes;

end;

procedure TFGrantCtrlMas.EditVidoplExit(Sender: TObject);
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

procedure TFGrantCtrlMas.FormDestroy(Sender: TObject);
begin
//if DM<>nil then DM.Destroy;
end;

procedure TFGrantCtrlMas.EditSmetaExit(Sender: TObject);
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

procedure TFGrantCtrlMas.EditSmetaPropertiesButtonClick(Sender: TObject;
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

procedure TFGrantCtrlMas.Action1Execute(Sender: TObject);
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

procedure TFGrantCtrlMas.RestoreFromBuffer(Sender:TObject);
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

procedure TFGrantCtrlMas.FormShow(Sender: TObject);
begin
//RestoreFromBuffer(self);
//  FormResize(sender);
end;

procedure TFGrantCtrlMas.FormResize(Sender: TObject);
var i:integer;
begin
for i:=0 to dxStatusBar1.Panels.Count-1 do
    dxStatusBar1.Panels[i].Width := Width div dxStatusBar1.Panels.Count;
end;

procedure TFGrantCtrlMas.Action2Execute(Sender: TObject);
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

function TFGrantCtrlMas.RResult: Variant;
begin
  Result:=FRes;
end;

procedure TFGrantCtrlMas.WResult(const Value: Variant);
begin
  FRes:=Value;
end;

procedure TFGrantCtrlMas.Update_Mas_Payment;
var t:integer;
ID_GRANT:variant;
wf:TForm;
Stream:TMemoryStream;
begin
  wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);
  TcxMemo(CParam.PMemo).Lines.Append('Оновлення масової виплати '+DateToStr(Now)+'  в  '+TimeToStr(Now));
  TcxGridDBTableView(CParam.PGrid).Controller.GoToFirst;

  with DM do
    begin
      EditDateBeg.Date:=DM.DSetEditPayment['DATE_BEG'];
      EditDateEnd.Date:=DM.DSetEditPayment['DATE_END'];
      PIdSmeta:=DM.DSetEditPayment['ID_SMETA'];
      PIdVidopl:=DM.DSetEditPayment['ID_VIDOPL'];
      MaskEditSumma.Text:=VarToStr(DM.DSetEditPayment['SUMMA']);
      MaskEditBal.Text:=VarToStr(DM.DSetEditPayment['BAL']);
      PrikazMaskEdit.Text:=DM.DSetEditPayment['PRIKAZ'];

      For t:=0 to  TcxGridDBTableView(CParam.PGrid).DataController.RowCount-1 do
        begin
          if  (TcxGridDBTableView(CParam.PGrid).DataController.Controller.FocusedRecord.Values[0]=Checked)
          and  (TcxGridDBTableView(CParam.PGrid).DataController.Controller.FocusedRecord.Values[9]<>CheckedColor)
          then
            begin
              try
                StProcTransaction.StartTransaction;
                StProc.StoredProcName:='GR_DT_GRANTS_I';
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
                ID_GRANT:= StProc.ParamByName('ID_GRANT').AsVariant;


                StProc3.StoredProcName:='GR_MASS_PAYMENT_MAN_I';
                StProc3.Prepare;
                StProc3.ParamByName('ID_GR_MASS_PAYMENT').AsInt64 :=   DSetEditPayment['ID_GR_MASS_PAYMENT'];
                StProc3.ParamByName('ID_MAN').AsInt64 :=               RxMemoryData1['ID_MAN'];
                StProc3.ParamByName('ID_STUD').AsInt64 :=              RxMemoryData1['ID_STUD'];
                StProc3.ParamByName('ID_VIPL').AsInt64 :=              StrToInt64(VarToStr(ID_GRANT));
                StProc3.ExecProc;
                StProcTransaction.Commit;
              except
                TcxMemo(CParam.PMemo).Lines.Append('Помилка:     неможливе додання людини - '+RxMemoryData1['FIO']);
                StProcTransaction.Rollback;
              end;

              if ID_GRANT<>null then
                try
                  StProcTransaction.StartTransaction;
                  StProcImport.StoredProcName:='GR_CURRENT_PERESECH';
                  StProcImport.Prepare;
                  StProcImport.ParamByName('ID').AsInt64        := StrToInt64(VarToStr(ID_GRANT)); //IFThen(isNull(ResCurr),0,ResCurr;
                  StProcImport.ExecProc;
                  if StProcImport.ParamByName('RES').AsInteger=1 then TcxMemo(CParam.PMemo).Lines.Append('Попередження: пересічення термінів - '+RxMemoryData1['FIO']);
                  StProcTransaction.Commit;
                except
                  StProcTransaction.Rollback;
                  TcxMemo(CParam.PMemo).Lines.Append('Попередження: помилка перевірення пересічення термінів - '+RxMemoryData1['FIO']);
                end;

              RxMemoryData1.Edit;
              RxMemoryData1['CHECKBOXCOLOR']:=CheckedColor;
              RxMemoryData1.Post;

              ID_GRANT:=Null;
            end;

          TcxGridDBTableView(CParam.PGrid).Controller.GotoNext(True,True);
        end;

      TcxMemo(CParam.PMemo).Lines.Append('Операцію завершено  '+DateToStr(Now)+'  в  '+TimeToStr(Now));

      try
        Stream:=TMemoryStream.Create;
        TcxMemo(CParam.PMemo).Lines.SaveToStream(Stream);
        StProc.Transaction.StartTransaction;
        StProc.StoredProcName:='GR_MASS_PAYMENT_U';             //добавление отчета
        StProc.Prepare;
        StProc.ParamByName('ID_GR_MASS_PAYMENT').AsInt64 :=   DSetEditPayment['ID_GR_MASS_PAYMENT'];
        StProc.ParamByName('OTCHET').LoadFromStream(Stream);
        StProc.ExecProc;
        StProc.Transaction.Commit;
      except
        StProc.Transaction.Rollback;
        TcxMemo(CParam.PMemo).Lines.Append('Неможливо додати доповідь');
      end;
      Stream.Free;
    end;
    CloseWaitForm(wf);

end;

procedure TFGrantCtrlMas.Delete_Mas_Payment;
var focus,t:integer;
Stream:TMemoryStream;
begin
  if not DM.RxMemoryData1.Locate('CHECKBOX',UNCHECKED,[]) then
    begin
      TcxMemo(CParam.PMemo).Lines.Append('Помилка: неможливо видалити всіх');
      exit;
    end;
  //TcxGridDBTableView(CParam.PGrid).DataController.DataSource:=nil;
  //DM.RxMemoryData1.First;
  TcxGridDBTableView(CParam.PGrid).Controller.GoToFirst;
  For t:=0 to  TcxGridDBTableView(CParam.PGrid).DataController.RowCount-1 do
    begin
      if DM.RxMemoryData1['CHECKBOX']=CHECKED then
        begin
          if DM.RxMemoryData1['CHECKBOXCOLOR']=CHECKEDCOLOR then
            begin

              TcxMemo(CParam.PMemo).Lines.Append('Видалиння '+DM.RxMemoryData1['FIO']);
              with DM do
              try
                StProc.Transaction.StartTransaction;
                StProc.StoredProcName:='GR_MASS_PAYMENT_DDD';
                StProc.Prepare;
                StProc.ParamByName('ID_GR_MASS_PAYMENT').AsInt64   := DSetEditPayment['ID_GR_MASS_PAYMENT'];
                StProc.ParamByName('ID_MAN_V').AsInt64   := RxMemoryData1['ID_MAN'];  //    TcxGridDBTableView(CParam.PGrid).Controller.SelectedRows[i].Values[7];
                StProc.ParamByName('ID_STUD_V').AsInt64  := RxMemoryData1['ID_STUD']; //    TcxGridDBTableView(CParam.PGrid).Controller.SelectedRows[i].Values[8];
                StProc.ExecProc;
                StProc.Transaction.Commit;
              except
                StProc.Transaction.rollback;
                TcxMemo(CParam.PMemo).Lines.Append('Помилка: неможливо видалити - '+RxMemoryData1['FIO']);
                exit;
              end;

            end;
          DM.RxMemoryData1.Delete;
        end
      else
        begin
          focus:= DM.RxMemoryData1['ID_MAN'];
          //DM.RxMemoryData1.Next;
          TcxGridDBTableView(CParam.PGrid).Controller.GoToNext(True,True);
        end

    end;

  with DM do
  try
    Stream:=TMemoryStream.Create;
    TcxMemo(CParam.PMemo).Lines.SaveToStream(Stream);
    StProc.Transaction.StartTransaction;
    StProc.StoredProcName:='GR_MASS_PAYMENT_U';             //добавление отчета при редактировании
    StProc.Prepare;
    StProc.ParamByName('ID_GR_MASS_PAYMENT').AsInt64 :=   DSetEditPayment['ID_GR_MASS_PAYMENT'];
    StProc.ParamByName('OTCHET').LoadFromStream(Stream);
    StProc.ExecProc;
    StProc.Transaction.Commit;
  except
    StProc.Transaction.Rollback;
    TcxMemo(CParam.PMemo).Lines.Append('Помилка: неможливо додати протокол видалення записів');
  end;
  Stream.Free;
  TcxMemo(CParam.PMemo).Lines.Append('Операцію завершено  '+DateToStr(Now)+'  в  '+TimeToStr(Now));

  DM.RxMemoryData1.Locate('ID_MAN',focus,[]);
  TcxGridDBTableView(CParam.PGrid).DataController.DataSource:=DM.DSourceStudEdit;
end;

end.

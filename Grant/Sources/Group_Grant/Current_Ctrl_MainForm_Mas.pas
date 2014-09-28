//******************************************************************************
//                               Пакет для редактирования записи
//                   из таблицы Z_Current - зарплатные текущие выплаты
// Параметры: AOwner - компонент от которого создается форма для редактирования
//            DB_Handle - база для подключения
//            AZControlFormStyle - тип формы: редактрирование, удаление, добавление, просмотр
//            AID - если добавление, то RMoving, иначе ID_Current
//******************************************************************************

unit Current_Ctrl_MainForm_Mas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons, Registry,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  cxDBEdit, cxSpinEdit, cxMemo, Dates, cxCalc, FIBQuery, pFIBQuery,
  pFIBStoredProc, gr_uMessage, ActnList, gr_uCommonConsts,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridDBTableView, cxGrid, Unit_NumericConsts,
  dxStatusBar, Menus, gr_uCommonProc, cxGridBandedTableView,
  cxGridDBBandedTableView, ZProc, gr_dmCommonStyles, cxCheckBox, gr_Stud_Group_DM,
  gr_uCommonLoader, gr_uWaitForm, RxMemDS;

type
  TFgrCurrentCtrlMas = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    PrikazBox: TcxGroupBox;
    EditPrikaz: TcxMaskEdit;
    LabelPrikaz: TcxLabel;
    LabelPeriod: TcxLabel;
    MonthesList: TcxComboBox;
    YearSpinEdit: TcxSpinEdit;
    LabelSumma: TcxLabel;
    EditSumma: TcxMaskEdit;
    Bevel2: TBevel;
    ActionList1: TActionList;
    Action1: TAction;
    cxStyleRepository1: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    BoxChild: TcxGroupBox;
    EditSmeta: TcxButtonEdit;
    LabelSmeta: TcxLabel;
    LabelSmetaName: TcxLabel;
    LabelVidOpl: TcxLabel;
    EditVidOpl: TcxButtonEdit;
    LabelVidOplName: TcxLabel;
    dxStatusBar1: TdxStatusBar;
    CheckBoxMonthFinish: TcxCheckBox;
    Action3: TAction;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action1Execute(Sender: TObject);
    procedure EditVidOplExit(Sender: TObject);
    procedure EditSmetaExit(Sender: TObject);
    procedure MonthesListExit(Sender: TObject);
    procedure EditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RestoreFromBuffer(Sender:TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
  private
    FRes:variant;
    StylesDM:TStylesDM;
    CParam :TParamGG;
    procedure WResult(const Value: Variant);
    function RResult: Variant;
    procedure Update_Mas_Payment();
    procedure Delete_Mas_Payment;
  public
    Pcfs:TZControlFormStyle;
    PId_VidOpl:LongWord;
    PId_Smeta:LongWord;
    PId_Man:LongWord;
    PIdStud:int64;
    PIdCurrent:int64;
    PParameter:TZCurrentParameters;
    PLanguageIndex:Byte;
    PKodSetup:integer;


    Constructor Create(BParam:TParamGG);reintroduce;
    function DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:integer):boolean;
    function PrepareData(Db_Handle:TISC_DB_HANDLE):boolean;
    property Res:Variant read RResult write WResult;
  end;

  function ViewCurrentCtrlMas(BParam:TParamGG):Variant;stdcall;
  exports  ViewCurrentCtrlMas;

implementation



uses Math;

{$R *.dfm}


function ViewCurrentCtrlMas(BParam:TParamGG):Variant;stdcall;
var Form:TFgrCurrentCtrlMas;
begin
  Form:=TFgrCurrentCtrlMas.Create(BParam);
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

function TFgrCurrentCtrlMas.DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:integer):boolean;
var PLanguageIndex:byte;
begin
 {Result:=False;
 PLanguageIndex := IndexLanguage;
 if grShowMessage(Caption_Delete[PLanguageIndex],
                  DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbCancel])=mrYes then
  begin
   //DM := TDM.Create(self);
   with DM do
    try
     Result:=True;
     DB.Handle:=Db_Handle;
     StProc.Transaction.StartTransaction;
     StProc.StoredProcName:='GR_CURRENT_D';
     StProc.Prepare;
     StProc.ParamByName('ID_CURRENT').AsInteger:=Id;
     StProc.ExecProc;
     StProc.Transaction.Commit;
    except
     on E:Exception do
      begin
       grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOK]);
       StProc.Transaction.Rollback;
       Result:=False;
      end;
     end;
   DM.Destroy;
  end;  }
end;

constructor TFgrCurrentCtrlMas.Create(BParam:TParamGG);
begin

 inherited Create(BParam.owner);
 PLanguageIndex:= IndexLanguage;
//******************************************************************************
 EditSumma.Properties.EditMask := '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+grSystemDecimalSeparator+']\d\d?)?';
//******************************************************************************
 LabelSumma.Caption      := LabelSumma_Caption[PLanguageIndex];
 LabelVidOpl.Caption     := LabelVidOpl_Caption[PLanguageIndex];
 LabelSmeta.Caption      := LabelSmeta_Caption[PLanguageIndex];
 //LabelManMoving.Caption  := LabelStudentMoving_Caption[PLanguageIndex];
 LabelPeriod.Caption     := LabelPeriod_Caption[PLanguageIndex];
 LabelPrikaz.Caption     := LabelPrikaz_Caption[PLanguageIndex];
 CheckBoxMonthFinish.Properties.Caption := LabelMonthFinish_Caption[PLanguageIndex];

 CParam:=BParam;

 MonthesList.Properties.Items.Text := MonthesList_Text[PLanguageIndex];
 YesBtn.Caption            := YesBtn_Caption[PLanguageIndex];
 YesBtn.Hint               := YesBtn.Caption;
 CancelBtn.Caption         := CancelBtn_Caption[PLanguageIndex];
 CancelBtn.Hint            := CancelBtn.Caption+' (Esc)';
//******************************************************************************
 //dxStatusBar1.Panels[0].Text := 'F9 - '+ToBuffer_Caption[PLanguageIndex];
 dxStatusBar1.Panels[0].Text := 'F10 - '+YesBtn.Caption;
 dxStatusBar1.Panels[1].Text := 'Esc - '+CancelBtn.Caption;

end;

function TFgrCurrentCtrlMas.PrepareData(Db_Handle:TISC_DB_HANDLE):boolean;
var CurrKodSetup:integer;
    FieldValue:Variant;
begin
 Result:=False;
 CurrKodSetup := ValueFieldZSetup(Db_Handle,'GR_KOD_SETUP');
 MonthesList.ItemIndex := YearMonthFromKodSetup(CurrKodSetup,False)-1;
 YearSpinEdit.Value    := YearMonthFromKodSetup(CurrKodSetup);
 PKodSetup := CurrKodSetup;
 FieldValue := ValueFieldZSetup(Db_Handle,'GR_DEFAULT_SMETA');
 if not VarIsNULL(FieldValue) then
  begin
   EditSmeta.Text := VarToStr(FieldValue);
   EditSmetaExit(self);
  end;
 Result:=True;



end;

procedure TFgrCurrentCtrlMas.CancelBtnClick(Sender: TObject);
begin
  ModalResult  := mrCancel;
end;

procedure TFgrCurrentCtrlMas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //DM.Free;
end;

procedure TFgrCurrentCtrlMas.Action1Execute(Sender: TObject);
var wf:TForm;
ID_CURRENT,ID_GR_MASS_PAYMENT:variant;
Stream: TMemoryStream;
t:integer;
begin
  if EditSumma.Text='' then
   begin
    grShowMessage(ECaption[PLanguageIndex],ESummaInput_Text[PLanguageIndex],mtInformation,[mbOK]);
    EditSumma.SetFocus;
    Exit;
   end;
  if PId_VidOpl=0 then
   begin
    grShowMessage(ECaption[PLanguageIndex],EVidOplInput_Text[PLanguageIndex],mtInformation,[mbOK]);
    EditVidOpl.SetFocus;
    Exit;
   end;
  if PId_Smeta=0 then
   begin
    grShowMessage(ECaption[PLanguageIndex],ESmetaInput_Text[PLanguageIndex],mtInformation,[mbOK]);
    EditSmeta.SetFocus;
    Exit;
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
        StProc2.ParamByName('KOD_SETUP').AsInteger        := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
        StProc2.ParamByName('END_MONTH').AsString         := IfThen(CheckBoxMonthFinish.Checked,'T','F');
        StProc2.ParamByName('SUMMA').AsCurrency           := StrToFloat(EditSumma.Text);
        StProc2.ParamByName('PRIKAZ').AsString            := EditPrikaz.Text;
        StProc2.ParamByName('ID_VIDOPL').AsInteger        := PId_VidOpl;
        StProc2.ParamByName('ID_SMETA').AsInt64           := PId_Smeta;
        StProc2.ParamByName('TYPE_MASS_PAYMENT').AsString := 'P';
        StProc2.ExecProc;
        ID_GR_MASS_PAYMENT := StProc2.ParamByName('ID_GR_MASS_PAYMENT').AsInt64;
        StProcTransaction.Commit;
        WResult(ID_GR_MASS_PAYMENT);
      except
        TcxMemo(CParam.PMemo).Lines.Append('Помилка:      неможливо додати масовоу поточну виплату');
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
                DSetMoving.Close;
                DSetMoving.SQLs.SelectSQL.Text := 'SELECT * FROM GR_CN_DT_STUD_INF_S_BY_STUD_KS('+
                RxMemoryData1['ID_STUD']+',NULL)';
                DSetMoving.Open;

                StProcTransaction.StartTransaction;
                StProc.StoredProcName:='GR_CURRENT_I';
                StProc.Prepare;
                StProc.ParamByName('KOD_SETUP').AsInteger     := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
                StProc.ParamByName('KOD_SETUP_O1').AsVariant  := NULL;
                StProc.ParamByName('KOD_SETUP_O2').AsVariant  := NULL;
                StProc.ParamByName('ID_MAN').AsVariant        := NULL;
                StProc.ParamByName('SUMMA').AsCurrency        := StrToFloat(EditSumma.Text);
                StProc.ParamByName('ID_CATEGORY').AsVariant   := DSetMoving['ID_KAT_STUD'];
                StProc.ParamByName('ID_POST').AsVariant       := NULL;
                StProc.ParamByName('ID_DEPARTMENT').AsVariant := NULL;
                StProc.ParamByName('ID_SMETA').AsInt64        := PId_Smeta;
                StProc.ParamByName('ID_ACCOUNT').AsVariant    := NULL;
                StProc.ParamByName('ID_STUD_INF').AsInt64     := DSetMoving['ID_STUD_INF'];
                StProc.ParamByName('ID_STUD').AsVariant       := NULL;
                StProc.ParamByName('TAX_TEXT').AsVariant      := NULL;
                StProc.ParamByName('P_OLD').AsString          := 'F';
                StProc.ParamByName('ID_VIDOPL').AsInteger     := PId_VidOpl;
                StProc.ParamByName('PRIKAZ').AsString         := EditPrikaz.Text;
                StProc.ParamByName('NOW_PAY').AsString        := CheckBoxMonthFinish.EditValue;
                StProc.ExecProc;
                ID_CURRENT:= StProc.ParamByName('ID_CURRENT').AsVariant;

                StProc3.StoredProcName:='GR_MASS_PAYMENT_MAN_I';
                StProc3.Prepare;
                StProc3.ParamByName('ID_GR_MASS_PAYMENT').AsInt64 :=   ID_GR_MASS_PAYMENT;
                StProc3.ParamByName('ID_MAN').AsInt64 :=               RxMemoryData1['ID_MAN'];
                StProc3.ParamByName('ID_STUD').AsInt64 :=              RxMemoryData1['ID_STUD'];
                StProc3.ParamByName('ID_VIPL').AsInt64 :=              StrToInt64(VarToStr(ID_CURRENT));
                StProc3.ExecProc;
                StProcTransaction.Commit;
              except
                TcxMemo(CParam.PMemo).Lines.Append('Помилка:     неможливе додання людини - '+RxMemoryData1['FIO']);
                ID_CURRENT:=NULL;
                StProcTransaction.Rollback;
              end;

              if ID_CURRENT<>null then
                try
                  StProcTransaction.StartTransaction;
                  StProcImport.StoredProcName:='GR_CURRENT_PERESECH';
                  StProcImport.Prepare;
                  StProcImport.ParamByName('ID').AsInt64        := StrToInt64(VarToStr(ID_CURRENT)); //IFThen(isNull(ResCurr),0,ResCurr;
                  StProcImport.ExecProc;
                  if StProcImport.ParamByName('RES').AsInteger=1 then TcxMemo(CParam.PMemo).Lines.Append('Попередження: пересічення термінів - '+RxMemoryData1['FIO']);
                  StProcTransaction.Commit;
                except
                  StProcTransaction.Rollback;
                  TcxMemo(CParam.PMemo).Lines.Append('Попередження: помилка перевірення пересічення термінів - '+RxMemoryData1['FIO']);
                end;

              ID_CURRENT:=Null;
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



procedure TFgrCurrentCtrlMas.Update_Mas_Payment;
var t,CurrKodSetup:integer;
ID_CURRENT:variant;
wf:TForm;
Stream:TMemoryStream;
begin
  with DM do
    begin
      CurrKodSetup := DM.DSetEditPayment['KOD_SETUP']; //ValueFieldZSetup(Db_Handle,'GR_KOD_SETUP');
      MonthesList.ItemIndex := YearMonthFromKodSetup(CurrKodSetup,False)-1;
      YearSpinEdit.Value    := YearMonthFromKodSetup(CurrKodSetup);
      EditSumma.Text:=  FloatToStr(DSetEditPayment['SUMMA']);
      PId_Smeta:=       DSetEditPayment['ID_SMETA'];
      PId_VidOpl:=      DSetEditPayment['ID_VIDOPL'];
      EditPrikaz.Text:= DSetEditPayment['PRIKAZ'];
      if DSetEditPayment['END_MONTH']='Так'
        then CheckBoxMonthFinish.EditValue:='T'
      else if DSetEditPayment['END_MONTH']='Ні'
        then CheckBoxMonthFinish.EditValue:='F';
    end;

  wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);
  TcxMemo(CParam.PMemo).Lines.Append('Оновлення масової виплати '+DateToStr(Now)+'  в  '+TimeToStr(Now));
  TcxGridDBTableView(CParam.PGrid).Controller.GoToFirst;

  For t:=0 to  TcxGridDBTableView(CParam.PGrid).DataController.RowCount-1 do
    with DM do
      begin
        if  (TcxGridDBTableView(CParam.PGrid).DataController.Controller.FocusedRecord.Values[0]=Checked)
        and  (TcxGridDBTableView(CParam.PGrid).DataController.Controller.FocusedRecord.Values[9]<>CheckedColor)
          then
            try
              DSetMoving.Close;
              DSetMoving.SQLs.SelectSQL.Text := 'SELECT * FROM GR_CN_DT_STUD_INF_S_BY_STUD_KS('+
              RxMemoryData1['ID_STUD']+',NULL)';
              DSetMoving.Open;

              StProcTransaction.StartTransaction;
              StProc.StoredProcName:='GR_CURRENT_I';
              StProc.Prepare;
              StProc.ParamByName('KOD_SETUP').AsInteger   := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
              StProc.ParamByName('KOD_SETUP_O1').AsVariant  := NULL;
              StProc.ParamByName('KOD_SETUP_O2').AsVariant  := NULL;
              StProc.ParamByName('ID_MAN').AsVariant        := NULL;
              StProc.ParamByName('SUMMA').AsCurrency        := StrToFloat(EditSumma.Text);
              StProc.ParamByName('ID_CATEGORY').AsVariant   := DSetMoving['ID_KAT_STUD'];
              StProc.ParamByName('ID_POST').AsVariant       := NULL;
              StProc.ParamByName('ID_DEPARTMENT').AsVariant := NULL;
              StProc.ParamByName('ID_SMETA').AsInt64        := PId_Smeta;
              StProc.ParamByName('ID_ACCOUNT').AsVariant    := NULL;
              StProc.ParamByName('ID_STUD_INF').AsInt64     := DSetMoving['ID_STUD_INF'];
              StProc.ParamByName('ID_STUD').AsVariant       := NULL;
              StProc.ParamByName('TAX_TEXT').AsVariant      := NULL;
              StProc.ParamByName('P_OLD').AsString          := 'F';
              StProc.ParamByName('ID_VIDOPL').AsInteger     := PId_VidOpl;
              StProc.ParamByName('PRIKAZ').AsString         := EditPrikaz.Text;
              StProc.ParamByName('NOW_PAY').AsString        := CheckBoxMonthFinish.EditValue;
              StProc.ExecProc;
              ID_CURRENT:= StProc.ParamByName('ID_CURRENT').AsVariant;

              StProc3.StoredProcName:='GR_MASS_PAYMENT_MAN_I';
              StProc3.Prepare;
              StProc3.ParamByName('ID_GR_MASS_PAYMENT').AsInt64 :=   DSetEditPayment['ID_GR_MASS_PAYMENT'];
              StProc3.ParamByName('ID_MAN').AsInt64 :=               RxMemoryData1['ID_MAN'];
              StProc3.ParamByName('ID_STUD').AsInt64 :=              RxMemoryData1['ID_STUD'];
              StProc3.ParamByName('ID_VIPL').AsInt64 :=              StrToInt64(VarToStr(ID_CURRENT));
              StProc3.ExecProc;
              StProcTransaction.Commit;

              if ID_CURRENT<>null then
                try
                  StProcTransaction.StartTransaction;
                  StProcImport.StoredProcName:='GR_CURRENT_PERESECH';
                  StProcImport.Prepare;
                  StProcImport.ParamByName('ID').AsInt64        := StrToInt64(VarToStr(ID_CURRENT)); //IFThen(isNull(ResCurr),0,ResCurr;
                  StProcImport.ExecProc;
                  if StProcImport.ParamByName('RES').AsInteger=1 then TcxMemo(CParam.PMemo).Lines.Append('Попередження: пересічення термінів - '+RxMemoryData1['FIO']);
                  StProcTransaction.Commit;
                except
                  StProcTransaction.Rollback;
                  TcxMemo(CParam.PMemo).Lines.Append('Попередження: помилка перевірення пересічення термінів - '+RxMemoryData1['FIO']);
                end;

              ID_CURRENT:=Null;

              RxMemoryData1.Edit;
              RxMemoryData1['CHECKBOXCOLOR']:=CheckedColor;
              RxMemoryData1.Post;
            except
              TcxMemo(CParam.PMemo).Lines.Append('Попередження: помилка перевірення пересічення термінів - '+RxMemoryData1['FIO']);
              StProcTransaction.Rollback;
            end;

        TcxGridDBTableView(CParam.PGrid).Controller.GoToNext(True,True);
      end;
      TcxMemo(CParam.PMemo).Lines.Append('Операцію завершено  '+DateToStr(Now)+'  в  '+TimeToStr(Now));

      with DM do
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

  CloseWaitForm(wf);
end;

procedure TFgrCurrentCtrlMas.EditVidOplExit(Sender: TObject);
var Vo:variant;
begin
 if EditVidOpl.Text<>'' then
  begin
   VO:=VoByKod(StrToInt(EditVidOpl.Text),
               Date,
               DM.DB.Handle,
               ValueFieldZSetup(DM.DB.Handle,'GR_ID_SYSTEM'),
               0);
   if not VarIsNull(VO) then
    begin
     PId_VidOpl:=VO[0];
     LabelVidOplName.Caption:=VarToStr(VO[2]);
    end
   else
    EditVidOpl.SetFocus;
  end;
end;

procedure TFgrCurrentCtrlMas.EditSmetaExit(Sender: TObject);
var Smeta:variant;
begin
 if EditSmeta.Text<>'' then
  begin
   Smeta:=SmetaByKod(StrToInt(EditSmeta.Text),DM.DB.Handle);
   if not VarIsNull(Smeta) then
    begin
     PId_Smeta:=Smeta[0];
     LabelSmetaName.Caption:=VarToStr(Smeta[2]);
    end
   else
    EditSmeta.SetFocus;
  end
end;

procedure TFgrCurrentCtrlMas.MonthesListExit(Sender: TObject);
begin
if PKodSetup=PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1) then Exit
else PKodSetup:=PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
if DM.DSetMoving.Active then DM.DSetMoving.Close;
   DM.DSetMoving.SQLs.SelectSQL.Text:='SELECT * FROM GR_CN_DT_STUD_INF_S_BY_STUD_KS('+
                                        IntToStr(PIdStud)+','+IntToStr(PKodSetup)+') order by DATE_END';
   DM.DSetMoving.Open;
   DM.DSetMoving.Last;
end;

procedure TFgrCurrentCtrlMas.EditSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
begin
Smeta:=GetSmets(self,DM.DB.Handle,Date,psmSmet);
if VarArrayDimCount(Smeta)> 0 then
 If Smeta[0]<>NULL then
  begin
   EditSmeta.Text         := Smeta[3];
   LabelSmetaName.Caption := Smeta[2];
   PId_Smeta              := Smeta[0];
  end;
end;

procedure TFgrCurrentCtrlMas.EditVidOplPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var VidOpl:Variant;
begin
VidOPl:=LoadVidOpl(self,
                   DM.DB.Handle,
                   zfsModal,
                   0,
                   ValueFieldZSetup(DM.DB.Handle,'GR_ID_SYSTEM'));
if VarArrayDimCount(VidOpl)> 0 then
 if VidOpl[0]<> NULL then
  begin
   EditVidOpl.Text     := VidOpl[2];
   LabelVidOplName.Caption := VidOpl[1];
   PId_VidOpl          := VidOpl[0];
  end;
end;

procedure TFgrCurrentCtrlMas.RestoreFromBuffer(Sender:TObject);
var reg:TRegistry;
    Kod:integer;
    Key:string;
begin
{
  Key := '\Software\Grant\GroupGrant\CurrentCtrl';

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

 EditSmeta.Text := reg.ReadString('KodSmeta');
 EditSmetaExit(sender);

 EditVidOpl.Text := reg.ReadString('KodVidOpl');
 EditVidOplExit(sender);

 EditPrikaz.Text := reg.ReadString('Prikaz');
 CheckBoxMonthFinish.EditValue := reg.ReadString('EndMonth');

 EditSumma.Text:= reg.ReadString('Summa');

  Kod := reg.ReadInteger('KodSetup');
  if Kod>0 then
   begin
    MonthesList.ItemIndex := YearMonthFromKodSetup(Kod,False)-1;
    YearSpinEdit.Value := YearMonthFromKodSetup(Kod);
   end;

 editSumma.SetFocus;
 Reg.Free;     }
end;

procedure TFgrCurrentCtrlMas.Action2Execute(Sender: TObject);
var reg: TRegistry;
    Key:string;
begin
{  CancelBtn.SetFocus;
  Key := '\Software\Grant\GroupGrant\CurrentCtrl';

 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey(Key,True);
  reg.WriteString('IsBuffer','1');
  reg.WriteString('KodSmeta',EditSmeta.Text);
  reg.WriteString('KodVidOpl',EditVidOpl.Text);
  reg.WriteInteger('KodSetup',PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1));
  reg.WriteString('Prikaz',EditPrikaz.Text);
  reg.WriteString('EndMonth',CheckBoxMonthFinish.EditValue);
  reg.WriteString('Summa',EditSumma.Text);
 finally
  reg.Free;
 end;          }
end;

procedure TFgrCurrentCtrlMas.FormShow(Sender: TObject);
begin
 //RestoreFromBuffer(self);
 FormResize(sender);
// F:=False;
end;

procedure TFgrCurrentCtrlMas.FormResize(Sender: TObject);
var i:integer;
begin
for i:=0 to dxStatusBar1.Panels.Count-1 do
    dxStatusBar1.Panels[i].Width := Width div dxStatusBar1.Panels.Count;
end;

procedure TFgrCurrentCtrlMas.Action3Execute(Sender: TObject);
var F:boolean;
begin
  if (CancelBtn.Focused=False) and (YesBtn.focused=False) and (CheckBoxMonthFinish.Focused=False) and
(YearSpinEdit.focused=False) and (MonthesList.focused=False) and (EditSumma.focused=False) and
(EditPrikaz.focused=False) and (EditVidOpl.focused=False) and (EditSmeta.focused=False)
then F:=True; 
if CancelBtn.focused=true then close();
if YesBtn.focused=true then Action1.Execute;
if F=true then
  begin
  YesBtn.SetFocus;
  F:=False;
  exit;
  end;
if CheckBoxMonthFinish.Focused=true then begin YesBtn.SetFocus; F:=True; exit; end;
if YearSpinEdit.focused=true then begin CheckBoxMonthFinish.SetFocus; exit; end;
if MonthesList.focused=true then begin YearSpinEdit.SetFocus; exit; end;
if EditSumma.focused=true then begin MonthesList.SetFocus; exit; end;
if EditPrikaz.focused=true then begin EditSumma.SetFocus; exit; end;
if EditVidOpl.focused=true then begin EditPrikaz.SetFocus; exit; end;
if EditSmeta.focused=true then begin EditVidOpl.SetFocus; exit; end;

if CancelBtn.focused=true then EditSmeta.SetFocus;
end;


function TFgrCurrentCtrlMas.RResult: Variant;
begin
  result:=FRes;
end;

procedure TFgrCurrentCtrlMas.WResult(const Value: Variant);
begin
  FRes:=Value;
end;



procedure TFgrCurrentCtrlMas.Delete_Mas_Payment;
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
  //TcxGridDBTableView(CParam.PGrid).DataController.DataSource:=DM.DSourceStudEdit;
end;

end.

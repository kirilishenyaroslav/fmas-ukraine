unit IndexActsCtrl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxDropDownEdit,
  cxCalendar, cxSpinEdit, cxTextEdit, cxMaskEdit, cxContainer, cxEdit,
  cxLabel, ExtCtrls, cxControls, cxGroupBox, cxButtonEdit, Kernel,
  Unit_ZGlobal_Consts, IBase, PackageLoad, FIBQuery, pFIBQuery,ZTypes,
  pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  ZMessages, ActnList, IndexActsCtrl_DM, zProc, ComCtrls, cxCheckBox;

type
  TFIndexActsControl = class(TForm)
    PeriodBox: TcxGroupBox;
    DateBegLabel: TcxLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    DateBeg: TDateTimePicker;
    DateEnd: TDateTimePicker;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    EditSumma: TcxMaskEdit;
    cxMaskEdit1: TcxMaskEdit;
    cxCheckBox0: TcxCheckBox;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    CancelBtn: TcxButton;
    YesBtn: TcxButton;
    procedure CancelBtnClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure CheckBoxMonthFinishPropertiesChange(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
  private
    PParameter:TZIndexParameters;
    DM:TDM_Ctrl;
    PLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AParameter:TZIndexParameters);reintroduce;
    property Parameter:TZIndexParameters read PParameter;
  end;


implementation

uses dateUtils;

{$R *.dfm}

constructor TFIndexActsControl.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AParameter:TZIndexParameters);
var RecInfo:RECORD_INFO_STRUCTURE;
    DecimalSeparator:string;
    curzp_date:TDateTime;
    CurPeriodInfo:TpFibDataSet;
    KodSetup:Integer;
begin
     inherited Create(AOwner);
     PParameter:=AParameter;
     PLanguageIndex:=LanguageIndex;
     //******************************************************************************
     //DateBegLabel.Caption:='Розрахунковий період';
     //DateEndLabel.Caption:='Базовий період індексаці';
     YesBtn.Caption:=YesBtn_Caption[PLanguageIndex];
     //******************************************************************************
     //100,00 | \d\d? ([,]\d\d?)?
     DecimalSeparator := ZSystemDecimalSeparator;
    //******************************************************************************
     DM:=TDM_Ctrl.Create(self,ADB_HANDLE,PParameter);
     case PParameter.ControlFormStyle of
     zcfsInsert:
      begin
           cxCheckBox0.Checked:=False;
           cxCheckBox1.Checked:=False;
           cxCheckBox2.Checked:=False;
           cxMaskEdit1.Enabled:=False;
           EditSumma.Enabled:=False;
           DateEnd.Enabled:=False;
           CancelBtn.Caption:= CancelBtn_Caption[PLanguageIndex];
           DateBeg.Date    := EncodeDate(YearOf(Date),MonthOf(Date),1);
           DateEnd.Date    := EncodeDate(YearOf(Date),MonthOf(Date),1);
           CancelBtn.Caption:= CancelBtn_Caption[PLanguageIndex];
      end;
     zcfsUpdate:
      begin
           DateBeg.Date    := PParameter.ActualDate;
           DateBeg.Enabled := false;
           if PParameter.IS_HAND_EDIT=False then
            begin
              cxCheckBox0.Checked:=False;
              DateEnd.Enabled:=False;
            end
           else
            begin
              cxCheckBox0.Checked:=true;
              DateEnd.Enabled:=true;
            end;
           if PParameter.SUMMA_IND_FACT_BOOL=False then
            begin
              //EditSumma.Enabled:=False;
              cxCheckBox1.Checked:=False;
            end;
           if PParameter.SUMMA_IND_FIX_BOOL=False then
            begin
              //cxMaskEdit1.Enabled:=False;
              cxCheckBox2.Checked:=False;
            end;
           DateEnd.Date    := PParameter.IndexBaseDate;
           EditSumma.text  := PParameter.SUMMA_IND_FACT;
           cxMaskEdit1.text:= PParameter.SUMMA_IND_FIX;
           CancelBtn.Caption:= CancelBtn_Caption[PLanguageIndex];
      end;
     zcfsShowDetails:
      begin
           YesBtn.Visible:=False;
           CancelBtn.Caption:= ExitBtn_Caption[PLanguageIndex];
      end;
     end;
     YesBtn.Hint := YesBtn.Caption;
     CancelBtn.Hint := CancelBtn.Caption+' (Esc)';

     WorkDatabase.Handle:=ADB_HANDLE;
     ReadTransaction.StartTransaction;

     CurPeriodInfo:=TpFibDataSet.Create(self);
     CurPeriodInfo.Database:=WorkDatabase;
     CurPeriodInfo.Transaction:=ReadTransaction;
     CurPeriodInfo.SelectSQL.Text:='SELECT * FROM Z_KOD_SETUP_RETURN';
     CurPeriodInfo.Open;
     if (CurPeriodInfo.RecordCount>0)
     then begin
               KodSetup:=CurPeriodInfo.FieldByName('KOD_SETUP').Value;
               CurPeriodInfo.Close;
               CurPeriodInfo.SelectSQL.Text:='SELECT OUT_DATE FROM Z_CONVERT_KOD_TO_DATE('+IntToStr(KodSetup)+')';
               CurPeriodInfo.Open;
               if (CurPeriodInfo.RecordCount>0)
               then begin
                         curzp_date:=CurPeriodInfo.FieldByName('OUT_DATE').Value;
               end
               else curzp_date:=Date;
               CurPeriodInfo.Close;
     end;
     if CurPeriodInfo.Active then CurPeriodInfo.Close;
     CurPeriodInfo.Free;

     DateBeg.MinDate:=IncMonth(curzp_date,-50);
     DateEnd.MinDate:=IncMonth(curzp_date,-50);
end;

procedure TFIndexActsControl.CancelBtnClick(Sender: TObject);
begin
 ModalResult          := mrCancel;
end;

procedure TFIndexActsControl.Action1Execute(Sender: TObject);
var TId:Integer;
begin
     case PParameter.ControlFormStyle of
     zcfsInsert:
                with DM do
                try
                       StoredProc.Transaction.StartTransaction;
                       StoredProc.StoredProcName                       := 'Z_INDEX_ACTS_INS';
                       StoredProc.Prepare;
                       StoredProc.ParamByName('ID_MAN').AsInteger      := PParameter.ID_man;
                       StoredProc.ParamByName('kod_setup').AsDate      := DateBeg.Date;
                       if cxCheckBox0.checked then
                        StoredProc.ParamByName('BASE_KOD_SETUP').AsDate := DateEnd.Date;

                       if cxCheckBox1.checked then
                        if EditSumma.text<>'' then
                          StoredProc.ParamByName('SUMMA_IND_FACT').AsCurrency:= StrToFloat(EditSumma.text)
                        else
                          begin
                            ShowMessage('"Сума фактична" не заповнена');
                            EditSumma.SetFocus;
                            Exit;
                          end;
                          
                       if cxCheckBox2.checked then
                        if cxMaskEdit1.text<>'' then
                          StoredProc.ParamByName('SUMMA_IND_FIX').AsCurrency := StrToFloat(cxMaskEdit1.text)
                        else
                          begin
                            ShowMessage('"Сума фіксована" не заповнена');
                            cxMaskEdit1.SetFocus;
                            Exit;
                          end;
                       StoredProc.ExecProc;
                       TID:=StoredProc.ParamByName('ID_record').AsInt64;                       
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
                       StoredProc.StoredProcName                            := 'Z_INDEX_ACTS_UPD';
                       StoredProc.Prepare;
                       StoredProc.ParamByName('ID_man').AsInt64             := PParameter.id_man;
                       StoredProc.ParamByName('ID_record').AsInt64          := PParameter.id;
                       StoredProc.ParamByName('KOD_SETUP_DATE').AsDate      := DateBeg.Date;
                       if cxCheckBox0.checked then
                        StoredProc.ParamByName('BASE_KOD_SETUP_DATE').AsDate := DateEnd.Date
                       else StoredProc.ParamByName('BASE_KOD_SETUP_DATE').AsVariant :=null;
                       if cxCheckBox2.checked then
                        begin
                        if cxMaskEdit1.text<>'' then
                          StoredProc.ParamByName('SUMMA_IND_FIX').AsCurrency := StrToFloat(cxMaskEdit1.text)
                        else
                          begin
                            ShowMessage('"Сума фіксована" не заповнена');
                            cxMaskEdit1.SetFocus;
                            Exit;
                          end;
                        end
                       else StoredProc.ParamByName('SUMMA_IND_FIX').AsVariant := NULL;

                       if cxCheckBox1.checked then
                        if EditSumma.text<>'' then
                          StoredProc.ParamByName('SUMMA_IND_FACT').AsCurrency:= StrToFloat(EditSumma.text)
                        else
                          begin
                            ShowMessage('"Сума фактична" не заповнена');
                            EditSumma.SetFocus;
                            Exit;
                          end
                       else StoredProc.ParamByName('SUMMA_IND_FACT').AsVariant:= NULL;
                       StoredProc.ExecProc;
                       TID:=StoredProc.ParamByName('ID_record_out').AsInt64;
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
end;
end;

procedure TFIndexActsControl.FormCreate(Sender: TObject);
var RecInfo:RECORD_INFO_STRUCTURE;
begin
if PParameter.ControlFormStyle=zcfsDelete then
 begin
  with DM do
  try
         StoredProc.Transaction.StartTransaction;
         StoredProc.StoredProcName                       := 'Z_INDEX_ACTS_DEL';
         StoredProc.Prepare;
         StoredProc.ParamByName('ID_RECORD').AsInteger  := PParameter.ID;
         StoredProc.ExecProc;
         StoredProc.Transaction.Commit;
         ModalResult:=mrYes;
         PParameter.ID:=-1;
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

procedure TFIndexActsControl.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

procedure TFIndexActsControl.Action2Execute(Sender: TObject);
begin
     if  YesBtn.Focused Then Action1Execute(Sender);
     if  CancelBtn.Focused Then CancelBtnClick(Sender);
     SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

procedure TFIndexActsControl.CheckBoxMonthFinishPropertiesChange(
  Sender: TObject);
begin
  DateEnd.Enabled:=not DateEnd.Enabled;
end;

procedure TFIndexActsControl.cxCheckBox1PropertiesChange(Sender: TObject);
begin
 EditSumma.enabled:= not  EditSumma.enabled;
end;

procedure TFIndexActsControl.cxCheckBox2PropertiesChange(Sender: TObject);
begin
  cxMaskEdit1.enabled:= not  cxMaskEdit1.enabled;
end;

end.

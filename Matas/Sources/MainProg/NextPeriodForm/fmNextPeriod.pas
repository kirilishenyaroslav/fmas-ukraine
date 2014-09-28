{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Главный модуль                                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit fmNextPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, uResources, DB, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, Kernel, FIBDatabase, pFIBDatabase,
  uSplash, uMatasVars, uMatasUtils, DateUtils, cxCheckBox, cxGroupBox,
  FR_DSet, FR_DBSet, FR_Class, uMatasPrintForm, ActnList, uPackageManager;

type
  TfrmNextPeriod = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    SchDataSet: TpFIBDataSet;
    WorkTransaction: TpFIBTransaction;
    SaldoDataSet: TpFIBDataSet;
    cxCloseSch: TcxCheckBox;
    cxSetPeriod: TcxCheckBox;
    Label1: TLabel;
    LabelPeriod: TLabel;
    cxButton1: TcxButton;
    CheckDataSet: TpFIBDataSet;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    cxCheckMBook: TcxCheckBox;
    procedure FormShow(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
   MatasMonth, MatasYear: Word;
  end;

var
  frmNextPeriod: TfrmNextPeriod;

implementation

uses dmMain;
{$R *.dfm}

procedure TfrmNextPeriod.FormShow(Sender: TObject);
var
 dd, dm, dy: word;
begin
 DecodeDate(_MATAS_PERIOD, dy, dm,  dd);
 IncAMonth(dy, dm, dd, 1);
 LabelPeriod.Caption:=GetMonthName(dm)+' '+IntToStr(dy);
end;

procedure TfrmNextPeriod.OkButtonClick(Sender: TObject);
var
 splash: TSplashForm;
 nrec: integer;
 dd, dm, dy: Word;
 NewDateRec, DateBeg, DateEnd: TDateTime;
 SCH_MNGR_STRU:KERNEL_SCH_MNGR_STRUCTURE;
 RES_STRU:RESULT_STRUCTURE;
 sch_saldo_in, sch_saldo_out, sch_db_oborot, sch_kr_oborot: Currency;
 flag: integer;
 res: Boolean;
begin
 splash:=TSplashForm.Create(self);
 splash.Title.Caption:='Перехід на наступний період';
 splash.MsgLabel.Caption:='Підготовка даних';
 splash.Show;
 splash.Update;
 DecodeDate(_MATAS_PERIOD, dy, dm,  dd);
 IncAMonth(dy, dm, dd, 1);
 NewDateRec:=StartOfAMonth(dy, dm);
 MatasMonth:=dm;
 MatasYear:=dy;
 DateBeg:=StartOfTheMonth(_MATAS_PERIOD);
 DateEnd:=EndOfTheMonth(_MATAS_PERIOD);
 flag:=0;

 if (cxCheckMBook.Checked) then
 begin
   Res:=uPackageManager.SaveMainBookInProv(self, dmMatas.fdbMatas.Handle, _CURRENT_USER_ID, _MATAS_PERIOD);
   if not res then Inc(flag);
 end;

 if cxCloseSch.Checked and (flag=0) then
 begin
  SchDataSet.Close;
  with SchDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_SP_SCH_SELECT(:PDATE)');
   Add('ORDER BY SCH_NUMBER');
  end;
  SaldoDataSet.Close;
  with SaldoDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_GET_SCH_SALDO_EX(:PDATE, :ID_SCH)');
  end;
  SaldoDataSet.Prepare;
  SchDataSet.Prepare;
  SchDataSet.ParamByName('PDATE').Value:=_MATAS_PERIOD;
  SchDataSet.CloseOpen(true);
  nrec:=SchDataSet.RecordCount;
  splash.Progress.Max:=nrec;
  // начинаем глоб. транзакцию
  WorkTransaction.StartTransaction;
  SchDataSet.First;
  while (not SchDataSet.Eof) and (flag=0) do
  begin
   splash.MsgLabel.Caption:='Закриваємо рахунок '+SchDataSet.FieldByName('SCH_NUMBER').AsString;
   splash.StepBy(1);
   splash.Update;
   SaldoDataSet.Close;
   SaldoDataSet.ParamByName('PDATE').Value:=_MATAS_PERIOD;
   SaldoDataSet.ParamByName('ID_SCH').Value:=SchDataSet.FieldByName('ID_SCH').AsInteger;
   SaldoDataSet.CloseOpen(true);
   sch_saldo_in:=SaldoDataSet.FieldByName('SCH_SALDO_IN').AsCurrency;
   sch_db_oborot:=SaldoDataSet.FieldByName('SCH_DB_OBOROT').AsCurrency;
   sch_kr_oborot:=SaldoDataSet.FieldByName('SCH_KR_OBOROT').AsCurrency;
   sch_saldo_out:=SaldoDataSet.FieldByName('SCH_SALDO_OUT').AsCurrency;
   SCH_MNGR_STRU.DBHANDLE:=dmMatas.fdbMatas.Handle;
   SCH_MNGR_STRU.TRHANDLE:=WorkTransaction.Handle;
   SCH_MNGR_STRU.MODE:=1; //закрываем
   SCH_MNGR_STRU.ID_SCH:=SchDataSet.FieldByName('ID_SCH').AsInteger;
   SCH_MNGR_STRU.DB_SALDO_IN:=sch_saldo_in;
   SCH_MNGR_STRU.KR_SALDO_IN:=0;
   SCH_MNGR_STRU.DB_OBOR:=sch_db_oborot;
   SCH_MNGR_STRU.KR_OBOR:=sch_kr_oborot;
   if sch_saldo_out>=0 then
   begin
    SCH_MNGR_STRU.DB_SALDO_OUT:=sch_saldo_out;
    SCH_MNGR_STRU.KR_SALDO_OUT:=0;
   end
   else
   begin
    SCH_MNGR_STRU.DB_SALDO_OUT:=0;
    SCH_MNGR_STRU.KR_SALDO_OUT:=abs(sch_saldo_out);
   end;
   try
    RES_STRU:=Kernel.SchManager(@SCH_MNGR_STRU);
   except
    //   WorkTransaction.Rollback;
    ModalResult:=mrCancel;
    Close;
   end;
   if RES_STRU.RESULT_CODE=0 then
   begin
    Inc(flag);
    ShowMessage(RES_STRU.RESULT_MESSAGE);
   end;
   SchDataSet.Next;
  end;
  if flag=0 then
   begin
    WorkTransaction.Commit;
   end
  else
   WorkTransaction.Rollback;

  if flag=0 then
  begin
   splash.MsgLabel.Caption:='Формується сальдо наступного періоду';
   splash.Update;
   SchDataSet.First;
   while (not SchDataSet.Eof) and (flag=0) do
   begin
    splash.MsgLabel.Caption:='Рахунок '+SchDataSet.FieldByName('SCH_NUMBER').AsString;
    splash.StepBy(1);
    splash.Update;
    try
     dmMatas.MatasStoredProc.Transaction.StartTransaction;
     dmMatas.MatasStoredProc.StoredProcName:='MAT_SET_SCH_SALDO_EX';
     dmMatas.MatasStoredProc.Prepare;
     dmMatas.MatasStoredProc.ParamByName('PDATE').Value:=_MATAS_PERIOD;
     dmMatas.MatasStoredProc.ParamByName('ID_SCH').Value:=SchDataSet.FieldByName('ID_SCH').AsInteger;
     dmMatas.MatasStoredProc.ExecProc;
     dmMatas.MatasStoredProc.Transaction.Commit;
    except on E : Exception
     do begin
      ShowMessage(E.Message);
      dmMatas.MatasStoredProc.Transaction.Rollback;
      Inc(flag);
      splash.Free;
      Exit;
     end;
    end;
    SchDataSet.Next;
   end;
   splash.MsgLabel.Caption:='Залишки по джерелам фінансування';
   splash.StepBy(1);
   splash.Update;
   try
     dmMatas.MatasStoredProc.Transaction.StartTransaction;
     dmMatas.MatasStoredProc.StoredProcName:='MAT_MOVE_SALDO_ISTFIN_EX';
     dmMatas.MatasStoredProc.Prepare;
     dmMatas.MatasStoredProc.ParamByName('CUR_PERIOD').Value:=_MATAS_PERIOD;
     dmMatas.MatasStoredProc.ParamByName('NEW_PERIOD').Value:=NewDateRec;
     dmMatas.MatasStoredProc.ExecProc;
     dmMatas.MatasStoredProc.Transaction.Commit;
    except on E : Exception
     do begin
      ShowMessage(E.Message);
      dmMatas.MatasStoredProc.Transaction.Rollback;
      Inc(flag);
      splash.Free;
      Exit;
     end;
    end;
  end;
 end;
 if flag=0 then begin
  splash.MsgLabel.Caption:='Переносимо залишки на наступний період';
  splash.Update;
  try
   dmMatas.MatasStoredProc.Transaction.StartTransaction;
   dmMatas.MatasStoredProc.StoredProcName:='MAT_MOVE_NEW_PERIOD';
   dmMatas.MatasStoredProc.Prepare;
   dmMatas.MatasStoredProc.ParamByName('NEW_DATE_REC').Value:=NewDateRec;
   dmMatas.MatasStoredProc.ParamByName('DATE_BEG').Value:=DateBeg;
   dmMatas.MatasStoredProc.ParamByName('DATE_END').Value:=DateEnd;
   dmMatas.MatasStoredProc.ExecProc;
   dmMatas.MatasStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    dmMatas.MatasStoredProc.Transaction.Rollback;
    splash.Free;
    Exit;
   end;
  end;
 end;
 splash.Free;
 //-------
 //--------------
 if flag=0 then
  ModalResult:=mrOk
 else
  ModalResult:=mrCancel;
end;

procedure TfrmNextPeriod.FormCreate(Sender: TObject);
begin
 OkButton.Caption:=MAT_ACTION_SET_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 Label1.Caption:=MAT_STR_NEXT_PERIOD;
 if _CLOSE_SYS_SCH=1 then
 begin
  cxCloseSch.Enabled:=true;
  cxCloseSch.Checked:=true;
 end;
 if _MAKE_MBOOK_REP=1 then
  cxCheckMBook.Checked:=true
 else
  cxCheckMBook.Checked:=false;
end;

procedure TfrmNextPeriod.cxButton1Click(Sender: TObject);
var
 DateBeg, DateEnd: TDateTime;
 T: TMatasPrintForm;
begin
 T:=TMatasPrintForm.Create(self);
 DateBeg:=StartOfTheMonth(_MATAS_PERIOD);
 DateEnd:=EndOfTheMonth(_MATAS_PERIOD);
 with CheckDataSet.SelectSQL do
 begin
  Clear;
  Add('SELECT * FROM MAT_UTIL_CHECK_OST_NEW_PERIOD(:PDATE_BEG, :PDATE_END)');
  Add('ORDER BY SCH_NUMBER, FIO, NAME');
 end;
 CheckDataSet.Prepare;
 CheckDataSet.ParamByName('PDATE_BEG').Value:=DateBeg;
 CheckDataSet.ParamByName('PDATE_END').Value:=DateEnd;
 CheckDataSet.CloseOpen(true);
 if CheckDataSet.RecordCount>0 then
 begin
  T.CheckBoxDoc.Visible:=false;
  T.Caption:='Друк звіта перевірки';
  if T.ShowModal= mrOk then
  begin
   frVariables['DATE_BEG']:=DateToStr(DateBEG);
   frVariables['DATE_END']:=DateToStr(IncDay(DateEND));
   frVariables['ORG_NAME']:=_ORG_FULL_NAME;
   frVariables['ORG_SHORT_NAME']:=_ORG_SHORT_NAME;
   frVariables['ORG_KOD_OKPO']:=_ORG_KOD_OKPO;
   frVariables['PERIOD']:=' '+AnsiUpperCase(GetMonthName(_MATAS_MONTH))+' '+IntToStr(_MATAS_YEAR);
   frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\rep_check_ost.frf');
   frReport1.PrepareReport;
   if T._NUM_COPIES>1 then
    frReport1.DefaultCopies:=T._NUM_COPIES;
   if T._ON_PRINTER then
   begin
    if T._SEL_PRINTER then
     frReport1.PrintPreparedReportDlg
    else
     frReport1.PrintPreparedReport('', T._NUM_COPIES, false, frAll);
   end
   else
    frReport1.ShowReport;
   if T._EDIT_TEMPLATE then
    frReport1.DesignReport;
  end;
 end;
 T.Free;
end;

procedure TfrmNextPeriod.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

end.


unit uPerenOst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDataSet, pFIBDataSet, DateUtils,
  cxLookAndFeelPainters, cxButtons, ibase, uMainPerem, cxControls,
  cxContainer, cxEdit, cxCheckBox, uSplashPc, Kernel, uMain;

type
  TPerOstForm = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    Database: TpFIBDatabase;
    SchDataSet: TpFIBDataSet;
    StorProc: TpFIBStoredProc;
    Tr: TpFIBTransaction;
    ds1: TDataSource;
    btnOkBut: TcxButton;
    CloseBut: TcxButton;
    cxCloseSch: TcxCheckBox;
    cxCheckBox1: TcxCheckBox;
    SaldoDataSet: TpFIBDataSet;
    WrTr: TpFIBTransaction;
    procedure btnOkButClick(Sender: TObject);
    procedure CloseButClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     DBHANDLE : TISC_DB_HANDLE;
  public
    DATE_REC, DATE_, DBEG, DEND:TDateTime;
    month, year:word;
    id_session:Integer;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

var
  PerOstForm: TPerOstForm;

implementation

{$R *.dfm}
constructor TPerOstForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
  if Assigned(DBHandle)
  then begin
   Self.DBHANDLE := DBHandle;
   Self.Database.Close;
   Self.Database.Handle:=DBHANDLE;
   Self.Database.Open;
   DATE_REC:=PERS_PAY_PERIOD;
   month:=MonthOf(DATE_REC);
   year:=YearOf(DATE_REC);
   if month = 12 then begin month:= 0; year:=year+1; end;
   DATE_:=StartOfAMonth(year,month+1);
   lbl2.Caption:=DateToStr(DATE_);
  end;
end;

procedure TPerOstForm.btnOkButClick(Sender: TObject);
var
 splash: TSplashForm;
 nrec: integer;
 dd, dm, dy: Word;
 NewDateRec, DateBeg, DateEnd: TDateTime;
 SCH_MNGR_STRU:KERNEL_SCH_MNGR_STRUCTURE;
 RES_STRU:RESULT_STRUCTURE;
 sch_db_saldo_in, sch_kr_saldo_in, sch_db_saldo_out, sch_kr_saldo_out, sch_db_oborot, sch_kr_oborot: Currency;
 flag: integer;
 id_session_oborot:Integer;
begin
 splash:=TSplashForm.Create(self);
 splash.Title.Caption:='Перехід на наступний період';
 splash.MsgLabel.Caption:='Підготовка даних';
 splash.Show;
 splash.Update;
 DecodeDate(PERS_PAY_PERIOD, dy, dm,  dd);
 IncAMonth(dy, dm, dd, 1);
 NewDateRec:=StartOfAMonth(dy, dm);
 Month:=dm;
 Year:=dy;
 DateBeg:=StartOfTheMonth(PERS_PAY_PERIOD);
 DateEnd:=EndOfTheMonth(PERS_PAY_PERIOD);
 flag:=0;
 // выбираем сессию (формируем оборотку)
  try
   StorProc.Close;
   StorProc.Transaction := Tr;
   StorProc.Transaction.StartTransaction;
   if IS_VALYUTA = 1 then
   StorProc.StoredProcName:='PC_TMP_OBOROT_INS_UPD_VALUTE'
   else
   StorProc.StoredProcName:='PC_TMP_OBOROT_INS_UPD';
   StorProc.Prepare;
   StorProc.ParamByName('DATE_BEG').Value:=DateBeg;
   StorProc.ParamByName('DATE_END').Value:=DateEnd;
   StorProc.ParamByName('ID_REG').Value:=ID_REG;
   StorProc.ExecProc;
   StorProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StorProc.Transaction.Rollback;
    exit;
   end;
  end;
  id_session_oborot:=StorProc.ParamByName('ID_SESSION').Value;
// закрытие по счетам
  if cxCloseSch.Checked then
  begin
   SchDataSet.Close;
   with SchDataSet.SelectSQL do
   begin
    Clear;
    Add('SELECT * FROM PC_SP_SCH_FOR_SYSTEM WHERE ID_SESSION = '+IntToStr(ID_SES_SCH_FOR_SYSTEM));
    Add('ORDER BY SCH_NUMBER');
   end;
   SaldoDataSet.Close;
   with SaldoDataSet.SelectSQL do
   begin
    Clear;
    Add('SELECT * FROM PC_GET_SCH_SALDO_EX(:ID_SESSION, :ID_SCH)');
   end;
   SaldoDataSet.Prepare;
   SchDataSet.Prepare;
   SchDataSet.CloseOpen(true);
   nrec:=SchDataSet.RecordCount;
   splash.Progress.Max:=nrec;
  // начинаем глоб. транзакцию
   WrTr.StartTransaction;
   SchDataSet.First;
   while (not SchDataSet.Eof) and (flag=0) do
   begin
  //  showmessage(inttostr(SchDataSet.RecNo));
    splash.MsgLabel.Caption:='Закриваємо рахунок '+SchDataSet.FieldByName('SCH_NUMBER').AsString;
    splash.StepBy(1);
    splash.Update;
    SaldoDataSet.Close;
    SaldoDataSet.ParamByName('ID_SESSION').Value:=id_session_oborot;
    SaldoDataSet.ParamByName('ID_SCH').Value:=SchDataSet.FieldByName('ID_SCH').AsInteger;
    SaldoDataSet.CloseOpen(true);
    sch_db_saldo_in:=SaldoDataSet.FieldByName('SCH_DB_SALDO_IN').AsCurrency;
    sch_kr_saldo_in:=SaldoDataSet.FieldByName('SCH_KR_SALDO_IN').AsCurrency;
    sch_db_oborot:=SaldoDataSet.FieldByName('SCH_DB_OBOROT').AsCurrency;
    sch_kr_oborot:=SaldoDataSet.FieldByName('SCH_KR_OBOROT').AsCurrency;
    sch_db_saldo_out:=SaldoDataSet.FieldByName('SCH_DB_SALDO_OUT').AsCurrency;
    sch_kr_saldo_out:=SaldoDataSet.FieldByName('SCH_KR_SALDO_OUT').AsCurrency;
    SCH_MNGR_STRU.DBHANDLE:=DBHANDLE;
    SCH_MNGR_STRU.TRHANDLE:=WrTr.Handle;
    SCH_MNGR_STRU.MODE:=1; //закрываем
    SCH_MNGR_STRU.ID_SCH:=SchDataSet.FieldByName('ID_SCH').AsInteger;
    SCH_MNGR_STRU.DB_SALDO_IN:=sch_db_saldo_in;
    SCH_MNGR_STRU.KR_SALDO_IN:=sch_kr_saldo_in;
    SCH_MNGR_STRU.DB_OBOR:=sch_db_oborot;
    SCH_MNGR_STRU.KR_OBOR:=sch_kr_oborot;
    SCH_MNGR_STRU.ID_USER:= USER_ID;
    SCH_MNGR_STRU.DB_SALDO_OUT:=sch_db_saldo_out;
    SCH_MNGR_STRU.KR_SALDO_OUT:=sch_kr_saldo_out;
    try
     RES_STRU:=Kernel.SchManager(@SCH_MNGR_STRU);
    except
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
   if flag=0 then WrTr.Commit
   else WrTr.Rollback;
   if flag=0 then
   begin
    splash.MsgLabel.Caption:='Формується сальдо наступного періоду';
    splash.Update;
    try
    StorProc.Close;
    StorProc.Transaction := Tr;
    StorProc.Transaction.StartTransaction;
    IF IS_VALYUTA =1 then
    StorProc.StoredProcName:='PC_DT_PERENOS_OSTATKOV_VAL'
    else
    StorProc.StoredProcName:='PC_DT_PERENOS_OSTATKOV';
    StorProc.Prepare;
    StorProc.ParamByName('ID_SESSION').AsInteger:=id_session_oborot;
    StorProc.ParamByName('FORM_UCH').AsInteger:=FORM_UCH;
    StorProc.ParamByName('ID_REG').AsInteger:=ID_REG;
    StorProc.ExecProc;
    StorProc.Transaction.Commit;
    except on E : Exception
     do begin
      ShowMessage(E.Message);
      StorProc.Transaction.Rollback;
      exit;
     end;
    end;
   end;
  splash.Free;
  try
   StorProc.Close;
   StorProc.Transaction := Tr;
   StorProc.Transaction.StartTransaction;
   StorProc.StoredProcName:='PC_DEL_FROM_SCH_FOR_SYSTEM';
   StorProc.Prepare;
   StorProc.ParamByName('ID_SESSION').AsInteger:=ID_SES_SCH_FOR_SYSTEM;
   StorProc.ExecProc;
   StorProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StorProc.Transaction.Rollback;
    exit;
   end;
  end;

  try
   StorProc.Close;
   StorProc.Transaction := Tr;
   StorProc.Transaction.StartTransaction;
   StorProc.StoredProcName:='PC_MOOVE_SYS_HST_INS';
   StorProc.Prepare;
   StorProc.ParamByName('ID_REG').AsInteger:=ID_REG;
   StorProc.ParamByName('DATE_TIME').AsDateTime:=Now;
   StorProc.ParamByName('ACTION_USER').AsString:='Перенос залишків на '+lbl2.Caption;
   StorProc.ParamByName('ID_USER').AsInteger:=USER_ID;
   StorProc.ParamByName('USER_NAME').AsString:=USER_FIO+' ('+USER_NAME+')';
   StorProc.ExecProc;
   StorProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StorProc.Transaction.Rollback;
    exit;
   end;
  end;
  ModalResult:=mrOk;
 end;
end;

procedure TPerOstForm.CloseButClick(Sender: TObject);
begin
Close;
end;

procedure TPerOstForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

end.

unit uSchOpen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, StdCtrls, cxButtons,
  ExtCtrls, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, DateUtils, ibase, uMainPerem,
  cxContainer, cxCheckBox, uSplashPc, Kernel, uMain;

type
  TSchForm = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    btnOkBut: TcxButton;
    CloseBut: TcxButton;
    StyleRepository: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    DS: TpFIBDataSet;
    DB: TpFIBDatabase;
    TR: TpFIBTransaction;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxgrdbclmnSCH_NUMBER: TcxGridDBColumn;
    cxgrdbclmnSCH_TITLE: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    StPr: TpFIBStoredProc;
    ds1: TDataSource;
    cxgrdbclmnDATE_OPEN: TcxGridDBColumn;
    procedure CloseButClick(Sender: TObject);
    procedure btnOkButClick(Sender: TObject);
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
  SchForm: TSchForm;

implementation

{$R *.dfm}
 constructor TSchForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
  if Assigned(DBHandle)
  then begin
   Self.DBHANDLE := DBHandle;
   Self.DB.Close;
   Self.DB.Handle:=DBHANDLE;
   Self.DB.Open;
   DATE_REC:=PERS_PAY_PERIOD;
   month:=MonthOf(DATE_REC);
   year:=YearOf(DATE_REC);
   if month = 1 then begin month:= 13; year:=year-1; end;
   DATE_:=StartOfAMonth(year,month-1);
   Self.DS.Close;
   lbl2.Caption:=DateToStr(DATE_);
   Self.DS.SelectSQL.Clear;
   Self.DS.SelectSQL.Add('SELECT * FROM PC_SP_SCH_FOR_SYSTEM WHERE ID_SESSION = '+IntToStr(ID_SES_SCH_FOR_SYSTEM));
   Self.DS.CloseOpen(false);
  end;
end;

procedure TSchForm.CloseButClick(Sender: TObject);
begin
 Close;
end;

procedure TSchForm.btnOkButClick(Sender: TObject);
var
 splash: TSplashForm;
 nrec: integer;
 SCH_MNGR_STRU:KERNEL_SCH_MNGR_STRUCTURE;
 RES_STRU:RESULT_STRUCTURE;
 flag: integer;
begin
 splash:=TSplashForm.Create(self);
 splash.Title.Caption:='Відкриття рахунків';
 splash.Show;
 splash.Update;
 nrec:=DS.RecordCount;
 splash.Progress.Max:=nrec;
 flag:=0;
 // начинаем глоб. транзакцию
 TR.StartTransaction;
 DS.First;
 while (not DS.Eof) and (flag=0) do
 begin
//   Showmessage(DS.FieldByname('Sch_number').Asstring);
  splash.MsgLabel.Caption:='Відкриваємо рахунок '+DS.FieldByName('SCH_NUMBER').AsString;
  splash.StepBy(1);
  splash.Update;
  SCH_MNGR_STRU.DBHANDLE:=DB.Handle;
  SCH_MNGR_STRU.TRHANDLE:=TR.Handle;
  SCH_MNGR_STRU.MODE:=2; //закрываем
  SCH_MNGR_STRU.ID_SCH:=DS.FieldByName('ID_SCH').AsInteger;
  try
   RES_STRU:=Kernel.SchManager(@SCH_MNGR_STRU);
  except
   ModalResult:=mrCancel;
   splash.Free;
   Close;
  end;
  if RES_STRU.RESULT_CODE=0 then
  begin
   Inc(flag);
   ShowMessage(RES_STRU.RESULT_MESSAGE);
  end;
  DS.Next;
 end;
 if flag=0 then TR.Commit
 else TR.Rollback;
 if flag = 0 then
 begin
  try
   StPr.Close;
   StPr.Transaction := TR;
   StPr.Transaction.StartTransaction;
   StPr.StoredProcName:='PC_INI_REG_UPDATE';
   StPr.Prepare;
   StPr.ParamByName('DATE_REC').AsDate:=DATE_;
   StPr.ParamByName('ID_FORM_UCH').AsInteger:=FORM_UCH;
   StPr.ParamByName('ID_REG').AsInteger:=ID_REG;
   StPr.ExecProc;
   StPr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr.Transaction.Rollback;
    exit;
   end;
  end;
 end;
 DS.CloseOpen(false);
 splash.Free;
 try
  StPr.Close;
  StPr.Transaction := Tr;
  StPr.Transaction.StartTransaction;
  StPr.StoredProcName:='PC_DEL_FROM_SCH_FOR_SYSTEM';
  StPr.Prepare;
  StPr.ParamByName('ID_SESSION').AsInteger:=ID_SES_SCH_FOR_SYSTEM;
  StPr.ExecProc;
  StPr.Transaction.Commit;
 except on E : Exception
  do begin
   ShowMessage(E.Message);
   StPr.Transaction.Rollback;
   exit;
  end;
 end;
  try
   StPr.Close;
   StPr.Transaction := Tr;
   StPr.Transaction.StartTransaction;
   StPr.StoredProcName:='PC_MOOVE_SYS_HST_INS';
   StPr.Prepare;
   StPr.ParamByName('ID_REG').AsInteger:=ID_REG;
   StPr.ParamByName('DATE_TIME').AsDateTime:=Now;
   StPr.ParamByName('ACTION_USER').AsString:='Відкриття рахунків(відкат системи) на '+lbl2.Caption;
   StPr.ParamByName('ID_USER').AsInteger:=USER_ID;
   StPr.ParamByName('USER_NAME').AsString:=USER_FIO+' ('+USER_NAME+')';
   StPr.ExecProc;
   StPr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr.Transaction.Rollback;
    exit;
   end;
  end;
 ModalResult:=mrOk;
end;

procedure TSchForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

end.

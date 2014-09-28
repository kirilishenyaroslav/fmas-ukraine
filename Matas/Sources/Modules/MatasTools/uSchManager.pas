{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с дополнительными функциями             }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSchManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, ibase,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxGridTableView, StdCtrls,
  cxButtons, cxContainer, cxCheckBox, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  uMatasVars, uMatasUtils, uResources, uSplash, Kernel, FIBQuery,
  pFIBQuery, pFIBStoredProc, ExtCtrls;

type
  TSchManagerForm = class(TForm)
    WorkDatabase: TpFIBDatabase;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID_SCH: TcxGridDBColumn;
    cxGrid1DBTableView1SCH_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1SCH_TITLE: TcxGridDBColumn;
    cxGrid1DBTableView1SCH_TYPE: TcxGridDBColumn;
    cxGrid1DBTableView1LINK_TO: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_BEG: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_END: TcxGridDBColumn;
    cxGrid1DBTableView1TYPE_OBJECT: TcxGridDBColumn;
    cxGrid1DBTableView1SCH_OBJ_TYPE_TITLE: TcxGridDBColumn;
    cxGrid1DBTableView1SCH_TYPE_TITLE: TcxGridDBColumn;
    cxGrid1DBTableView1ID_SYSTEM: TcxGridDBColumn;
    cxGrid1DBTableView1BAL_ID_SCH: TcxGridDBColumn;
    cxGrid1DBTableView1BAL_SCH_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1BAL_SCH_TITLE: TcxGridDBColumn;
    cxGrid1DBTableView1SYSTEM_TEXT: TcxGridDBColumn;
    cxGrid1DBTableView1KOD_SYSTEM: TcxGridDBColumn;
    cxGrid1DBTableView1IS_BLOCKED: TcxGridDBColumn;
    cxGrid1DBTableView1OPEN_SCH: TcxGridDBColumn;
    cxGrid1DBTableView1ID_REG_UCH: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
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
    MatSchDataSet: TpFIBDataSet;
    MatSchDataSetID_SCH: TFIBIntegerField;
    MatSchDataSetSCH_TITLE: TFIBStringField;
    MatSchDataSetSCH_NUMBER: TFIBStringField;
    MatSchDataSetSCH_TYPE: TFIBIntegerField;
    MatSchDataSetLINK_TO: TFIBIntegerField;
    MatSchDataSetDATE_BEG: TFIBDateTimeField;
    MatSchDataSetDATE_END: TFIBDateTimeField;
    MatSchDataSetTYPE_OBJECT: TFIBIntegerField;
    MatSchDataSetSCH_OBJ_TYPE_TITLE: TFIBStringField;
    MatSchDataSetSCH_TYPE_TITLE: TFIBStringField;
    MatSchDataSetID_SYSTEM: TFIBIntegerField;
    MatSchDataSetBAL_ID_SCH: TFIBIntegerField;
    MatSchDataSetBAL_SCH_NUMBER: TFIBStringField;
    MatSchDataSetBAL_SCH_TITLE: TFIBStringField;
    MatSchDataSetSYSTEM_TEXT: TFIBStringField;
    MatSchDataSetKOD_SYSTEM: TFIBIntegerField;
    MatSchDataSetIS_BLOCKED: TFIBIntegerField;
    MatSchDataSetOPEN_SCH: TFIBDateField;
    MatSchDataSetID_REG_UCH: TFIBIntegerField;
    MatSchDataSource: TDataSource;
    SaldoDataSet: TpFIBDataSet;
    WorkTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    WorkStoredProc: TpFIBStoredProc;
    Panel1: TPanel;
    cxBlockSch: TcxButton;
    cxOpenSch: TcxButton;
    cxCloseSch: TcxButton;
    ExitButton: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxCloseSchClick(Sender: TObject);
    procedure cxOpenSchClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
   constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; ID_USER: int64);overload;
  end;

  procedure SchManager(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
  exports SchManager;

var
  SchManagerForm: TSchManagerForm;

implementation

uses DateUtils;

{$R *.dfm}
procedure SchManager(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 TSchManagerForm.Create(aOwner, aDBHANDLE, aID_USER);
end;

constructor TSchManagerForm.Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; ID_USER : Int64);
begin
 inherited Create(AOwner);
 if Assigned(aDBHandle)
 then begin
   Self.DBHANDLE := aDBHandle;
   Self.ID_USER:=ID_USER;
   Self.WorkDatabase.Handle:=aDBHANDLE;
   Self.ReadTransaction.StartTransaction;
 end;
end;

procedure TSchManagerForm.FormCreate(Sender: TObject);
begin
 cxGrid1DBTableView1SCH_NUMBER.Caption:=MAT_STR_COL_SCH;
 cxGrid1DBTableView1SCH_TITLE.Caption:=MAT_STR_COL_NAME;
 cxGrid1DBTableView1OPEN_SCH.Caption:=MAT_STR_COL_DATA;
 ExitButton.Caption:=MAT_ACTION_CLOSE_CONST;
 MatSchDataSet.ParamByName('DATE').Value:=_MATAS_PERIOD;
 MatSchDataSet.CloseOpen(false);
 Caption:=MAT_SYS_PREFIX+MAT_STR_TOOLS_02_SCH_MANAGER;
end;

procedure TSchManagerForm.cxCloseSchClick(Sender: TObject);
var
 splash: TSplashForm;
 nrec: integer;
 SCH_MNGR_STRU:KERNEL_SCH_MNGR_STRUCTURE;
 RES_STRU:RESULT_STRUCTURE;
 flag: integer;
 sch_saldo_in, sch_saldo_out, sch_db_oborot, sch_kr_oborot: Currency;
 SCH_PERIOD: TDateTime;
begin
  splash:=TSplashForm.Create(self);
  splash.Title.Caption:='Закриття рахунків';
  splash.MsgLabel.Caption:='Підготовка даних';
  splash.Show;
  splash.Update;
  SaldoDataSet.Close;
  with SaldoDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_GET_SCH_SALDO_EX(:PDATE, :ID_SCH)');
  end;
  SaldoDataSet.Prepare;
  nrec:=MatSchDataSet.RecordCount;
  splash.Progress.Max:=nrec;
  flag:=0;
  // начинаем глоб. транзакцию
  WorkTransaction.StartTransaction;
  MatSchDataSet.First;
  while (not MatSchDataSet.Eof) and (flag=0) do
  begin
   splash.MsgLabel.Caption:='Закриваємо рахунок '+MatSchDataSet.FieldByName('SCH_NUMBER').AsString;
   splash.StepBy(1);
   splash.Update;
   SaldoDataSet.Close;
   SaldoDataSet.ParamByName('PDATE').Value:=_MATAS_PERIOD;
   SaldoDataSet.ParamByName('ID_SCH').Value:=MatSchDataSet.FieldByName('ID_SCH').AsInteger;
   SaldoDataSet.CloseOpen(true);
   sch_saldo_in:=SaldoDataSet.FieldByName('SCH_SALDO_IN').AsCurrency;
   sch_db_oborot:=SaldoDataSet.FieldByName('SCH_DB_OBOROT').AsCurrency;
   sch_kr_oborot:=SaldoDataSet.FieldByName('SCH_KR_OBOROT').AsCurrency;
   sch_saldo_out:=SaldoDataSet.FieldByName('SCH_SALDO_OUT').AsCurrency;
   SCH_MNGR_STRU.DBHANDLE:=WorkDatabase.Handle;
   SCH_MNGR_STRU.TRHANDLE:=WorkTransaction.Handle;
   SCH_MNGR_STRU.MODE:=1; //закрываем
   SCH_MNGR_STRU.ID_SCH:=MatSchDataSet.FieldByName('ID_SCH').AsInteger;
   if sch_saldo_in>=0 then
   begin
    SCH_MNGR_STRU.DB_SALDO_IN:=sch_saldo_in;
    SCH_MNGR_STRU.KR_SALDO_IN:=0;
   end
   else
   begin
    SCH_MNGR_STRU.DB_SALDO_IN:=0;
    SCH_MNGR_STRU.KR_SALDO_IN:=abs(sch_saldo_in);
   end;
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
    splash.Free;
    Close;
   end;
   if RES_STRU.RESULT_CODE=0 then
   begin
    Inc(flag);
    ShowMessage(RES_STRU.RESULT_MESSAGE);
   end;
   MatSchDataSet.Next;
  end;
  if flag=0 then
    WorkTransaction.Commit
  else
   WorkTransaction.Rollback;

  MatSchDataSet.CloseOpen(false);

  if flag=0 then
  begin
   splash.MsgLabel.Caption:='Формується сальдо наступного періоду';
   splash.Update;
   MatSchDataSet.First;
   while (not MatSchDataSet.Eof) and (flag=0) do
   begin
    SCH_PERIOD:=MatSchDataSet.FieldByName('OPEN_SCH').AsDateTime;
    SCH_PERIOD:=IncMonth(StartOfTheMonth(SCH_PERIOD), -1);
    splash.MsgLabel.Caption:='Рахунок '+MatSchDataSet.FieldByName('SCH_NUMBER').AsString;
    splash.StepBy(1);
    splash.Update;
    try
     WorkStoredProc.Transaction.StartTransaction;
     WorkStoredProc.StoredProcName:='MAT_SET_SCH_SALDO_EX';
     WorkStoredProc.Prepare;
     WorkStoredProc.ParamByName('PDATE').Value:=SCH_PERIOD;
     WorkStoredProc.ParamByName('ID_SCH').Value:=MatSchDataSet.FieldByName('ID_SCH').AsInteger;
     WorkStoredProc.ExecProc;
     WorkStoredProc.Transaction.Commit;
    except on E : Exception
     do begin
      ShowMessage(E.Message);
      WorkStoredProc.Transaction.Rollback;
      Inc(flag);
      Exit;
     end;
    end;
    MatSchDataSet.Next;
   end;
  end;
  MatSchDataSet.CloseOpen(false);
  splash.Free;
end;

procedure TSchManagerForm.cxOpenSchClick(Sender: TObject);
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
 nrec:=MatSchDataSet.RecordCount;
 splash.Progress.Max:=nrec;
 flag:=0;
 // начинаем глоб. транзакцию
 WorkTransaction.StartTransaction;
 MatSchDataSet.First;
 while (not MatSchDataSet.Eof) and (flag=0) do
 begin
  splash.MsgLabel.Caption:='Відкриваємо рахунок '+MatSchDataSet.FieldByName('SCH_NUMBER').AsString;
  splash.StepBy(1);
  splash.Update;
  SCH_MNGR_STRU.DBHANDLE:=WorkDatabase.Handle;
  SCH_MNGR_STRU.TRHANDLE:=WorkTransaction.Handle;
  SCH_MNGR_STRU.MODE:=2; //закрываем
  SCH_MNGR_STRU.ID_SCH:=MatSchDataSet.FieldByName('ID_SCH').AsInteger;
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
  MatSchDataSet.Next;
 end;
 if flag=0 then
   WorkTransaction.Commit
 else
  WorkTransaction.Rollback;
 MatSchDataSet.CloseOpen(false);
 splash.Free;
end;

procedure TSchManagerForm.ExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TSchManagerForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

end.

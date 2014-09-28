{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с дополнительными функциями             }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSchSaldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, FIBDataSet,
  FIBDatabase, pFIBDatabase, pFIBDataSet, StdCtrls, cxButtons, cxSpinEdit,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, ExtCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, DateUtils,
  uMatasVars, uMatasUtils, uResources, ImgList, Menus, FIBQuery, pFIBQuery,
  pFIBStoredProc, FR_Class, FR_DSet, FR_DBSet, ActnList;

type
  TSchSaldoForm = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
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
    PanelTools: TPanel;
    cxMonth: TcxComboBox;
    cxYear: TcxSpinEdit;
    ExitButton: TcxButton;
    WorkDatabase: TpFIBDatabase;
    SaldoDataSet: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    SaldoDataSetPERIOD: TFIBDateField;
    SaldoDataSetID_SCH: TFIBBCDField;
    SaldoDataSetSCH_TITLE: TFIBStringField;
    SaldoDataSetSCH_NUMBER: TFIBStringField;
    SaldoDataSetBAL_ID_SCH: TFIBIntegerField;
    SaldoDataSetBAL_SCH_NUMBER: TFIBStringField;
    SaldoDataSetBAL_SCH_TITLE: TFIBStringField;
    SaldoDataSetSUMMA_BEG: TFIBBCDField;
    SaldoDataSetSUMMA_DB: TFIBBCDField;
    SaldoDataSetSUMMA_KR: TFIBBCDField;
    SaldoDataSetSUMMA_END: TFIBBCDField;
    SaldoDataSource: TDataSource;
    cxGrid1DBTableView1PERIOD: TcxGridDBColumn;
    cxGrid1DBTableView1ID_SCH: TcxGridDBColumn;
    cxGrid1DBTableView1SCH_TITLE: TcxGridDBColumn;
    cxGrid1DBTableView1SCH_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1BAL_ID_SCH: TcxGridDBColumn;
    cxGrid1DBTableView1BAL_SCH_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1BAL_SCH_TITLE: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA_BEG: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA_DB: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA_KR: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA_END: TcxGridDBColumn;
    LabelPeriod: TLabel;
    pmSaldo: TPopupMenu;
    NSaldoEdit: TMenuItem;
    NTemplDel: TMenuItem;
    NSaldoRefresh: TMenuItem;
    StoredProc: TpFIBStoredProc;
    SaldoDataSetID_SALDO: TFIBBCDField;
    NSaldoDel: TMenuItem;
    NSaldoAdd: TMenuItem;
    N1: TMenuItem;
    NSaldoImportMBOOK: TMenuItem;
    NSaldoImportOSTB: TMenuItem;
    PrintButton: TcxButton;
    frDBDataSet1: TfrDBDataSet;
    frReport: TfrReport;
    CompareDataSet: TpFIBDataSet;
    ActionList1: TActionList;
    acExit: TAction;
    acShow: TAction;
    ShowButton: TcxButton;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NSaldoRefreshClick(Sender: TObject);
    procedure NSaldoEditClick(Sender: TObject);
    procedure NSaldoImportMBOOKClick(Sender: TObject);
    procedure NSaldoImportOSTBClick(Sender: TObject);
    procedure NSaldoAddClick(Sender: TObject);
    procedure NSaldoDelClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acShowExecute(Sender: TObject);
    procedure ShowButtonClick(Sender: TObject);
  private
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
   constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; ID_USER: int64);overload;
  end;

  procedure SchSaldoManager(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
  exports SchSaldoManager;

var
  SchSaldoForm: TSchSaldoForm;

implementation

uses uSchSaldoAdd, uSchSaldoPrint;

{$R *.dfm}
procedure SchSaldoManager(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 TSchSaldoForm.Create(aOwner, aDBHANDLE, aID_USER);
end;

constructor TSchSaldoForm.Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; ID_USER : Int64);
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

procedure TSchSaldoForm.FormCreate(Sender: TObject);
var
  dd, dm, dy: Word;
begin
 Caption:=MAT_SYS_PREFIX+MAT_STR_TOOLS_01_SCH_SALDO;
 DecodeDate(_MATAS_PERIOD, dy, dm, dd);
 LoadMonthTocxComboBox(cxMonth);
 cxMonth.ItemIndex:=dm-1;
 cxYear.Value:=dy;
 LabelPeriod.Caption:=MAT_STR_COL_PERIOD;
 PrintButton.Caption:=MAT_ACTION_PRINT_CONST;
 ExitButton.Caption:=MAT_ACTION_CLOSE_CONST;
 NSaldoAdd.Caption:=MAT_ACTION_ADD_CONST;
 NSaldoDel.Caption:=MAT_ACTION_DELETE_CONST;
 NSaldoEdit.Caption:=MAT_ACTION_UPDATE_CONST;
 NSaldoRefresh.Caption:=MAT_ACTION_REFRESH_CONST;
 cxGrid1DBTableView1SCH_NUMBER.Caption:=MAT_STR_COL_SCH;
 cxGrid1DBTableView1SCH_TITLE.Caption:=MAT_STR_COL_NAME;
 cxGrid1DBTableView1SUMMA_BEG.Caption:=MAT_STR_COL_SUMMA;
 acShowExecute(self);
end;

procedure TSchSaldoForm.ExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TSchSaldoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TSchSaldoForm.NSaldoRefreshClick(Sender: TObject);
begin
  acShowExecute(self);
end;

procedure TSchSaldoForm.NSaldoEditClick(Sender: TObject);
var
 mr: boolean;
 new_summa, cur_summa: Extended;
 id: integer;
begin
 cur_summa:=SaldoDataSet.FieldByName('SUMMA_BEG').AsCurrency;
 id:=SaldoDataSet.FieldByName('ID_SALDO').AsInteger;
 new_summa:=GetSumma(self, cur_summa, mr);
 if not mr then
 begin
  try
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName:='MAT_DT_SALDO_UPDATE';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_SALDO').Value:=id;
   StoredProc.ParamByName('SUMMA_BEG').Value:=new_summa;
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StoredProc.Transaction.Rollback;
    Exit;
   end;
  end;
  acShowExecute(self);
  SaldoDataSet.Locate('ID_SALDO', id, []);
 end;
end;

procedure TSchSaldoForm.NSaldoImportMBOOKClick(Sender: TObject);
begin
 if agMessageDlg(MAT_STR_WARNING, 'Поточні дані про сальдо буде замінено!'+chr(13)+'Ви дійсно бажаєте імпортувати вхідне сальдо з головної книги?', mtConfirmation, [mbYes, mbNo]) = ID_YES  then
 begin
  try
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_DT_SALDO_MAKE_BY_MBOOK';
    StoredProc.Prepare;
    StoredProc.ParamByName('DATE_REC').Value:=StartOfAMonth(cxYear.Value, cxMonth.ItemIndex+1);
    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(MAT_STR_SAVE_ERROR);
     StoredProc.Transaction.Rollback;
     exit;
   end;
  end;
  acShowExecute(self);
 end;
end;

procedure TSchSaldoForm.NSaldoImportOSTBClick(Sender: TObject);
begin
 if agMessageDlg(MAT_STR_WARNING, 'Поточні дані про сальдо буде замінено!'+chr(13)+'Ви дійсно бажаєте імпортувати вхідне сальдо із залишків?', mtConfirmation, [mbYes, mbNo]) = ID_YES  then
 begin
  try
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_DT_SALDO_MAKE_BY_OSTB';
    StoredProc.Prepare;
    StoredProc.ParamByName('DATE_REC').Value:=StartOfAMonth(cxYear.Value, cxMonth.ItemIndex+1);
    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(MAT_STR_SAVE_ERROR);
     StoredProc.Transaction.Rollback;
     exit;
   end;
  end;
  acShowExecute(self);
 end;
end;

procedure TSchSaldoForm.NSaldoAddClick(Sender: TObject);
var
 T: TSchSaldoAdd;
begin
 T:=TSchSaldoAdd.Create(self);
 T.DBHandle:=DBHANDLE;
 if T.ShowModal=mrOk then
 begin
  try
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_DT_SALDO_INSERT';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_SCH').Value:=T.ID_SCH;
    StoredProc.ParamByName('PERIOD').Value:=StartOfAMonth(cxYear.Value, cxMonth.ItemIndex+1);
    StoredProc.ParamByName('SUMMA_BEG').Value:=T.cxSumma.EditValue;
    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(MAT_STR_SAVE_ERROR);
     StoredProc.Transaction.Rollback;
     exit;
   end;
  end;
  acShowExecute(self);
 end;
end;

procedure TSchSaldoForm.NSaldoDelClick(Sender: TObject);
var
 id: integer;
begin
 if agMessageDlg(MAT_STR_WARNING, MAT_STR_ASK_DELETE, mtConfirmation, [mbYes, mbNo]) = ID_YES  then
 begin
  try
    id:=SaldoDataSet.FieldByName('ID_SALDO').AsInteger;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_DT_SALDO_DELETE';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_SALDO').Value:=id;
    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(MAT_STR_ERROR_DELETE);
     StoredProc.Transaction.Rollback;
     exit;
   end;
  end;
  acShowExecute(self);
 end;
end;

procedure TSchSaldoForm.PrintButtonClick(Sender: TObject);
var
   T: TSchSaldoPrintForm;
begin
   T:=TSchSaldoPrintForm.Create(self);
   if T.ShowModal=mrOk then
   begin
     if T.cxPrintForm.ItemIndex=0 then
     begin
      frDBDataSet1.DataSet:=SaldoDataSet;
      frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\mat_sch_saldo.frf');
     end;
     if T.cxPrintForm.ItemIndex=1 then
     begin
      CompareDataSet.Close;
      CompareDataSet.SelectSQL.Clear;
      CompareDataSet.SelectSQL.Add('SELECT * FROM MAT_SCH_SALDO_COMPARE(:PDATE)');
      CompareDataSet.ParamByName('PDATE').Value:=StartOfAMonth(cxYear.Value, cxMonth.ItemIndex+1);
      CompareDataSet.CloseOpen(false);
      frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\mat_sch_compare.frf');
      frDBDataSet1.DataSet:=CompareDataSet;
     end;
     frVariables['ORG_NAME']:=_ORG_FULL_NAME;
     frVariables['ORG_SHORT_NAME']:=_ORG_SHORT_NAME;
     frVariables['ORG_KOD_OKPO']:=_ORG_KOD_OKPO;
     frVariables['PERIOD']:=DateToStr(StartOfAMonth(cxYear.Value, cxMonth.ItemIndex+1));
     frReport.PrepareReport;
     if T.cxCopies.Value>1 then
      frReport.DefaultCopies:=T.cxCopies.Value;
     if T.cxCheckOnPrinter.Checked then
     begin
     if T.cxSelectPrinter.Checked then
      frReport.PrintPreparedReportDlg
     else
      frReport.PrintPreparedReport('', T.cxCopies.Value, false, frAll);
     end
     else
      frReport.ShowReport;
     if T.cxCheckBox1.Checked then
      frReport.DesignReport;
   end;
   T.Free;
end;

procedure TSchSaldoForm.acExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TSchSaldoForm.acShowExecute(Sender: TObject);
begin
  SaldoDataSet.ParamByName('PDATE').Value:=StartOfAMonth(cxYear.Value, cxMonth.ItemIndex+1);
  SaldoDataSet.CloseOpen(false);
  cxGrid1DBTableView1.ViewData.Expand(true);
end;

procedure TSchSaldoForm.ShowButtonClick(Sender: TObject);
begin
  acShowExecute(self);
end;

end.

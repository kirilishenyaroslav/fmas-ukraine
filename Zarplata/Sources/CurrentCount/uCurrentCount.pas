unit uCurrentCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxBar, dxBarExtItems, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,Ibase,
  Dates,Zproc,Unit_ReCountConsts,zMessages, zWait,
  DateUtils, cxContainer, cxProgressBar, dxStatusBar, Unit_ZGlobal_Consts,
  PackageLoad;


type
  TFCurrentCount = class(TForm)
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    ListGridTabView: TcxGridDBTableView;
    ListGridLevel1: TcxGridLevel;
    ListGrid: TcxGrid;
    Styles: TcxStyleRepository;
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
    MainDatabase: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    LsitDataSource: TDataSource;
    TNColumn: TcxGridDBColumn;
    FIOColumn: TcxGridDBColumn;
    InsertMenu: TdxBarPopupMenu;
    DeleteMenu: TdxBarPopupMenu;
    StatusBar: TdxStatusBar;
    dxStatusBar1Container1: TdxStatusBarContainerControl;
    ProgressBar: TcxProgressBar;
    CountProc: TpFIBStoredProc;
    UVProc: TpFIBStoredProc;
    BarEditMinSum: TdxBarEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitBtnClick(Sender: TObject);

    procedure ListGridTabViewKeyPress(Sender: TObject; var Key: Char);
    procedure SelectBtnClick(Sender: TObject);
    procedure ListGridTabViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);reintroduce;

  end;

function ShowCurrentCount(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;stdcall;
 exports ShowCurrentCount;


implementation
{$R *.dfm}

function ShowCurrentCount(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
var ViewForm:TFCurrentCount;
    wf:TForm;
begin
  wf := ShowWaitForm(Application.MainForm);
  try
    ViewForm := TFCurrentCount.Create(AOwner,DB_HANDLE);
    ViewForm.Show;
  finally
    CloseWaitForm(wf);
  end;
end;

constructor TFCurrentCount.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
var pLanguageIndex:byte;
begin
  inherited Create(AOwner);

  pLanguageIndex      := LanguageIndex;
  TNColumn.Caption    := GridClTn_Caption[planguageIndex];
  FIOColumn.Caption   := GridClFio_Caption[planguageIndex];
  SelectBtn.Caption   := CountBtn_Caption[pLanguageIndex];
  ExitBtn.Caption     := ExitBtn_Caption[pLanguageIndex];
  Caption             := zCurrent_Caption[pLanguageIndex];

  MainDatabase.Connected := False;
  MainDatabase.Handle := DB_HANDLE;

  DataSet.SQLs.SelectSQL.Text := 'select * from Z_PAYMENT_GET_CURRENT_FIO';
  DataSet.Open;

  ListGridTabViewFocusedRecordChanged(ListGridTabView,nil,ListGridTabView.Controller.FocusedRecord,True);
end;


procedure TFCurrentCount.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
  if (ReadTransaction.InTransaction) then ReadTransaction.Commit;
end;

procedure TFCurrentCount.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFCurrentCount.ListGridTabViewKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (not (Key  in ['0'..'9'])) then ListGridTabView.OptionsBehavior.IncSearchItem:=FIOColumn
                                  else ListGridTabView.OptionsBehavior.IncSearchItem:=TNColumn;
end;

procedure TFCurrentCount.SelectBtnClick(Sender: TObject);
var IdGroupAccount:Integer;
begin
   CountProc.StoredProcName := 'Z_PAYMENT_COUNT_CURRENT';
   GetIdGroupAccount(MainDatabase.Handle,IdGroupAccount);

   ZProc.SetBeginAction(MainDataBase.Handle,8);

   DataSet.Last;
   ProgressBar.Properties.Max:=DataSet.RecordCount;
   DataSet.First;
   WriteTransaction.StartTransaction;

   while (not DataSet.Eof) do
   begin
     StatusBar.Panels[0].Text:='ТН:'+ VarToStr(DataSet['TN']);

     CountProc.Prepare;

     countProc.ParamByName('ID_MAN').Value:=DataSet['ID_MAN'];
     countProc.ParamByName('ID_GROUP_ACCOUNT').Value:=IdGroupAccount;
     countProc.ParamByName('ID_ACCOUNT').Value:=NULL;

     try
        countProc.ExecProc;
     except
     on E:Exception do
       begin
        ZShowMessage('Помилка!',PChar(E.Message),mtInformation,[mbOk]);
        ZProc.SetBeginAction(MainDataBase.Handle,0);
        WriteTransaction.Rollback;
        Exit;
       end;
     end;

     DataSet.Next;
     ProgressBar.Position:=ProgressBar.Position+1;
     Application.ProcessMessages;

   end;

   WriteTransaction.Commit;
   ZShowMessage('Вдале завершення','Перерахунок вдало завершено!',mtInformation,[mbOk]);
   ZProc.SetEndAction(MainDataBase.Handle,'T');

   /////////////////////////////////////////////////////////////////////////////
   if ZShowMessage('Фором. відомостей','Сформувати відомості?',mtConfirmation,[mbOk,mbCancel])=mrOk  then
      uvFormSheet(self,MainDatabase.Handle,8,BarEditMinSum.Text);
end;

procedure TFCurrentCount.ListGridTabViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 SelectBtn.Enabled := not (AFocusedRecord=nil);
end;

end.

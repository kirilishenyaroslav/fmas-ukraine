unit uDocWorkReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  DB, FIBDataSet, pFIBDataSet, FR_Class, FR_DSet, FR_DBSet, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, ibase, uResources, Buttons, uMatasUtils, uMatasVars, ActnList;

type
  TDocWorkReestr = class(TForm)
    WorkDataSource: TDataSource;
    frDBDataSet1: TfrDBDataSet;
    frReportReestr: TfrReport;
    WorkDatabase: TpFIBDatabase;
    WorkDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    WorkStoredProc: TpFIBStoredProc;
    Panel1: TPanel;
    WorkDataSetID_DOC_REESTR: TFIBBCDField;
    WorkDataSetNUM_REESTR: TFIBStringField;
    WorkDataSetDATE_REESTR: TFIBDateField;
    WorkDataSetSUMMA: TFIBBCDField;
    ReestrGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
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
    cxGridDBTableView1ID_DOC_REESTR: TcxGridDBColumn;
    cxGridDBTableView1NUM_REESTR: TcxGridDBColumn;
    cxGridDBTableView1DATE_REESTR: TcxGridDBColumn;
    cxGridDBTableView1SUMMA: TcxGridDBColumn;
    AddButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    PrintButton: TSpeedButton;
    CancelButton: TSpeedButton;
    ViewButton: TSpeedButton;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    procedure CancelButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
    DBHANDLE : TISC_DB_HANDLE;
    
  public
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

var
  DocWorkReestr: TDocWorkReestr;

implementation

{$R *.dfm}

uses uDocWorkReestrCreate, uDocWorkReestrPrint, uDocWorkReestrView;

constructor TDocWorkReestr.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBHANDLE := DBHandle;
  Self.WorkDatabase.Close;
  Self.WorkDatabase.Handle:=DBHANDLE;
 end;
 Self.Caption:=MAT_SYS_PREFIX+MAT_DOC_STR_PRINT_REP;
 Self.AddButton.Caption:=MAT_ACTION_ADD_CONST;
 Self.DeleteButton.Caption:=MAT_ACTION_DELETE_CONST;
 Self.RefreshButton.Caption:=MAT_ACTION_REFRESH_CONST;
 Self.PrintButton.Caption:=MAT_ACTION_PRINT_CONST;
 Self.CancelButton.Caption:=MAT_ACTION_CLOSE_CONST;
 Self.ViewButton.Caption:=MAT_ACTION_VIEW_CONST;
 Self.WorkDataSet.CloseOpen(false);
end;

procedure TDocWorkReestr.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TDocWorkReestr.RefreshButtonClick(Sender: TObject);
begin
 WorkDataSet.CloseOpen(false);
end;

procedure TDocWorkReestr.DeleteButtonClick(Sender: TObject);
begin
 if WorkDataSet.IsEmpty then exit;
 if agMessageDlg(MAT_STR_MODE_DEL, '¬и д≥йсно бажаЇте видалити реЇстр?', mtConfirmation, [mbYes, mbNo]) = ID_YES  then
 begin
   try
    WorkStoredProc.StoredProcName:='MAT_DT_DOC_REESTR_DELETE';
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.ParamByName('ID_DOC_REESTR').Value:=WorkDataSet.FieldByName('ID_DOC_REESTR').AsInteger;
    WorkStoredProc.ExecProc;
    WorkStoredProc.Transaction.Commit;
   except on E : Exception
     do begin
      ShowMessage(E.Message);
      WorkStoredProc.Transaction.Rollback;
      exit;
     end;
   end;
   WorkDataSet.CloseOpen(false);
 end
end;

procedure TDocWorkReestr.AddButtonClick(Sender: TObject);
var
 T: TDocWorkReestrCreate;
begin
 T:=TDocWorkReestrCreate.Create(self);
 T.DBHANDLE:=DBHANDLE;
 T.FILTER_ID_SESSION:=WorkDatabase.Gen_Id('MAT_ID_SESSION', 1);
 T.Caption:=Caption+' :: '+MAT_STR_MODE_ADD;
 if T.ShowModal=mrOk then
 begin
   try
    WorkStoredProc.StoredProcName:='MAT_DT_DOC_REESTR_CREATE';
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.ParamByName('PDATE_REESTR').Value:=T.cxDateReestr.Date;
    if T.cxCheckUser.Checked then
     WorkStoredProc.ParamByName('PID_USER').Value:=IntToStr(_CURRENT_USER_ID)
    else
     WorkStoredProc.ParamByName('PID_USER').Value:=null;
    if T.cxTipDoc.Text<>'' then
     WorkStoredProc.ParamByName('PID_FILTER').Value:=T.FILTER_ID_SESSION
    else
     WorkStoredProc.ParamByName('PID_FILTER').Value:=null;
    WorkStoredProc.ExecProc;
    WorkStoredProc.Transaction.Commit;
   except on E : Exception
     do begin
      ShowMessage(E.Message);
      WorkStoredProc.Transaction.Rollback;
      exit;
     end;
   end;
   WorkDataSet.CloseOpen(false);
 end;
 T.Free;
end;

procedure TDocWorkReestr.PrintButtonClick(Sender: TObject);
var
  T: TDocWorkReestrPrint;
begin
  T:=TDocWorkReestrPrint.Create(Self);
  T.Caption:=Caption+' :: '+MAT_ACTION_PRINT_CONST;
  T.ID_REESTR:=WorkDataSet.FieldByName('ID_DOC_REESTR').AsInteger;
  T.NUM_REESTR:=WorkDataSet.FieldByName('NUM_REESTR').AsString;
  T.DATE_REESTR:=WorkDataSet.FieldByName('DATE_REESTR').AsDateTime;
  T.WorkDatabase.Handle:=DBHANDLE;
  T.WorkDatabase.StartTransaction;
  T.ShowModal;
  T.Free;
end;

procedure TDocWorkReestr.ViewButtonClick(Sender: TObject);
var
  T:TDocWorkReestrView;
begin
  T:=TDocWorkReestrView.Create(self);
  T.WorkDatabase.handle:=DBHANDLE;
  T.WorkDataSet.ParamByName('ID_REESTR').Value:=WorkDataSet.FieldByName('ID_DOC_REESTR').AsInteger;
  T.WorkDataSet.CloseOpen(False);
  T.ShowModal;
  T.Free;
end;

procedure TDocWorkReestr.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

end.

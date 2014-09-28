unit uSpWorkDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, cxClasses, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, ibase,
  uMatasUtils, uResources, uSpOper, FR_Ctrls, Menus, ImgList;

type
  TDocWorkoperForm = class(TForm)
    TopPanel: TPanel;
    CancelButton: TSpeedButton;
    AddButton: TSpeedButton;
    WorkStoredProc: TpFIBStoredProc;
    DataSource: TDataSource;
    Transaction: TpFIBTransaction;
    DataSetTipDOper: TpFIBDataSet;
    DataSetTipDOperID_TIPD_OPER: TFIBBCDField;
    DataSetTipDOperID_OPER: TFIBBCDField;
    DataSetTipDOperNAME: TFIBStringField;
    DBTipDOper: TpFIBDatabase;
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
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    frSpeedButton1: TfrSpeedButton;
    SpeedButton1: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    MainImageList: TImageList;
    cxProvGrid: TcxGrid;
    cxProvGridDBTableView1: TcxGridDBTableView;
    cxgrdbclmnProvGridDBTableView1ID_PROV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1ID_OPER: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_ID_SCH: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_SCH_TITLE: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_SCH_NUMBER: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_ID_SCH: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_SCH_TITLE: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_SCH_NUMBER: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1FORMULA: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_SCH_TYPE: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_TYPE_OBJECT: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_SCH_OBJ_TYPE_TITLE: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_SCH_TYPE_TITLE: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_ID_SYSTEM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_ID_SM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_NAME_SM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_KOD_SM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_ID_RZ: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_NAME_RZ: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_KOD_RZ: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_ID_ST: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_NAME_ST: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_KOD_ST: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_ID_KEKV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_NAME_KEKV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_KOD_KEKV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_ID_MARK: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_NAME_MARK: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_SHORT_MARK: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_SCH_TYPE: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_TYPE_OBJECT: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_SCH_OBJ_TYPE_TITLE: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_SCH_TYPE_TITLE: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_ID_SYSTEM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_ID_SM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_NAME_SM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_KOD_SM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_ID_RZ: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_NAME_RZ: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_KOD_RZ: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_ID_ST: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_NAME_ST: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_KOD_ST: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_ID_KEKV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_NAME_KEKV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_KOD_KEKV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_ID_MARK: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_NAME_MARK: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_SHORT_MARK: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1IS_EX_PROV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_DB_PROV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_KR_PROV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DB_SCH: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1KR_SCH: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1FDB_SCH: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1FKR_SCH: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1FKOL_MAT: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1FSUMMA: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1IS_GROUP: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1NPROV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_BY_DB_SCH: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_BY_DB_SM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_BY_DB_RZ: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_BY_DB_ST: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_BY_DB_KEKV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_BY_KR_SCH: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_BY_KR_SM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_BY_KR_RZ: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_BY_KR_ST: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_BY_KR_KEKV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_ID_DB_SCH: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_DB_SCH_NUMBER: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_ID_DB_SM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_DB_NAME_SM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_DB_KOD_SM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_ID_DB_RZ: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_DB_NAME_RZ: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_DB_KOD_RZ: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_ID_DB_ST: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_DB_NAME_ST: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_DB_KOD_ST: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_ID_DB_KEKV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_DB_NAME_KEKV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_DB_KOD_KEKV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_ID_KR_SCH: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_KR_SCH_NUMBER: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_ID_KR_SM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_KR_NAME_SM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_KR_KOD_SM: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_ID_KR_RZ: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_KR_NAME_RZ: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_KR_KOD_RZ: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_ID_KR_ST: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_KR_NAME_ST: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_KR_KOD_ST: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_ID_KR_KEKV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_KR_NAME_KEKV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1SUM_KR_KOD_KEKV: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1IS_OUT_POS: TcxGridDBColumn;
    cxgrdbclmnProvGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxProvGridLevel1: TcxGridLevel;
    ProvDataSet: TpFIBDataSet;
    dsProvDataSorse: TDataSource;
    ProvDataSetID_PROV: TFIBIntegerField;
    ProvDataSetID_OPER: TFIBIntegerField;
    ProvDataSetDB_ID_SCH: TFIBIntegerField;
    ProvDataSetDB_SCH: TFIBStringField;
    ProvDataSetDB_SCH_TITLE: TFIBStringField;
    ProvDataSetDB_SCH_NUMBER: TFIBStringField;
    ProvDataSetDB_SCH_TYPE: TFIBIntegerField;
    ProvDataSetDB_TYPE_OBJECT: TFIBIntegerField;
    ProvDataSetDB_SCH_OBJ_TYPE_TITLE: TFIBStringField;
    ProvDataSetDB_SCH_TYPE_TITLE: TFIBStringField;
    ProvDataSetDB_ID_SYSTEM: TFIBIntegerField;
    ProvDataSetDB_ID_SM: TFIBBCDField;
    ProvDataSetDB_NAME_SM: TFIBStringField;
    ProvDataSetDB_KOD_SM: TFIBIntegerField;
    ProvDataSetDB_ID_RZ: TFIBBCDField;
    ProvDataSetDB_NAME_RZ: TFIBStringField;
    ProvDataSetDB_KOD_RZ: TFIBIntegerField;
    ProvDataSetDB_ID_ST: TFIBBCDField;
    ProvDataSetDB_NAME_ST: TFIBStringField;
    ProvDataSetDB_KOD_ST: TFIBIntegerField;
    ProvDataSetDB_ID_KEKV: TFIBBCDField;
    ProvDataSetDB_NAME_KEKV: TFIBStringField;
    ProvDataSetDB_KOD_KEKV: TFIBIntegerField;
    ProvDataSetDB_ID_MARK: TFIBBCDField;
    ProvDataSetDB_NAME_MARK: TFIBStringField;
    ProvDataSetDB_SHORT_MARK: TFIBStringField;
    ProvDataSetKR_ID_SCH: TFIBIntegerField;
    ProvDataSetKR_SCH: TFIBStringField;
    ProvDataSetKR_SCH_TITLE: TFIBStringField;
    ProvDataSetKR_SCH_NUMBER: TFIBStringField;
    ProvDataSetKR_SCH_TYPE: TFIBIntegerField;
    ProvDataSetKR_TYPE_OBJECT: TFIBIntegerField;
    ProvDataSetKR_SCH_OBJ_TYPE_TITLE: TFIBStringField;
    ProvDataSetKR_SCH_TYPE_TITLE: TFIBStringField;
    ProvDataSetKR_ID_SYSTEM: TFIBIntegerField;
    ProvDataSetKR_ID_SM: TFIBBCDField;
    ProvDataSetKR_NAME_SM: TFIBStringField;
    ProvDataSetKR_KOD_SM: TFIBIntegerField;
    ProvDataSetKR_ID_RZ: TFIBBCDField;
    ProvDataSetKR_NAME_RZ: TFIBStringField;
    ProvDataSetKR_KOD_RZ: TFIBIntegerField;
    ProvDataSetKR_ID_ST: TFIBBCDField;
    ProvDataSetKR_NAME_ST: TFIBStringField;
    ProvDataSetKR_KOD_ST: TFIBIntegerField;
    ProvDataSetKR_ID_KEKV: TFIBBCDField;
    ProvDataSetKR_NAME_KEKV: TFIBStringField;
    ProvDataSetKR_KOD_KEKV: TFIBIntegerField;
    ProvDataSetKR_ID_MARK: TFIBBCDField;
    ProvDataSetKR_NAME_MARK: TFIBStringField;
    ProvDataSetKR_SHORT_MARK: TFIBStringField;
    ProvDataSetFORMULA: TFIBStringField;
    ProvDataSetIS_EX_PROV: TFIBIntegerField;
    ProvDataSetSUM_DB_PROV: TFIBIntegerField;
    ProvDataSetSUM_KR_PROV: TFIBIntegerField;
    ProvDataSetFDB_SCH: TFIBSmallIntField;
    ProvDataSetFKR_SCH: TFIBSmallIntField;
    ProvDataSetFKOL_MAT: TFIBSmallIntField;
    ProvDataSetFSUMMA: TFIBSmallIntField;
    ProvDataSetIS_GROUP: TFIBSmallIntField;
    ProvDataSetIS_OUT_POS: TFIBSmallIntField;
    ProvDataSetNPROV: TFIBIntegerField;
    ProvDataSetSUM_BY_DB_SCH: TFIBSmallIntField;
    ProvDataSetSUM_BY_DB_SM: TFIBSmallIntField;
    ProvDataSetSUM_BY_DB_RZ: TFIBSmallIntField;
    ProvDataSetSUM_BY_DB_ST: TFIBSmallIntField;
    ProvDataSetSUM_BY_DB_KEKV: TFIBSmallIntField;
    ProvDataSetSUM_BY_KR_SCH: TFIBSmallIntField;
    ProvDataSetSUM_BY_KR_SM: TFIBSmallIntField;
    ProvDataSetSUM_BY_KR_RZ: TFIBSmallIntField;
    ProvDataSetSUM_BY_KR_ST: TFIBSmallIntField;
    ProvDataSetSUM_BY_KR_KEKV: TFIBSmallIntField;
    ProvDataSetSUM_ID_DB_SCH: TFIBBCDField;
    ProvDataSetSUM_DB_SCH_NUMBER: TFIBStringField;
    ProvDataSetSUM_ID_DB_SM: TFIBBCDField;
    ProvDataSetSUM_DB_NAME_SM: TFIBStringField;
    ProvDataSetSUM_DB_KOD_SM: TFIBIntegerField;
    ProvDataSetSUM_ID_DB_RZ: TFIBBCDField;
    ProvDataSetSUM_DB_NAME_RZ: TFIBStringField;
    ProvDataSetSUM_DB_KOD_RZ: TFIBIntegerField;
    ProvDataSetSUM_ID_DB_ST: TFIBBCDField;
    ProvDataSetSUM_DB_NAME_ST: TFIBStringField;
    ProvDataSetSUM_DB_KOD_ST: TFIBIntegerField;
    ProvDataSetSUM_ID_DB_KEKV: TFIBBCDField;
    ProvDataSetSUM_DB_NAME_KEKV: TFIBStringField;
    ProvDataSetSUM_DB_KOD_KEKV: TFIBIntegerField;
    ProvDataSetSUM_ID_KR_SCH: TFIBBCDField;
    ProvDataSetSUM_KR_SCH_NUMBER: TFIBStringField;
    ProvDataSetSUM_ID_KR_SM: TFIBBCDField;
    ProvDataSetSUM_KR_NAME_SM: TFIBStringField;
    ProvDataSetSUM_KR_KOD_SM: TFIBIntegerField;
    ProvDataSetSUM_ID_KR_RZ: TFIBBCDField;
    ProvDataSetSUM_KR_NAME_RZ: TFIBStringField;
    ProvDataSetSUM_KR_KOD_RZ: TFIBIntegerField;
    ProvDataSetSUM_ID_KR_ST: TFIBBCDField;
    ProvDataSetSUM_KR_NAME_ST: TFIBStringField;
    ProvDataSetSUM_KR_KOD_ST: TFIBIntegerField;
    ProvDataSetSUM_ID_KR_KEKV: TFIBBCDField;
    ProvDataSetSUM_KR_NAME_KEKV: TFIBStringField;
    ProvDataSetSUM_KR_KOD_KEKV: TFIBIntegerField;
    procedure CancelButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    DBHANDLE : TISC_DB_HANDLE;
    ID_USER : Int64;
  public
    id_tipd, id_oper, sprav: Integer;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_TIPD: integer);overload;
  end;

var
  DocWorkoperForm: TDocWorkoperForm;

implementation

{$R *.dfm}
constructor TDocWorkoperForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_TIPD: integer);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBHANDLE := DBHandle;
  Self.DBTipDOper.Close;
  Self.DBTipDOper.Handle:=DBHANDLE;
  Self.Caption:='Вибір операцій';
  Self.id_tipd:=aID_TIPD;
  Self.DataSetTipDOper.SelectSQL.Clear;
  Self.DataSetTipDOper.SelectSQL.Add('SELECT * FROM MAT_SP_TIPD_OPER_SELECT(:ID_TIPD)');
  Self.DataSetTipDOper.ParamByName('ID_TIPD').Value:=aID_TIPD;
  Self.DataSetTipDOper.CloseOpen(false);
  Self.sprav:=0;
  Self.ProvDataSet.Close;
  Self.ProvDataSet.SelectSQL.Clear;
  Self.ProvDataSet.SelectSQL.Add('SELECT * FROM MAT_SP_OPER_PROV_SELECT('+IntToStr(DataSetTipDOperID_OPER.AsInt64)+')');
  Self.ProvDataSet.CloseOpen(False);
  end;
end;
procedure TDocWorkoperForm.CancelButtonClick(Sender: TObject);
begin
sprav:=0;
Close;
end;

procedure TDocWorkoperForm.DeleteButtonClick(Sender: TObject);
var id:Integer;
begin
  id:= DataSetTipDOperID_TIPD_OPER.AsInt64;
 if agMessageDlg(MAT_STR_WARNING, MAT_STR_ASK_DELETE, mtConfirmation, [mbYes, mbNo]) = ID_YES then
 begin
 try
    WorkStoredProc.Transaction := Transaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_TIPD_OPER_DELETE';
    WorkStoredProc.Prepare;
    WorkStoredProc.ParamByName('ID_TIPD_OPER').AsInt64:=id;
    WorkStoredProc.ExecProc;
    WorkStoredProc.Transaction.Commit;
     except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkStoredProc.Transaction.Rollback;
     exit;
   end;
  end;
 end;
  DataSetTipDOper.CloseOpen(False);
end;

procedure TDocWorkoperForm.AddButtonClick(Sender: TObject);
begin
 ID_OPER := DataSetTipDOper.FieldByName('ID_OPER').AsInteger;
 sprav:=0;
 Close;
end;

procedure TDocWorkoperForm.SpeedButton1Click(Sender: TObject);
begin
  sprav:=1;
  Close;
end;

procedure TDocWorkoperForm.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ProvDataSet.Close;
  ProvDataSet.SelectSQL.Clear;
  ProvDataSet.SelectSQL.Add('SELECT * FROM MAT_SP_OPER_PROV_SELECT('+IntToStr(DataSetTipDOperID_OPER.AsInt64)+')');
  ProvDataSet.CloseOpen(False);
end;

end.

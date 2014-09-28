unit uSpTipDOper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxInplaceContainer, cxDBTL, cxControls, cxTLData, cxClasses,
  cxGridTableView, Buttons, ExtCtrls, ibase, uResources, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid, FIBQuery,
  pFIBQuery, pFIBStoredProc, uSpOper, uMatasUtils, Menus, ImgList;

type
  TTipDOperForm = class(TForm)
    TopPanel: TPanel;
    AddButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    CancelButton: TSpeedButton;
    RefreshButton: TSpeedButton;
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
    DBTipDOper: TpFIBDatabase;
    DataSetTipDOper: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    DataSource: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableViewID_OPER: TcxGridDBColumn;
    cxGrid1DBTableViewNAME: TcxGridDBColumn;
    DataSetTipDOperID_OPER: TFIBBCDField;
    DataSetTipDOperNAME: TFIBStringField;
    WorkStoredProc: TpFIBStoredProc;
    DataSetTipDOperID_TIPD_OPER: TFIBBCDField;
    cxGrid1DBTableViewID_TIPD_OPER: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    MainImageList: TImageList;
    procedure CancelButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    DBHANDLE : TISC_DB_HANDLE;
    ID_TIP_DOC: Integer;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aId_tip_doc: integer; aName:string);overload;
  end;

var
  TipDOperForm: TTipDOperForm;

implementation

{$R *.dfm}
constructor TTipDOperForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aId_tip_doc: integer; aName:string);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBTipDOper.Close;
  Self.DBHANDLE := DBHandle;
  Self.DBTipDOper.Handle := DBHANDLE;
  Self.Caption:='Вибір документів для '+aName;
  Self.ID_TIP_DOC:=aId_tip_doc;
   Self.DataSetTipDOper.SelectSQL.Clear;
   Self.DataSetTipDOper.SelectSQL.Add('SELECT * FROM MAT_SP_TIPD_OPER_SELECT(:ID_TIPD)');
   Self.DataSetTipDOper.ParamByName('ID_TIPD').Value:=aId_tip_doc;
   Self.DataSetTipDOper.CloseOpen(false);
   Self.AddButton.Caption:=MAT_ACTION_ADD_CONST;
   Self.DeleteButton.Caption:=MAT_ACTION_DELETE_CONST;
   Self.RefreshButton.Caption:=MAT_ACTION_REFRESH_CONST;
   Self.CancelButton.Caption:=MAT_ACTION_CLOSE_CONST;
 end;
end; 
procedure TTipDOperForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TTipDOperForm.AddButtonClick(Sender: TObject);
var Res: Variant;
    ID_OPER, id:Integer;
    vals : array of Variant;
begin
  Res:=uSpOper.GetOper(self, DBTipDOper.Handle,0,0);
  if  VarType(Res) <> varEmpty
  then ID_OPER := Res[0];

  SetLength(Vals, 2);
  Vals[ 0] := ID_TIP_DOC;
  Vals[ 1] := ID_OPER;
  try
    WorkStoredProc.Transaction := Transaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_TIPD_OPER_INSERT';
    WorkStoredProc.Prepare;
    WorkStoredProc.ExecProcedure('MAT_SP_TIPD_OPER_INSERT', vals);
    WorkStoredProc.Transaction.Commit;
     except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkStoredProc.Transaction.Rollback;
     exit;
   end;
  end;
  DataSetTipDOper.CloseOpen(False);
end;

procedure TTipDOperForm.DeleteButtonClick(Sender: TObject);
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

procedure TTipDOperForm.RefreshButtonClick(Sender: TObject);
begin
  DataSetTipDOper.CloseOpen(False);
end;

end.

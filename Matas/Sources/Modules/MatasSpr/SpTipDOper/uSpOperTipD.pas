unit uSpOperTipD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, cxClasses, Buttons,
  ExtCtrls, uSpOper, ibase, uResources, uSpTipDoc, uMatasUtils, Menus,
  ImgList;

type
  TOperTipDForm = class(TForm)
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
    WorkStoredProc: TpFIBStoredProc;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableViewID_TIPD_OPER: TcxGridDBColumn;
    cxGrid1DBTableViewID_TIPD: TcxGridDBColumn;
    DataSetTipDOperID_TIPD_OPER: TFIBBCDField;
    DataSetTipDOperID_TIPD: TFIBBCDField;
    DataSetTipDOperNAME: TFIBStringField;
    cxGrid1DBTableViewNAME: TcxGridDBColumn;
    cxGrid1DBTableViewTIPD: TcxGridDBColumn;
    DataSetTipDOperTIPD: TFIBStringField;
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
    ID_TIP_OPER: Integer;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aId_tip_oper: integer; aName:string);overload;
  end;

var
  OperTipDForm: TOperTipDForm;

implementation

{$R *.dfm}
constructor TOperTipDForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aId_tip_oper: integer; aName:string);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBTipDOper.Close;
  Self.DBHANDLE := DBHandle;
  Self.DBTipDOper.Handle := DBHANDLE;
  Self.Caption:='Вибір документів для '+ '"'+aName+'"';
  Self.ID_TIP_OPER:=aId_tip_oper;
   Self.DataSetTipDOper.SelectSQL.Clear;
   Self.DataSetTipDOper.SelectSQL.Add('SELECT * FROM MAT_SP_OPER_TIPD_SELECT(:ID_OPER)');
   Self.DataSetTipDOper.ParamByName('ID_OPER').Value:=aId_tip_oper;
   Self.DataSetTipDOper.CloseOpen(false);
   Self.AddButton.Caption:=MAT_ACTION_ADD_CONST;
   Self.DeleteButton.Caption:=MAT_ACTION_DELETE_CONST;
   Self.RefreshButton.Caption:=MAT_ACTION_REFRESH_CONST;
   Self.CancelButton.Caption:=MAT_ACTION_CLOSE_CONST;
 end;
end;

procedure TOperTipDForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TOperTipDForm.AddButtonClick(Sender: TObject);
var Res: Variant;
    ID_TIPD, id, id_gr:Integer;
    vals : array of Variant;
begin
  Res:=uSpTipDoc.GetTipDoc(self, DBTipDOper.Handle,0,0);
  if  VarType(Res) <> varEmpty
  then
  begin
   ID_TIPD := Res[0];
   id_gr:=Res[9];
  end;
  if (id_gr=3)or(id_gr=4)or(id_gr=5)then
    begin
      ShowMessage('Це системний документ!!');
      Exit;
    end;
  SetLength(Vals, 2);
  Vals[ 0] := ID_TIPD;
  Vals[ 1] := ID_TIP_OPER;
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

procedure TOperTipDForm.DeleteButtonClick(Sender: TObject);
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

procedure TOperTipDForm.RefreshButtonClick(Sender: TObject);
begin
 DataSetTipDOper.CloseOpen(False);
end;

end.


unit uAddTMC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ibase, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, DB,
  FIBDataSet, ActnList, cxClasses, cxGridTableView, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc, pFIBDataSet,
  cxInplaceContainer, cxDBTL, cxControls, cxTLData, ExtCtrls,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxCurrencyEdit;

type
  TNomnForm = class(TForm)
    pnl1: TPanel;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    Db_tmc: TpFIBDatabase;
    ds_tmc: TpFIBDataSet;
    StPr_tmc: TpFIBStoredProc;
    Tr_tmc: TpFIBTransaction;
    ds1: TDataSource;
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
    actlst1: TActionList;
    actAdd: TAction;
    actClose: TAction;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxDBTreeList1cxDBTreeListColumn4: TcxDBTreeListColumn;
    TR: TpFIBTransaction;
    ds_tmcID_NOMN: TFIBBCDField;
    ds_tmcLINKTO: TFIBBCDField;
    ds_tmcKOD: TFIBStringField;
    ds_tmcNOMN: TFIBStringField;
    ds_tmcNAME: TFIBStringField;
    ds_tmcID_UNIT: TFIBBCDField;
    ds_tmcPRICE: TFIBBCDField;
    ds_tmcNTYPE: TFIBSmallIntField;
    ds_tmcTIP: TFIBBooleanField;
    ds_tmcID_OBJECT: TFIBBCDField;
    ds_tmcNAME_SCH: TFIBStringField;
    ds_tmcSCH_NUMBER: TFIBStringField;
    procedure actCloseExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
  private
   DB_HANDLE:TISC_DB_HANDLE;
  public
    id_group:Integer;
    constructor Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);
  end;

var
  NomnForm: TNomnForm;

implementation

{$R *.dfm}
constructor TNomnForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then
 begin
   Self.DB_HANDLE:=DBHANDLE;
   Self.Db_tmc.Close;
   Self.Db_tmc.Handle:=DBHANDLE;
   Self.Ds_tmc.Close;
//   Self.ds_tmc.SelectSQL.Clear;
//   Self.ds_tmc.SelectSQL.Text:='Select * from MAT_IZNOS_LINK_GRP_TMC_SELECT';
   Self.ds_tmc.CloseOpen(False);
 end;
end;
procedure TNomnForm.actCloseExecute(Sender: TObject);
begin
Close;
end;

procedure TNomnForm.actAddExecute(Sender: TObject);
var i:Integer;
    id_nomn:Integer;
begin
for i := 0 to cxDbTreeList1.SelectionCount-1 do
begin
id_nomn:=StrToInt(cxDBTreeList1.Selections[i].Texts[0]);
  try
   Tr.StartTransaction;
   StPr_tmc.StoredProcName:='MAT_IZNOS_LINK_GRP_TMC_INSERT';
   StPr_tmc.Prepare;
   StPr_tmc.ParamByName('ID_GROUP').AsInteger:=id_group;
   StPr_tmc.ParamByName('ID_NOMN').AsInteger:=id_nomn;
   StPr_tmc.ExecProc;
   StPr_tmc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr_tmc.Transaction.Rollback;
    Exit;
   end;
  end;
end;
 ModalResult:=mrOk;
end;

end.




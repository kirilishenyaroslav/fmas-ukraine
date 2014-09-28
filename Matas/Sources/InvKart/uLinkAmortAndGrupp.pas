unit uLinkAmortAndGrupp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls, cxButtons,
  cxTextEdit, cxContainer, cxMaskEdit, cxDropDownEdit, cxDBEdit, ExtCtrls, ibase,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, Menus;

type
  TGrpAmortForm = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    cxGrpOS: TcxTextEdit;
    lbl3: TLabel;
    cxAdd: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    pFIBDatabase: TpFIBDatabase;
    pFIBDSSch: TpFIBDataSet;
    pFIBDSAmort: TpFIBDataSet;
    pFIBDataSet: TpFIBDataSet;
    ds1: TDataSource;
    ds2: TDataSource;
    ds3: TDataSource;
    pFIBTransaction1: TpFIBTransaction;
    pFIBTransaction2: TpFIBTransaction;
    pFIBTransaction3: TpFIBTransaction;
    pFIBDSSchSCH_NUMBER: TFIBStringField;
    pFIBDSSchID_SCH: TFIBBCDField;
    cxDBSch: TcxComboBox;
    cxDBGrpAmort: TcxComboBox;
    StoredProc: TpFIBStoredProc;
    Transaction: TpFIBTransaction;
    pFIBDataSetID_REC: TFIBBCDField;
    pFIBDataSetDATE_REC: TFIBDateField;
    pFIBDataSetID_NORM_IZN: TFIBBCDField;
    pFIBDataSetID_BAL_SCH: TFIBBCDField;
    pFIBDataSetGRP_NUM: TFIBIntegerField;
    pFIBDataSetSCH_NUMBER: TFIBStringField;
    pFIBDataSetNORM_IZN: TFIBStringField;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    pm1: TPopupMenu;
    Elfkbnm1: TMenuItem;
    procedure cxAddClick(Sender: TObject);
    procedure Elfkbnm1Click(Sender: TObject);
  private
    { Private declarations }
  public
    DBHandle:TISC_DB_HANDLE;
  end;

var
  GrpAmortForm: TGrpAmortForm;

implementation

{$R *.dfm}

procedure TGrpAmortForm.cxAddClick(Sender: TObject);
var i:Integer;
begin
try
 StoredProc.Close;
 StoredProc.Transaction := Transaction;
 StoredProc.Transaction.StartTransaction;
 StoredProc.StoredProcName:='MAT_ADD_LINK_GRP_AMORT';
 StoredProc.Prepare;
 if cxDBSch.Text<>'' then
 StoredProc.ParamByName('NUM_SCH').AsString:=cxDBSch.Text
 else begin Showmessage('Заповніть рахунок!'); Exit; end;
 if cxGrpOS.Text<>'' then
 StoredProc.ParamByName('NUM_GRP').AsInteger:=StrtoInt(cxGrpOS.Text)
 else begin Showmessage('Заповніть групу ОЗ!'); Exit; end;
 if cxDBGrpAmort.Text<>'' then
 StoredProc.ParamByName('NUM_GRP_AM').AsString:=cxDBGrpAmort.Text
 else begin Showmessage('Заповніть групу аммортизації!'); Exit; end;
 StoredProc.ExecProc;
 StoredProc.Transaction.Commit;
 except on E : Exception do
  begin
   ShowMessage(E.Message);
   StoredProc.Transaction.Rollback;
   exit;
  end;
 end;
 pFIBDataSet.CloseOpen(False);
end;

procedure TGrpAmortForm.Elfkbnm1Click(Sender: TObject);
begin
 try
 StoredProc.Close;
 StoredProc.Transaction := Transaction;
 StoredProc.Transaction.StartTransaction;
 StoredProc.StoredProcName:='MAT_DEL_LINK_GRP_AMORT';
 StoredProc.Prepare;
 StoredProc.ParamByName('ID_REC').AsInteger:=pFIBDataSet.FieldByName('ID_REC').AsInteger;
  StoredProc.ExecProc;
 StoredProc.Transaction.Commit;
 except on E : Exception do
  begin
   ShowMessage(E.Message);
   StoredProc.Transaction.Rollback;
   exit;
  end;
 end;
 pFIBDataSet.CloseOpen(False);
end;

end.

unit uProvodki;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxGridBandedTableView,
  cxGridDBBandedTableView, FIBDataSet, FIBDatabase, pFIBDatabase,
  pFIBDataSet, cxLookAndFeelPainters, StdCtrls, cxButtons, ibase,
  cxSplitter, cxContainer, cxTextEdit, cxDBEdit, cxCurrencyEdit;

type
  TProvodkiForm = class(TForm)
    pnl1: TPanel;
    Database: TpFIBDatabase;
    DataSetKr: TpFIBDataSet;
    DataSetDeb: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    dsForGrid: TDataSource;
    dsGrid_2: TDataSource;
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
    cxButton1: TcxButton;
    pnl2: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDB_COR_SCH_NUMBER: TcxGridDBBandedColumn;
    DATE_DOC: TcxGridDBBandedColumn;
    cxGridDB_NUM_DOC: TcxGridDBBandedColumn;
    cxGridDB_SUMMA: TcxGridDBBandedColumn;
    cxGridDB_OSN_SCH_NUMBER: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    DataSetKrKR_COR_ID_SCH: TFIBBCDField;
    DataSetKrKR_COR_SCH_NUMBER: TFIBStringField;
    DataSetKrKR_COR_SCH_TITLE: TFIBStringField;
    DataSetKrKR_PK_ID: TFIBBCDField;
    DataSetKrKR_NUM_DOC: TFIBStringField;
    DataSetKrKR_OSN_ID_SCH: TFIBBCDField;
    DataSetKrKR_OSN_SCH_NUMBER: TFIBStringField;
    DataSetKrKR_OSN_SCH_TITLE: TFIBStringField;
    DataSetKrKR_SUMMA: TFIBBCDField;
    DataSetKrKR_DATE_DOC: TFIBDateField;
    DataSetDebDB_COR_ID_SCH: TFIBBCDField;
    DataSetDebDB_COR_SCH_NUMBER: TFIBStringField;
    DataSetDebDB_COR_SCH_TITLE: TFIBStringField;
    DataSetDebDB_PK_ID: TFIBBCDField;
    DataSetDebDB_NUM_DOC: TFIBStringField;
    DataSetDebDB_OSN_ID_SCH: TFIBBCDField;
    DataSetDebDB_OSN_SCH_NUMBER: TFIBStringField;
    DataSetDebDB_OSN_SCH_TITLE: TFIBStringField;
    DataSetDebDB_SUMMA: TFIBBCDField;
    DataSetDebDB_DATE_DOC: TFIBDateField;
    DataSetDebDB_NOTE: TFIBStringField;
    DataSetKrKR_NOTE: TFIBStringField;
    pnl3: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBBandedTableView1: TcxGridDBBandedTableView;
    cxGridKR_COR_SCH_NUMBER: TcxGridDBBandedColumn;
    KR_DATE_DOC: TcxGridDBBandedColumn;
    cxGridKR_NUM_DOC: TcxGridDBBandedColumn;
    cxGridKR_SUMMA: TcxGridDBBandedColumn;
    cxGridKR_OSN_SCH_NUMBER: TcxGridDBBandedColumn;
    cxGrid2Level1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    pnl4: TPanel;
    lbl1: TLabel;
    P1: TcxDBTextEdit;
    pnl5: TPanel;
    lbl2: TLabel;
    P2: TcxDBTextEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    db_s: TcxDBCurrencyEdit;
    DataSetDebSUMMA_DB_DOC: TFIBBCDField;
    DataSetKrSUMMA_KR_DOC: TFIBBCDField;
    kr_s: TcxDBCurrencyEdit;
    DataSetKrKR_DATE_VIP: TFIBDateField;
    DataSetDebDB_DATE_VIP: TFIBDateField;
    DATE_VIP: TcxGridDBBandedColumn;
    KR_DATE_VIP: TcxGridDBBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    id_pc_tmp, id_ses:Integer;
     constructor Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; id: Integer; id_session:Integer);overload;
  end;

var
  ProvodkiForm: TProvodkiForm;

implementation

{$R *.dfm}
uses uMainOborot;

constructor TProvodkiForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; id: Integer; id_session:Integer);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBHANDLE := DBHandle;
  Self.Database.Close;
  Self.Database.Handle:=DBHANDLE;
  id_ses:= id_session;
  id_pc_tmp:= id;
  Self.DataSetDeb.Close;
  Self.DataSetDeb.SelectSQL.Clear;
  Self.DataSetDeb.SelectSQL.Add('SELECT DB_COR_ID_SCH, DB_COR_SCH_NUMBER, DB_COR_SCH_TITLE,');
  Self.DataSetDeb.SelectSQL.Add('DB_PK_ID, DB_NUM_DOC, DB_OSN_ID_SCH, DB_OSN_SCH_NUMBER, DB_OSN_SCH_TITLE,');
  Self.DataSetDeb.SelectSQL.Add('DB_SUMMA, DB_DATE_DOC, DB_DATE_VIP, DB_NOTE, SUMMA_DB_DOC from PC_TMP_OBOROT_PROV_SELECT(0, :ID_PC_TMP, :ID_SESSION)');
  Self.DataSetDeb.ParamByName('ID_PC_TMP').AsInteger:=ID;
  Self.DataSetDeb.ParamByName('ID_SESSION').AsInteger:=ID_SESSION;
  Self.DataSetDeb.CloseOpen(false);
  Self.DataSetKr.SelectSQL.Clear;
  Self.DataSetKr.SelectSQL.Add('SELECT KR_COR_ID_SCH, KR_COR_SCH_NUMBER, KR_COR_SCH_TITLE,');
  Self.DataSetKr.SelectSQL.Add('KR_PK_ID, KR_NUM_DOC, KR_OSN_ID_SCH, KR_OSN_SCH_NUMBER, KR_OSN_SCH_TITLE,');
  Self.DataSetKr.SelectSQL.Add('KR_SUMMA, KR_DATE_DOC, KR_DATE_VIP, KR_NOTE, SUMMA_KR_DOC from PC_TMP_OBOROT_PROV_SELECT(1, :ID_PC_TMP, :ID_SESSION)');
  Self.DataSetKr.ParamByName('ID_PC_TMP').AsInteger:=id;
  Self.DataSetKr.ParamByName('ID_SESSION').AsInteger:=ID_SESSION;
  Self.DataSetKr.CloseOpen(false);
 end;
end;

procedure TProvodkiForm.FormCreate(Sender: TObject);
begin
Width:=868;
Height:=461;
end;

procedure TProvodkiForm.cxButton1Click(Sender: TObject);
begin
Close;
end;

end.

unit uProvodkiValute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, cxSplitter,
  cxGridDBTableView, cxCurrencyEdit, cxDBEdit, cxContainer, cxTextEdit,
  StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxButtons, ExtCtrls, ibase, cxLabel, cxDBLabel, uMainFanc;

type
  TProvodkiValuteForm = class(TForm)
    pnl1: TPanel;
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
    pnl4: TPanel;
    lbl1: TLabel;
    lbl3: TLabel;
    P1: TcxDBTextEdit;
    db_s: TcxDBCurrencyEdit;
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
    pnl5: TPanel;
    lbl2: TLabel;
    lbl4: TLabel;
    P2: TcxDBTextEdit;
    kr_s: TcxDBCurrencyEdit;
    cxSplitter1: TcxSplitter;
    Database: TpFIBDatabase;
    DataSetKr: TpFIBDataSet;
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
    DataSetKrKR_NOTE: TFIBStringField;
    DataSetKrSUMMA_KR_DOC: TFIBBCDField;
    DataSetDeb: TpFIBDataSet;
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
    DataSetDebSUMMA_DB_DOC: TFIBBCDField;
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
    DataSetKrSUMMA_KR_DOC_VAL: TFIBBCDField;
    DataSetKrKR_SUMMA_VAL: TFIBBCDField;
    DataSetKrID_VALUTE: TFIBBCDField;
    DataSetKrCODE_VALUTE: TFIBStringField;
    DataSetKrSYMBOL: TFIBStringField;
    DataSetKrNAME_VAL: TFIBStringField;
    DataSetDebSUMMA_DB_DOC_VAL: TFIBBCDField;
    DataSetDebDB_SUMMA_VAL: TFIBBCDField;
    DataSetDebID_VALUTE: TFIBBCDField;
    DataSetDebCODE_VALUTE: TFIBStringField;
    DataSetDebSYMBOL: TFIBStringField;
    DataSetDebNAME_VAL: TFIBStringField;
    lbl5: TLabel;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    lbl6: TLabel;
    cxDBCurrencyEdit2: TcxDBCurrencyEdit;
    lbl7: TLabel;
    cxDBCurrencyEdit3: TcxDBCurrencyEdit;
    DataSetDebKURS: TFIBBCDField;
    DataSetKrKURS: TFIBBCDField;
    lbl8: TLabel;
    cxDBLabel1: TcxDBLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    cxDBCurrencyEdit4: TcxDBCurrencyEdit;
    cxDBLabel2: TcxDBLabel;
    cxGridDB_SUMMA_VAL: TcxGridDBBandedColumn;
    cxGridKR_SUMMA_VAL: TcxGridDBBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure DataSetDebDB_SUMMA_VALGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DataSetKrKR_SUMMA_VALGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DataSetDebSUMMA_DB_DOC_VALGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DataSetKrSUMMA_KR_DOC_VALGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    DBHANDLE:TISC_DB_HANDLE;
  public
    id_pc_tmp, id_ses:Integer;
     constructor Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; id: Integer; id_session:Integer);overload;

  end;

var
  ProvodkiValuteForm: TProvodkiValuteForm;

implementation

{$R *.dfm}
constructor TProvodkiValuteForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; id: Integer; id_session:Integer);
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
  Self.DataSetDeb.SelectSQL.Add('DB_SUMMA, DB_DATE_DOC, DB_NOTE, SUMMA_DB_DOC, SUMMA_DB_DOC_VAL, DB_SUMMA_VAL, ID_VALUTE, CODE_VALUTE, symbol, NAME_VAL, kurs  from PC_TMP_OBOROT_PROV_VAL_SELECT(0, :ID_PC_TMP, :ID_SESSION)');
  Self.DataSetDeb.ParamByName('ID_PC_TMP').AsInteger:=ID;
  Self.DataSetDeb.ParamByName('ID_SESSION').AsInteger:=ID_SESSION;
  Self.DataSetDeb.CloseOpen(false);
  Self.DataSetKr.SelectSQL.Clear;
  Self.DataSetKr.SelectSQL.Add('SELECT KR_COR_ID_SCH, KR_COR_SCH_NUMBER, KR_COR_SCH_TITLE,');
  Self.DataSetKr.SelectSQL.Add('KR_PK_ID, KR_NUM_DOC, KR_OSN_ID_SCH, KR_OSN_SCH_NUMBER, KR_OSN_SCH_TITLE,');
  Self.DataSetKr.SelectSQL.Add('KR_SUMMA, KR_DATE_DOC, KR_NOTE, SUMMA_KR_DOC, SUMMA_KR_DOC_VAL, KR_SUMMA_VAL, ID_VALUTE, CODE_VALUTE, symbol, NAME_VAL, kurs from PC_TMP_OBOROT_PROV_VAL_SELECT(1, :ID_PC_TMP, :ID_SESSION)');
  Self.DataSetKr.ParamByName('ID_PC_TMP').AsInteger:=id;
  Self.DataSetKr.ParamByName('ID_SESSION').AsInteger:=ID_SESSION;
  Self.DataSetKr.CloseOpen(false);
 end;
end;
procedure TProvodkiValuteForm.FormCreate(Sender: TObject);
begin
Width:=868;
Height:=461;

end;

procedure TProvodkiValuteForm.cxButton1Click(Sender: TObject);
begin
Close;
end;

procedure TProvodkiValuteForm.DataSetDebDB_SUMMA_VALGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if DatasetDeb.FieldValues['DB_SUMMA_VAL']<>null then
 text:=FloatToStrF(DatasetDeb.FieldValues['DB_SUMMA_VAL'], ffNumber, 18, 2)+' '+DatasetDeb.FieldValues['Symbol'];
end;

procedure TProvodkiValuteForm.DataSetKrKR_SUMMA_VALGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if DatasetKR.FieldValues['KR_SUMMA_VAL']<>null then
text:=FloatToStrF(DatasetKR.FieldValues['KR_SUMMA_VAL'], ffNumber, 18, 2)+' '+DatasetKR.FieldValues['Symbol'];
end;

procedure TProvodkiValuteForm.DataSetDebSUMMA_DB_DOC_VALGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
if  DatasetDeb.FieldValues['SUMMA_DB_DOC_VAL']<>null then
text:=FloatToStrF(DatasetDeb.FieldValues['SUMMA_DB_DOC_VAL'], ffNumber, 18, 2)+' '+DatasetDeb.FieldValues['Symbol'];
end;

procedure TProvodkiValuteForm.DataSetKrSUMMA_KR_DOC_VALGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if DatasetKr.FieldValues['SUMMA_KR_DOC_VAL']<>null then
text:=FloatToStrF(DatasetKR.FieldValues['SUMMA_KR_DOC_VAL'], ffNumber, 18, 2)+' '+DatasetKR.FieldValues['Symbol'];
end;

end.

unit EroorDocprov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FIBDataSet, pFIBDataSet, RxMemDS, cxClasses,
  IBase, FIBDatabase, pFIBDatabase;

type
  TfrmErrorDocProv = class(TForm)
    StatusBar1: TStatusBar;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    RxMemoryDataPrintSetup: TRxMemoryData;
    pFIBDataSetSelect: TpFIBDataSet;
    DataSource: TDataSource;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    GridDBViewDBColumn1: TcxGridDBColumn;
    GridDBViewDBColumn2: TcxGridDBColumn;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    GridDBViewDBColumn3: TcxGridDBColumn;
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_session_kernel:Int64)overload;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmErrorDocProv: TfrmErrorDocProv;

implementation
uses cn_MainReportsAnalyzSmeta;
{$R *.dfm}

constructor TfrmErrorDocProv.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_session_kernel:Int64);
var
  i:Integer;
begin
inherited Create(AOwner);

DB.Handle:=DB_Handle;

pFIBDataSetSelect.Active:=False;
pFIBDataSetSelect.Database:=DB;
pFIBDataSetSelect.Transaction:=ReadTransaction;
pFIBDataSetSelect.SelectSQL.Text:='select * from CN_REPORT_GETERROR_DOCPROV(:KEY_SESSION)';
pFIBDataSetSelect.ParamByName('KEY_SESSION').AsInt64:=id_session_kernel;
pFIBDataSetSelect.Active:=True;
pFIBDataSetSelect.FetchAll;
RxMemoryDataPrintSetup.Active:=True;
RxMemoryDataPrintSetup.EmptyTable;

pFIBDataSetSelect.First;
for i:=0 to pFIBDataSetSelect.RecordCount-1 do
  begin
    RxMemoryDataPrintSetup.Last;
    RxMemoryDataPrintSetup.Open;
    RxMemoryDataPrintSetup.Insert;
    RxMemoryDataPrintSetup.FieldByName('NAME').AsString:=pFIBDataSetSelect.FieldByName('ERROR_MESSAGE').AsString;
    if pFIBDataSetSelect.FieldByName('TYPE_ERROR').AsInteger=1 then
      begin
        RxMemoryDataPrintSetup.FieldByName('NAME_ERROR').AsString:='док.';
      end
      else
      begin
        RxMemoryDataPrintSetup.FieldByName('NAME_ERROR').AsString:='пров.';
      end;
    RxMemoryDataPrintSetup.FieldByName('PROV').AsString:=pFIBDataSetSelect.FieldByName('TEXT_PROV').AsString;
    RxMemoryDataPrintSetup.Post;
    pFIBDataSetSelect.Next;
  end;
end;



end.

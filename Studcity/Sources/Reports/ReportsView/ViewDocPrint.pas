unit ViewDocPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  frxClass, frxDBSet, FIBQuery, pFIBQuery, pFIBStoredProc,StudcityConst,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookAndFeelPainters, StdCtrls, cxButtons, DBCtrls,
  LoadPackegeStudCity,St_ser_function, frxExportRTF, frxExportPDF,
  frxExportImage, frxExportXLS, frxExportTXT, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, dxBarExtItems, dxBar;

type
  TfrmViewDocPrint = class(TForm)
    cxLabelNameReports: TcxLabel;
    pFIBDataSetNameReports: TpFIBDataSet;
    ComboBoxNameReports: TDBLookupComboBox;
    DataSourceNameReports: TDataSource;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    frxTXTExport1: TfrxTXTExport;
    frxXLSExport2: TfrxXLSExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyletoone: TcxStyle;
    dxBarManager1: TdxBarManager;
    ExitBtn: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    procedure PrintButtonClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
  private
    constructor Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);overload;
    { Private declarations }
  public
    id_people_print:Int64;
    Lang:Integer;
    { Public declarations }
  end;

function ViewDocPrintR(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;stdcall;
exports ViewDocPrintR;

var
  frmViewDocPrint: TfrmViewDocPrint;


implementation
{$R *.dfm}
function ViewDocPrintR(AOwner:TComponent;DB:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer):Integer;
var
  view: TfrmViewDocPrint;
begin
  view:= TfrmViewDocPrint.Create(AOwner,DB,id_people,type_doc_print);
  view.ShowModal;
  view.Free;
end;

constructor TfrmViewDocPrint.Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE;id_people:Int64;type_doc_print:integer);
var
  dateopl:TDateTime;
begin
  Inherited Create(Aowner);

  Database.Handle:=DBL;
  ReadTransaction.Active:=true;

  Lang:=ST_serLanguageIndex(DBL);

  cxLabelNameReports.Caption:=StudcityConst.Studcity_REPORTS_NAME_DOC;
  Caption:=StudcityConst.Studcity_REPORTS_NAME_DOC;
  //cxButtonOK.Caption:=StudcityConst.Studcity_ACTION_OK_CONST;
  //cxButtonExit.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST;
  PrintButton.Caption:=StudcityConst.Studcity_ACTION_OK_CONST;
  ExitBtn.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST;

  with pFIBDataSetNameReports do
    begin
      Database:=Database;
      Transaction:=ReadTransaction;
      ComboBoxNameReports.ListField:='NAME_DOC';
      ComboBoxNameReports.KeyField:='FUNCTION_TYPE';
      close;
      sqls.SelectSQL.Text := 'select * from ST_SP_TYPE_DOC where TYPE_DOC=1 and TYPE_DOC=:TYPE_DOC order by NAME_DOC';
      ParamByName('TYPE_DOC').AsInteger := type_doc_print;
      Open;
      FetchAll;
    end;
   id_people_print:=id_people;
   ComboBoxNameReports.KeyValue:='PrintPropusk';
end;

procedure TfrmViewDocPrint.PrintButtonClick(Sender: TObject);
begin
ComboBoxNameReports.KeyValue:=pFIBDataSetNameReports['FUNCTION_TYPE'];
if ComboBoxNameReports.Text<>'' then
  begin
    LoadPackegeStudCity.LoadViewPrintPropi(self,Database.Handle,id_people_print,0,ComboBoxNameReports.KeyValue);
{    with pFIBDataSetNameReports do
      begin
        Database:=Database;
        Transaction:=ReadTransaction;
        Active:=false;
        Active:=true;
        FetchAll;
      end;}
  end;
end;

procedure TfrmViewDocPrint.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

end.

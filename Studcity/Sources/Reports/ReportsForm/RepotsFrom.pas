unit RepotsFrom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Ibase, ComCtrls, FIBDatabase, pFIBDatabase, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBDataSet, pFIBDataSet,LoadPackegeStudCity, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit,StudcityConst, st_common_funcs;

type
  TfrmMainFormReports = class(TForm)
    StatusBar1: TStatusBar;
    Database: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    cxGridAllReportsDBTableView1: TcxGridDBTableView;
    cxGridAllReportsLevel1: TcxGridLevel;
    cxGridAllReports: TcxGrid;
    StyleRepository: TcxStyleRepository;
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
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    DataSourceAllReports: TDataSource;
    pFIBDataSetAllReports: TpFIBDataSet;
    NAME_REPORT: TcxGridDBColumn;
    NAME_GROUP: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGridAllReportsDBTableView1DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxGridAllReportsDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);overload;
    { Public declarations }
  end;
  function LoadReports(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
  exports LoadReports;
var
  frmMainFormReports: TfrmMainFormReports;
implementation
{$R *.dfm}

function LoadReports(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
   Reports:TfrmMainFormReports;
begin
  If IsMDIChildFormShow(TfrmMainFormReports) then exit;

  Reports:=TfrmMainFormReports.Create(AOwner,DB);
end;

Constructor TfrmMainFormReports.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
begin
  Inherited Create(AOwner);
  Database.Handle:=DB;

  Caption:=StudcityConst.Studcity_REPORTS_FORM;
  NAME_REPORT.Caption:=StudcityConst.Studcity_REPORTS_NAME;

  pFIBDataSetAllReports.Active:=false;
  pFIBDataSetAllReports.Active:=true;
  pFIBDataSetAllReports.FetchAll;
end;

procedure TfrmMainFormReports.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMainFormReports.cxGridAllReportsDBTableView1DblClick(
  Sender: TObject);
begin
if pFIBDataSetAllReports.RecordCount>0 then
  begin
    if pFIBDataSetAllReports.FieldByName('NAME_BPL').AsString<>'' then
      begin
        LoadPackegeStudCity.LoadReportsForm(self,Database.Handle,pFIBDataSetAllReports.FieldByName('NAME_BPL').AsString);
      end;
  end;
end;

procedure TfrmMainFormReports.FormDestroy(Sender: TObject);
begin
  pFIBDataSetAllReports.Active:=false;
  if ReadTransaction.InTransaction then
    ReadTransaction.commit;
//  Database.Handle:=nil;
{  Database.Destroy;
  ReadTransaction.Destroy;
  pFIBDataSetAllReports.Destroy;}
end;

procedure TfrmMainFormReports.cxGridAllReportsDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if key=VK_RETURN	then
  begin
   cxGridAllReportsDBTableView1DblClick(sender);
  end;
end;

end.

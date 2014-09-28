unit AcctCard_Report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, dxBar, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, ibase, ZProc, AcctCard_MainForm;

type
  TFZReport = class(TForm)
    GridDBTableView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
    dxBarManager1: TdxBarManager;
    Styles: TcxStyleRepository;
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
  private
    PLanguageIndex:Byte;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;AType:integer);reintroduce;
  end;

var
  FZReport: TFZReport;

implementation

uses AcctCard_DM;

{$R *.dfm}
constructor TFZReport.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;AType:integer);
var i:byte;
begin
 inherited Create(AOwner);
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 Caption                   := 'Çâ³ò';
 if(AType=1)then
 begin
//   GridDBTableView.DataController.DataSource:=
 end;
end;

end.

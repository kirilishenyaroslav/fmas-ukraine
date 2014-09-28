unit Gar_Ved_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, gr_uCommonLoader,
  gar_Ved_DM,  gar_Types, ZTypes, ActnList,
  cxGridBandedTableView, gr_uMessage, gr_uCommonConsts, gr_uCommonProc,
  cxCalendar, cxSplitter, Dates;

type
  TFMainVed = class(TForm)
    BarManager: TdxBarManager;
    dxBarGroup1: TdxBarGroup;
    ActionList1: TActionList;
    ActionUpate: TAction;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    Panel1: TPanel;
    Panel2: TPanel;
    cxGrid2: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxGrid1Payment: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2DBColumn13: TcxGridDBColumn;
    cxGridDBTableView2DBColumn15: TcxGridDBColumn;
    cxGridDBTableView2DBColumn10: TcxGridDBColumn;
    cxGridDBTableView2DBColumn11: TcxGridDBColumn;
    cxGridDBTableView2DBColumn6: TcxGridDBColumn;
    cxGridDBTableView2DBColumn7: TcxGridDBColumn;
    cxGridDBTableView2DBColumn8: TcxGridDBColumn;
    cxGridDBTableView2DBColumn9: TcxGridDBColumn;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    cxGridDBTableView2DBColumn2: TcxGridDBColumn;
    cxGridDBTableView2DBColumn3: TcxGridDBColumn;
    cxGridDBTableView2DBColumn4: TcxGridDBColumn;
    cxGridDBTableView2DBColumn5: TcxGridDBColumn;
    cxGridDBTableView2DBColumn12: TcxGridDBColumn;
    cxGridDBTableView2DBColumn14: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    cxSplitter1: TcxSplitter;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton2: TdxBarLargeButton;
    act1: TAction;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure cxGridDBColumn2GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure dxBarLargeButton2Click(Sender: TObject);
  private
    PLanguageIndex:integer;
  public
    constructor Create(Param:TgarSimpleParam);reintroduce;
  end;

var  FMainVed:TFMainVed;

implementation

{$R *.dfm}


constructor TFMainVed.Create(Param:TgarSimpleParam);
begin
 DM:=TDM.Create(Param);
 inherited Create(Param.Owner);
 PLanguageIndex:=IndexLanguage;
 WindowState := wsMaximized;
 cxGridDBTableView1.DataController.DataSource:=DM.DataSource1;
 cxGridDBTableView2.DataController.DataSource:=DM.DataSource2;
 cxGridDBTableView3.DataController.DataSource:=DM.DataSource3;
end;

procedure TFMainVed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Free;
end;

procedure TFMainVed.dxBarLargeButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFMainVed.cxGridDBColumn2GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText:=KodSetupToPeriod(StrToInt(AText),3);
end;

procedure TFMainVed.dxBarLargeButton2Click(Sender: TObject);
begin
  DM.pFIBDataSet1.Close;
  DM.pFIBDataSet1.Open;
end;

end.

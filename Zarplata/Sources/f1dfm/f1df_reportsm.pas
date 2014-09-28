unit f1df_reportsm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxGridBandedTableView, dxBar,
  dxBarExtItems, iBase, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  unit_zGlobal_Consts, zProc, dxStatusBar, Menus;

type
  TF1DfReports = class(TForm)
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1ClYear: TcxGridDBColumn;
    Grid1ClKvartal: TcxGridDBColumn;
    grid1ClPachka: TcxGridDBColumn;
    Grid1ClType: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
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
    DSource: TDataSource;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    DefaulTransaction: TpFIBTransaction;
    dxStatusBar1: TdxStatusBar;
    procedure RefreshBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure Grid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
   pLanguageIndex:Byte;
   pId:integer;
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id_report:integer);reintroduce;
    property Id:Integer read pId;
  end;

function GetReport(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id_report:integer):integer;

implementation

{$R *.dfm}

function GetReport(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id_report:integer):integer;
var Form:TF1DfReports;
begin
 Result:=0;
 Form := TF1DfReports.Create(AOwner,DB_Handle,Id_report);
 if Form.ShowModal=mrYes then
    Result := Form.Id;
 Form.Destroy;
end;

constructor TF1DfReports.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id_report:integer);
var i:integer;
begin
 inherited Create(AOwner);
//------------------------------------------------------------------------------
 pLanguageIndex                := LanguageIndex;
 Caption                       := Report_Caption[pLanguageIndex];
 RefreshBtn.Caption            := RefreshBtn_Caption[pLanguageIndex];
 SelectBtn.Caption             := SelectBtn_Caption[pLanguageIndex];
 ExitBtn.Caption               := ExitBtn_Caption[pLanguageIndex];
//------------------------------------------------------------------------------
 Grid1ClKvartal.Caption        := GridClKvartal_Caption[PLanguageIndex];
 Grid1ClYear.Caption           := GridClYear_Caption[PLanguageIndex];
 grid1ClPachka.Caption         := GridClNumber_Caption[PLanguageIndex];
 Grid1ClType.Caption           := GridClType_Caption[PLanguageIndex];
//------------------------------------------------------------------------------
 for i:=0 to dxStatusBar1.Panels.Count-1 do
  dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
 dxStatusBar1.Panels[0].Text   := ShortCutToText(RefreshBtn.ShortCut)+' - '+RefreshBtn.Caption;
 dxStatusBar1.Panels[1].Text   := ShortCutToText(SelectBtn.ShortCut)+' - '+SelectBtn.Caption;
 dxStatusBar1.Panels[2].Text   := ShortCutToText(ExitBtn.ShortCut)+' - '+ExitBtn.Caption;
//------------------------------------------------------------------------------
 DB.Handle := DB_Handle;
 DSet.SQLs.SelectSQL.Text := 'select * from Z_1DF_S_REP_FOR_COR('+IntToStr(Id_report)+')';
 DSet.Open;
//------------------------------------------------------------------------------
 Grid1DBTableView1FocusedRecordChanged(Grid1DBTableView1,nil,Grid1DBTableView1.Controller.FocusedRecord,True);
end;

procedure TF1DfReports.RefreshBtnClick(Sender: TObject);
begin
DSet.CloseOpen(True);
end;

procedure TF1DfReports.ExitBtnClick(Sender: TObject);
begin
close;
end;

procedure TF1DfReports.SelectBtnClick(Sender: TObject);
begin
 pId:= DSet['ID'];
 ModalResult:=mrYes;
end;

procedure TF1DfReports.Grid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
SelectBtn.Enabled := not((AFocusedRecord=nil) or (AFocusedRecord.Expandable));
end;

procedure TF1DfReports.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if DefaulTransaction.InTransaction then DefaulTransaction.Rollback;
end;

end.

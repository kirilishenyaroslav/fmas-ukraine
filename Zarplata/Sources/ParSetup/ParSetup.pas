unit ParSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, cxGridBandedTableView, dxBar, dxBarExtItems, IBase, Dates,
  FIBQuery, pFIBQuery, pFIBStoredProc, ZMessages, Unit_ZGlobal_Consts, zTypes,
  z_dmCommonStyles, dxStatusBar, zProc;

type
  TfParSet = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    DSource: TDataSource;
    Grid1ClKodSetupEnd: TcxGridDBColumn;
    Grid1ClProcProf: TcxGridDBColumn;
    Grid1ClProcPens: TcxGridDBColumn;
    Grid1ClProcZan: TcxGridDBColumn;
    Grid1ClProcSoc: TcxGridDBColumn;
    Grid1ClProcNSluch: TcxGridDBColumn;
    Grid1ClProcInv: TcxGridDBColumn;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    SProc: TpFIBStoredProc;
    dxStatusBar1: TdxStatusBar;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    procedure Grid1ClKodSetupEndGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure InsertBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    PLanguageIndex:byte;
    PStyles: TStylesDM;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE); reintroduce;
    procedure DSetReOpen;
  end;

  function View_FZ_ParSetup(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
   exports View_FZ_ParSetup;


{var
  fParSet: TfParSet;}

implementation
uses ParEditor;

{$R *.dfm}

function View_FZ_ParSetup(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
var ViewForm:TfParSet;
begin
  if IsMDIChildFormShow(TfParSet) then Exit;
  ViewForm:=TfParSet.Create(AOwner,DB);
  if ViewForm.ModalResult=mrNone then
    ViewForm.Show;
end;

constructor TfParSet.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
var i:integer;
begin
 inherited Create(AOwner);
//******************************************************************************
 DB.Handle:=AHandle;
 Transaction.StartTransaction;
 DSetReOpen;
 PLanguageIndex:=1;
 PStyles:=TStylesDM.Create(self);
 cxGrid1DBTableView1.Styles:=PStyles.GridTableViewStyleSheetDevExpress.Styles;
//******************************************************************************
   Caption := FZ_ParSetup_Caption[PLanguageIndex];
   InsertBtn.Caption := InsertBtn_Caption[PLanguageIndex];
   UpdateBtn.Caption := UpdateBtn_Caption[PLanguageIndex];
   DeleteBtn.Caption := DeleteBtn_Caption[PLanguageIndex];
   RefreshBtn.Caption:= RefreshBtn_Caption[PLanguageIndex];
   ExitBtn.Caption   := ExitBtn_Caption[PLanguageIndex];
   Grid1ClKodSetupEnd.Caption  := GridClKodSetupEnd_Caption[PLanguageIndex];
   Grid1ClProcPens.Caption     := GridClProcPens_Caption[PLanguageIndex];
   Grid1ClProcProf.Caption     := GridClProcProf_Caption[PLanguageIndex];
   Grid1ClProcInv.Caption      := GridClProcInv_Caption[PLanguageIndex];
   Grid1ClProcNSluch.Caption   := GridClProcNSluch_Caption[PLanguageIndex];
   Grid1ClProcSoc.Caption      := GridClProcSoc_Caption[PLanguageIndex];
   Grid1ClProcZan.Caption      := GridClProcZan_Caption[PLanguageIndex];
//******************************************************************************
   dxStatusBar1.Panels[0].Text:= InsertBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[1].Text:= UpdateBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[2].Text:= DeleteBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[3].Text:= RefreshBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[4].Text:= ExitBtn_Hint[PLanguageIndex];

   for i:=0 to dxStatusBar1.Panels.Count-1 do
     dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
end;

procedure TfParSet.DSetReOpen;
begin
  if DSet.Active then DSet.Close;
  DSet.Open;
  DSet.First;
end;

procedure TfParSet.Grid1ClKodSetupEndGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if Atext<>'' then
    AText:=KodSetupToPeriod(StrToInt(AText),2);
end;

procedure TfParSet.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TfParSet.RefreshBtnClick(Sender: TObject);
begin
  DSetReOpen;
end;

procedure TfParSet.InsertBtnClick(Sender: TObject);
begin
  View_FZ_ParEditor(self,DSet,zcfsInsert);
end;

procedure TfParSet.UpdateBtnClick(Sender: TObject);
begin
  View_FZ_ParEditor(self,DSet,zcfsUpdate);
end;

procedure TfParSet.DeleteBtnClick(Sender: TObject);
begin
  View_FZ_ParEditor(self,DSet,zcfsDelete);
end;

procedure TfParSet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfParSet.FormResize(Sender: TObject);
var i:integer;
begin
   for i:=0 to dxStatusBar1.Panels.Count-1 do
     dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
end;

end.

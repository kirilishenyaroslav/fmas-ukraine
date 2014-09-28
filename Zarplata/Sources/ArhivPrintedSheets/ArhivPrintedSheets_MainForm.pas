unit ArhivPrintedSheets_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, Unit_ZGlobal_Consts,
  ComCtrls, ToolWin, FIBDatabase,ZProc, ArhivPrintedSheets_MainDM,
  pFIBDatabase, FIBDataSet, pFIBDataSet, IBase, dxBar, dxBarExtItems,
  cxTextEdit, ZSvodLoaderUnit, ZSvodTypesUnit, PackageLoad;

type
  TArhivReportsSheet = class(TForm)
    BarManager: TdxBarManager;
    ExitBtn: TdxBarLargeButton;
    Grid: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    GridClTime: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    GridClTypePayment: TcxGridDBColumn;
    PrintBtn: TdxBarLargeButton;
    FileToBankBtn: TdxBarLargeButton;
    NewPrintBtn: TdxBarLargeButton;
    FilterBtn: TdxBarLargeButton;
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
    procedure ExitBtnClick(Sender: TObject);
    procedure NewPrintBtnClick(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure FileToBankBtnClick(Sender: TObject);
    procedure GridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    PMainDM:TDM;
    PLanguageIndex:Byte;
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TArhivReportsSheet.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
inherited Create(AOwner);
//******************************************************************************
PLanguageIndex := LanguageIndex;
PMainDM := TDM.Create(Self,DB_Handle);
//******************************************************************************
 Self.Caption := ArhivPrintedSheet_Caption[PLanguageIndex];
 GridDBTableView1.DataController.DataSource:=PMainDM.DSource;
 PrintBtn.Caption := PrintBtn_Caption[PLanguageIndex];
 FilterBtn.Caption := FilterBtn_Caption[PLanguageIndex];
 ExitBtn.Caption := ExitBtn_Caption[PLanguageIndex];
 FileToBankBtn.Caption := FileToBankBtn_Caption[PLanguageIndex];
 NewPrintBtn.Caption := NewPrintBtn_Caption[PLanguageIndex];
 GridClTypePayment.Caption := GridClTypePayment_Caption[PLanguageIndex];
 GridClTime.Caption := GridClDateTimePrint_Caption[PLanguageIndex];
//******************************************************************************
GridDBTableView1FocusedRecordChanged(GridDBTableView1,nil,GridDBTableView1.Controller.FocusedRecord,True);
end;

procedure TArhivReportsSheet.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TArhivReportsSheet.NewPrintBtnClick(Sender: TObject);
var Param:TSheetToBankAllParameter;
begin
Param.DB_Handle:=PMainDM.DB.Handle;
Param.Owner := Self;
Param.Id_session := 0;
if PrintSheetAllToBank(Param)=True then
 PMainDM.DSet.CloseOpen(True);
end;

procedure TArhivReportsSheet.FilterBtnClick(Sender: TObject);
var KodSetup:integer;
begin
KodSetup:=LoadFilterKodSetup(self,PMainDM.DB.Handle,PMainDM.KodSetup);
if KodSetup<>PMainDM.KodSetup then PMainDM.KodSetup:=KodSetup;
end;

procedure TArhivReportsSheet.PrintBtnClick(Sender: TObject);
var Param:TSheetToBankAllParameter;
begin
Param.DB_Handle:=PMainDM.DB.Handle;
Param.Owner := Self;
Param.Id_session := PMainDM.DSet['ID_SESSION'];
PrintSheetAllToBank(Param);
end;

procedure TArhivReportsSheet.FileToBankBtnClick(Sender: TObject);
begin
LoadBankExportPackage(self,PMainDM.DB.Handle,PMainDM.DSet['ID_SESSION']);
end;

procedure TArhivReportsSheet.GridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if AFocusedRecord=nil then
 begin
  FileToBankBtn.Enabled := False;
  PrintBtn.Enabled := False;
 end
else
 begin
  FileToBankBtn.Enabled := True;
  PrintBtn.Enabled := True;
 end;
end;

end.

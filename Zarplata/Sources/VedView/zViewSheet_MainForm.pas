unit zViewSheet_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, dxBar, dxBarExtItems,
  cxSplitter, cxLabel, cxContainer, cxTextEdit, cxMaskEdit, cxDBEdit,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxDockPanel, dxDockControl, Unit_VedView_Consts, cxMemo,
  FIBQuery, pFIBQuery, ZProc, Dates, ZTypes, gr_CountSheet_Filter,
  PackageLoad, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  gr_uCommonConsts, gr_uCommonProc, gr_uCommonTypes, gr_dmCommonStyles, gr_uMessage,
  cxCurrencyEdit, zcxLocateBar;

type
  TFgrCountSheets = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    DSource2: TDataSource;
    DSource1: TDataSource;
    DataBase: TpFIBDatabase;
    DSet2: TpFIBDataSet;
    DSet1: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    dxBarDockControl2: TdxBarDockControl;
    FilterBtn: TdxBarLargeButton;
    DockSite: TdxDockSite;
    dxDockPanelSpisok: TdxDockPanel;
    dxDockPanelSheet: TdxDockPanel;
    dxLayoutDockSite2: TdxLayoutDockSite;
    dxDockPanelData: TdxDockPanel;
    ContainerDockSite: TdxTabContainerDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1Level1: TcxGridLevel;
    Grid1: TcxGrid;
    Grid3DBTableView1: TcxGridDBTableView;
    Grid3Level1: TcxGridLevel;
    Grid3: TcxGrid;
    Grid2DBTableView1: TcxGridDBTableView;
    Grid2Level1: TcxGridLevel;
    Grid2: TcxGrid;
    Grid3ClNameVidOpl: TcxGridDBColumn;
    Grid3ClKodVidOpl: TcxGridDBColumn;
    Grid3ClSumma: TcxGridDBColumn;
    Grid1ClKodSheet: TcxGridDBColumn;
    Grid1ClViplata: TcxGridDBColumn;
    Grid1ClKodSetup: TcxGridDBColumn;
    Grid2ClTn: TcxGridDBColumn;
    Grid2ClFIO: TcxGridDBColumn;
    Grid2ClSumma: TcxGridDBColumn;
    Grid2ClTin: TcxGridDBColumn;
    Grid1ClKodSmeta: TcxGridDBColumn;
    Grid1ClKodDepartment: TcxGridDBColumn;
    Grid1ClTypePayment: TcxGridDBColumn;
    BarDockControlLocate: TdxBarDockControl;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    Grid1ClKurs: TcxGridDBColumn;
    LabelSmeta: TcxLabel;
    LabelDepartment: TcxLabel;
    LabelTypeSheet: TcxLabel;
    DSet3: TpFIBDataSet;
    DSource3: TDataSource;
    Grid3ClP1: TcxGridDBColumn;
    Grid3ClKodSetup3: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitBtnClick(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure ContainerDockSiteActiveChildChanged(
      Sender: TdxContainerDockSite; Child: TdxCustomDockControl);
    procedure RefreshBtnClick(Sender: TObject);
    procedure cxGrid2DBTableView1DataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure Grid3ClP1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure Grid3ClKodSetup3GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure DeleteBtnClick(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
  private
    PParameter:UVVedFilter;
    PMode:TUVTypeViewSheet;
    PlanguageIndex:byte;
    pStylesDM:TStylesDM;
    pTypeForm:TgrUVParam;
    pLocateBar:TZBarLocate;
    pSizePanelDopData:integer;
  public
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE;ATypeView:TgrUVParam;AParameter:UVVedFilter);reintroduce;
    property Mode:TUVTypeViewSheet read PMode;
  end;

function View_CountSheet(AParameter:TObject):Variant; stdcall;
 exports View_CountSheet;


implementation

uses StrUtils, gr_uCommonLoader;

{$R *.dfm}

function View_CountSheet(AParameter:TObject):Variant;
var ViewForm: TFgrCountSheets;
    Parameter:UVVedFilter;
    i:integer;
    f:boolean;
begin
Parameter.Id_smeta:=0;
Parameter.Id_department:=0;
Parameter.Kod_Setup:=0;
Parameter.Kod:=0;
Parameter.Id_man:=0;
Parameter.ModalResult := mrYes;
F:=True;
for i:=Application.MainForm.MDIChildCount-1 downto 0 do
 if (Application.MainForm.MDIChildren[i].ClassType = TFgrCountSheets) then
  if (Application.MainForm.MDIChildren[i] as TFgrCountSheets).mode=TgrPriznakSimpleParam(AParameter).Priznak
   then
    begin
     Application.MainForm.MDIChildren[i].BringToFront;
     F:=False;
     break;
    end;
if F then
 begin
  if TgrPriznakSimpleParam(AParameter).Priznak=uvpFilter then
     Parameter := ViewFilter(TgrSimpleParam(AParameter).Owner,
                             TgrSimpleParam(AParameter).DB_Handle,
                             Parameter,TgrPriznakSimpleParam(AParameter).Priznak);
  if Parameter.ModalResult=mrYes then
    ViewForm  :=  TFgrCountSheets.Create(TgrSimpleParam(AParameter).Owner,
                                      TgrSimpleParam(AParameter).DB_Handle,
                                      TgrPriznakSimpleParam(AParameter).Priznak,
                                      Parameter);
 end;
Result:=NULL;
end;

constructor TFgrCountSheets.Create(AOwner : TComponent;DB:TISC_DB_HANDLE;ATypeView:TgrUVParam;AParameter:UVVedFilter);
begin
Inherited Create(AOwner);
//------------------------------------------------------------------------------
PlanguageIndex    := IndexLanguage;
PParameter        := AParameter;
pStylesDM         := TStylesDM.Create(self);
pTypeForm         := ATypeView;
pSizePanelDopData := Panel1.Width - cxDBTextEdit1.Width;
//------------------------------------------------------------------------------
case ATypeView of
 uvpFilter:
 begin
  Caption              := LocateAndFilter_Text[PLanguageIndex];
  DeleteBtn.Visible    := ivNever;
  FilterBtn.Visible    := ivAlways;
  DSet1.SQLs.SelectSQL.text            := 'SELECT * FROM GR_UV_SELECT_GRSHEET('+
                                           IFThen(PParameter.Kod_Setup=0,'NULL',IntToStr(PParameter.Kod_Setup))+','+
                                           IfThen(PParameter.Kod=0,'NULL',IntToStr(PParameter.Kod))+','+
                                           IfThen(PParameter.Id_man=0,'NULL',IntToStr(PParameter.Id_man))+','+
                                           IFThen(PParameter.Id_Department=0,'NULL',IntToStr(PParameter.Id_department))+','+
                                           IFThen(PParameter.Id_smeta=0,'NULL',IntToStr(PParameter.Id_smeta))+',0,''T'')';
 end;
 uvpCurrent:
 begin
  Caption           := PeriodVed_Text[PLanguageIndex];
  DeleteBtn.Visible := ivAlways;
  FilterBtn.Visible := ivAlways;
  DSet1.SQLs.SelectSQL.text            := 'SELECT * FROM GR_UV_SELECT_GRSHEET(NULL,NULL,NULL,NULL,NULL,0,''T'')';
 end;
 uvpNotSaved:
 begin
  Caption           := ViewVedData_Text[PLanguageIndex];
  DeleteBtn.Visible := ivAlways;
  DeleteBtn.Enabled := True;
  FilterBtn.Visible    := ivAlways;
  DSet1.SQLs.SelectSQL.text            := 'SELECT * FROM GR_UV_SELECT_GRSHEET(NULL,NULL,NULL,NULL,NULL,1,''T'')';
 end;
end;
DSet2.SQLs.SelectSQL.Text              := 'SELECT * FROM UV_SHEET_LIST_PEOPLE(:ID_GRSHEET)';
DSet3.SQLs.SelectSQL.Text              := 'SELECT * FROM UV_SHEETPRO_SELECTMAN(:ID_SHEET)';
//------------------------------------------------------------------------------
 RefreshBtn.Caption := RefreshBtn_Caption[PlanguageIndex];
 DeleteBtn.Caption := DeleteBtn_Caption[PlanguageIndex];
 FilterBtn.Caption := FilterBtn_Caption[PlanguageIndex];
 ExitBtn.Caption := ExitBtn_Caption[PlanguageIndex];

 Grid1ClKodSheet.Caption := GridClKod_Caption[PlanguageIndex];
 Grid1ClViplata.Caption := GridClViplata_Caption[PlanguageIndex];
 Grid1ClKodSetup.Caption := GridClKodSetup_Caption[PlanguageIndex];
 Grid1ClKodSmeta.Caption := GridClKodSmeta_Caption[PlanguageIndex];
 Grid1ClKodDepartment.Caption := GridClKodDepartment_Caption[PlanguageIndex];
 Grid1ClTypePayment.Caption := GridClTypeViplata_Caption[PlanguageIndex];
 Grid1ClKurs.Caption := GridClKurs_Caption[PlanguageIndex];

 Grid2ClTn.Caption := GridClTn_Caption[PlanguageIndex];
 Grid2ClFIO.Caption := GridClFIO_Caption[PlanguageIndex];
 Grid2ClSumma.Caption := GridClSumma_Caption[PlanguageIndex];
 Grid2ClTin.Caption := GridClTin_Caption[PlanguageIndex];

 Grid3ClNameVidOpl.Caption := GridClNameVo_Caption[PlanguageIndex];
 Grid3ClKodVidOpl.Caption := GridClKodVo_Caption[PlanguageIndex];
 Grid3ClSumma.Caption := GridClSumma_Caption[PlanguageIndex];
 Grid3ClKodSetup3.Caption := GridClKodSetup_Caption[PlanguageIndex];
 Grid3ClP1.Caption := GridClP1_Caption[PlanguageIndex];

 dxDockPanelSpisok.Caption := Spisok_Text[PlanguageIndex];
 dxDockPanelSheet.Caption  := Sheets_Text[PlanguageIndex];
 dxDockPanelData.Caption   := Data_Text[PlanguageIndex];

 LabelDepartment.Caption := LabelDepartment_Caption[PlanguageIndex];
 LabelSmeta.Caption      := LabelSmeta_Caption[PlanguageIndex];
 LabelTypeSheet.Caption  := LabelTypeSheet_Caption[PlanguageIndex];
 Grid3DBTableView1.DataController.Summary.FooterSummaryItems[1].Format := Summary_Text[PlanguageIndex];
//------------------------------------------------------------------------------
DataBase.Handle := DB;
DSet1.Open;
DSet2.Open;
//------------------------------------------------------------------------------
SetOptionsGridView(Grid1DBTableView1);
SetOptionsGridView(Grid2DBTableView1);
SetOptionsGridView(Grid3DBTableView1);
SetOptionsBarManager(BarManager);
Grid1DBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
Grid2DBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
Grid3DBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
SetOptionsBarManager(BarManager);
Grid3DBTableView1.OptionsView.Footer := True;
//------------------------------------------------------------------------------
 pLocateBar := TZBarLocate.Create(BarManager);
 pLocateBar.DataSet := DSet2;
 pLocateBar.AddLocateItem('TIN',Grid2ClTin.Caption,[loCaseInsensitive,loPartialKey]);
 pLocateBar.AddLocateItem('FIO',Grid2ClFIO.Caption,[loCaseInsensitive,loPartialKey]);
 pLocateBar.DigitalField := 'TIN';
 pLocateBar.DockControl := BarDockControlLocate;
 pLocateBar.BorderStyle := bbsNone;
 BarDockControlLocate.SunkenBorder := False;
 dxBarDockControl2.SunkenBorder := True;
//------------------------------------------------------------------------------
 WindowState := wsMaximized;
//------------------------------------------------------------------------------
end;

procedure TFgrCountSheets.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
Action := caFree;
end;

procedure TFgrCountSheets.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFgrCountSheets.Panel1Resize(Sender: TObject);
begin
cxDBTextEdit1.Width := Panel1.Width-pSizePanelDopData;
cxDBTextEdit2.Width := cxDBTextEdit1.Width;
cxDBTextEdit3.Width := cxDBTextEdit1.Width;
end;

procedure TFgrCountSheets.ContainerDockSiteActiveChildChanged(
  Sender: TdxContainerDockSite; Child: TdxCustomDockControl);
begin
if Child=dxDockPanelData then
  begin
     if (not DSet3.Active) and (DSet3.SQLs.SelectSQL.Text<>'') then DSet3.Open;
  end
else
 if (DSet2<>nil) and (DSet3.Active) then DSet3.Close;
end;

procedure TFgrCountSheets.RefreshBtnClick(Sender: TObject);
begin
if ContainerDockSite.ActiveChild=dxDockPanelData then
   if DSet3.Active then DSet3.Close;

if DSet2.Active then DSet2.Close;
if DSet1.Active then DSet1.Close;

DSet1.Open;
DSet2.Open;
if ContainerDockSite.ActiveChild=dxDockPanelData then DSet3.Open;
end;

procedure TFgrCountSheets.cxGrid2DBTableView1DataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
var AItem: TcxGridTableSummaryItem;
begin
  AItem := TcxGridTableSummaryItem(Arguments.SummaryItem);
  if (AItem.Column = Grid3ClSumma) and
     (AItem.Kind = skSum) and (AItem.Position = spFooter) then
  begin
   if (VarToStr(Grid3DBTableView1.DataController.Values[Arguments.RecordIndex, Grid3ClP1.Index]) ='F')
      then OutArguments.Value:=-OutArguments.Value;
  end;
end;

procedure TFgrCountSheets.Grid3ClP1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
 if AText='False' then
    AText:=GridClP1_Ud_Text[PLanguageIndex];
 if AText='True' then
    AText:=GridClP1_Nar_Text[PLanguageIndex];
end;

procedure TFgrCountSheets.Grid3ClKodSetup3GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if Trim(AText)<>'' then AText:=grConvertKodSetupToStrPeriod(StrToInt(AText),kspMonthNumYearShort);
end;

procedure TFgrCountSheets.DeleteBtnClick(Sender: TObject);
begin
if VarIsNULL(DSet1['ID_GRSHEET']) then Exit;
if grShowMessage(Caption_Delete[PlanguageIndex],DeleteRecordQuestion_Text[PlanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
try
 StoredProc.StoredProcName := 'UV_DELETE_SHEET';
 StoredProc.Transaction.StartTransaction;
 StoredProc.Prepare;
 StoredProc.ParamByName('ID_GRSHEET').AsInteger := DSet1['ID_GRSHEET'];
 StoredProc.ExecProc;
 StoredProc.Transaction.Commit;
 DSet1.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
 DSet1.Delete;
 DSet1.SQLs.DeleteSQL.Text := '';
except
on e:exception do
 begin
  StoredProc.Transaction.Rollback;
  grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOk]);
 end;
end;
end;

procedure TFgrCountSheets.FilterBtnClick(Sender: TObject);
begin
PParameter := ViewFilter(self,DataBase.Handle,PParameter,pTypeForm);
if PParameter.ModalResult=mrYes then
 begin
  if ContainerDockSite.ActiveChild=dxDockPanelData then
     if DSet3.Active then DSet3.Close;

  if DSet2.Active then DSet2.Close;
  if DSet1.Active then DSet1.Close;

  DSet1.SQLs.SelectSQL.text := 'SELECT * FROM UV_SELECT_GRSHEET('+
                                IFThen(PParameter.Kod_Setup=0,'NULL',IntToStr(PParameter.Kod_Setup))+','+
                                IfThen(PParameter.Kod=0,'NULL',IntToStr(PParameter.Kod))+','+
                                IfThen(PParameter.Id_man=0,'NULL',IntToStr(PParameter.Id_man))+','+
                                IFThen(PParameter.Id_Department=0,'NULL',IntToStr(PParameter.Id_department))+','+
                                IFThen(PParameter.Id_smeta=0,'NULL',IntToStr(PParameter.Id_smeta))+','+
                                ifThen(pTypeForm=uvpNotSaved,'1','0')+')';


  DSet1.Open;
  DSet2.Open;
  if ContainerDockSite.ActiveChild=dxDockPanelData then DSet3.Open;
 end;
end;

end.

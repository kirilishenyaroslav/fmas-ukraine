//****************************************************************************//
//                     Ведение правил удержания налогов                       //
//                            Главная форма                                   //
//                        Серов А.Н. июль 2005 года                           //
//****************************************************************************//

unit Taxes_Zarplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase, ZProc,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ExtCtrls, cxTextEdit, Dates,
  cxLabel, cxContainer, cxMaskEdit, cxDBEdit, PackageLoad, ZTypes,
  cxCalendar, cxMemo, cxGridViewData, TaxesTerms_Zarplata, Taxes_Nets_Zarplata,
  ComCtrls, Unit_ZGlobal_Consts;

type
  TFZTaxes = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    Styles: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
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
    cxSplitter1: TcxSplitter;
    DSource_Taxes: TDataSource;
    DSource_TaxTerms: TDataSource;
    DSource_TaxInfo: TDataSource;
    DB: TpFIBDatabase;
    DSet_Taxes: TpFIBDataSet;
    DSet_TaxTerms: TpFIBDataSet;
    DSet_TaxInfo: TpFIBDataSet;
    DefaultTransaction: TpFIBTransaction;
    InsertBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    PanelGridTaxNames: TPanel;
    Grid_TaxNames: TcxGrid;
    Grid_TaxNamesDBTableView1: TcxGridDBTableView;
    Grid_TaxNames_ColumnTaxName: TcxGridDBColumn;
    Grid_TaxNamesLevel1: TcxGridLevel;
    PanelData: TPanel;
    PanelChild: TPanel;
    Grid_TaxNets: TcxGrid;
    Grid_TaxNetsDBTableView1: TcxGridDBTableView;
    Grid_TaxNets_Column_SumMin: TcxGridDBColumn;
    Grid_TaxNets_Column_SumMax: TcxGridDBColumn;
    Grid_TaxNets_Column_Percent: TcxGridDBColumn;
    Grid_TaxNets_Column_SumAdd: TcxGridDBColumn;
    Grid_TaxNetsLevel1: TcxGridLevel;
    PanelChildParent: TPanel;
    Grid_TaxPeriod: TcxGrid;
    Grid_TaxPeriodDBTableView1: TcxGridDBTableView;
    Grid_TaxPeriod_Column_KodSetup1: TcxGridDBColumn;
    Grid_TaxPeriod_Column_KodSetup2: TcxGridDBColumn;
    Grid_TaxPeriodLevel1: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    PopupMenuInsert: TdxBarPopupMenu;
    PopupMenuDelete: TdxBarPopupMenu;
    Insert1Btn: TdxBarButton;
    Insert2Btn: TdxBarButton;
    PopupMenuUpdate: TdxBarPopupMenu;
    Update1Btn: TdxBarButton;
    Update2Btn: TdxBarButton;
    Delete1Btn: TdxBarButton;
    Delete2Btn: TdxBarButton;
    PopupMenuDetail: TdxBarPopupMenu;
    Detail1Btn: TdxBarButton;
    Detail2Btn: TdxBarButton;
    dxBarDockControl2: TdxBarDockControl;
    Grid_TaxNets_Column_TextAdd: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitBtnClick(Sender: TObject);
    procedure Grid_CurrentRMoving_Column_KodSetupGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Grid_TaxPeriod_Column_KodSetup1GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Grid_TaxPeriod_Column_KodSetup2GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure InsertBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure DetailBtnClick(Sender: TObject);
    procedure Grid_TaxNamesDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Grid_TaxPeriodDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Grid_TaxNetsDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Grid_TaxPeriodEnter(Sender: TObject);
    procedure Grid_TaxNetsEnter(Sender: TObject);
    procedure Insert1BtnClick(Sender: TObject);
    procedure Insert2BtnClick(Sender: TObject);
    procedure Update1BtnClick(Sender: TObject);
    procedure Update2BtnClick(Sender: TObject);
    procedure Delete1BtnClick(Sender: TObject);
    procedure Delete2BtnClick(Sender: TObject);
    procedure Detail1BtnClick(Sender: TObject);
    procedure Detail2BtnClick(Sender: TObject);
    procedure Grid_TaxNamesEnter(Sender: TObject);
  private
    PLanguageIndex:byte;            //Индекс языка интерфейса
    PNameActiveGrid:string;         //Название активного грида
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;

function View_FZTaxes(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_FZTaxes;    //Функция для вызова ведения налогов

implementation

uses Math;

{$R *.dfm}

//****************************************************************************//
//                   Функция для вызова ведения налогов                       //
//****************************************************************************//
function View_FZTaxes(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZTaxes;
begin
if not IsMDIChildFormShow(TFZTaxes) then
   ViewForm  :=  TFZTaxes.Create(AOwner, DB);
end;


//****************************************************************************//
//                          Перегруженный конструктор                         //
//****************************************************************************//
constructor TFZTaxes.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 PLanguageIndex := LanguageIndex;
//******************************************************************************
 Caption                                               := ZTaxes_Caption[PLanguageIndex];

 RefreshBtn.Caption                                    := RefreshBtn_Caption[PLanguageIndex];
 ExitBtn.Caption                                       := ExitBtn_Caption[PLanguageIndex];
 InsertBtn.Caption                                     := InsertBtn_Caption[PLanguageIndex];
 UpdateBtn.Caption                                     := UpdateBtn_Caption[PLanguageIndex];
 DeleteBtn.Caption                                     := DeleteBtn_Caption[PLanguageIndex];
 DetailBtn.Caption                                     := DetailBtn_Caption[PLanguageIndex];
 Insert1Btn.Caption                                    := Term_Text[PLanguageIndex];
 Update1Btn.Caption                                    := Term_Text[PLanguageIndex];
 Delete1Btn.Caption                                    := Term_Text[PLanguageIndex];
 Detail1Btn.Caption                                    := Term_Text[PLanguageIndex];
 Insert2Btn.Caption                                    := Net_Text[PLanguageIndex];
 Update2Btn.Caption                                    := Net_Text[PLanguageIndex];
 Delete2Btn.Caption                                    := Net_Text[PLanguageIndex];
 Detail2Btn.Caption                                    := Net_Text[PLanguageIndex];
//******************************************************************************
 Grid_TaxNames_ColumnTaxName.Caption                   := GridClTaxName_Caption[PLanguageIndex];
 Grid_TaxPeriod_Column_KodSetup1.Caption               := GridClBegPeriod_Caption[PLanguageIndex];
 Grid_TaxPeriod_Column_KodSetup2.Caption               := GridClEndPeriod_Caption[PLanguageIndex];
 Grid_TaxNets_Column_SumMin.Caption                    := GridClFrom_Caption[PLanguageIndex];
 Grid_TaxNets_Column_SumMax.Caption                    := GridClTo_Caption[PLanguageIndex];
 Grid_TaxNets_Column_SumAdd.Caption                    := GridClPlus_Caption[PLanguageIndex];
 Grid_TaxNets_Column_Percent.Caption                   := GridClPercentSiqn_Caption[PLanguageIndex];
 Grid_TaxNets_Column_TextAdd.Caption                   := GridClAddText_Caption[PLanguageIndex];
//******************************************************************************
 DSet_Taxes.SQLs.SelectSQL.Text                        := 'SELECT * FROM Z_TAX_NET_NAMES_S';
 DSet_TaxTerms.SQLs.SelectSQL.Text                     := 'SELECT * FROM Z_TAX_NET_PERIOD_S(?ID_TAX_NET) order by KOD_SETUP_1 desc ';
 DSet_TaxInfo.SQLs.SelectSQL.Text                      := 'SELECT * FROM Z_TAX_NETS_S(?ID_TAX_NET_PERIOD)';
//******************************************************************************
 DB.Handle:=Db_Handle;
 DSet_Taxes.Open;
 DSet_TaxTerms.Open;
 DSet_TaxInfo.Open;
//******************************************************************************
 PNameActiveGrid  := '';
//******************************************************************************
 WindowState:=wsMaximized;
end;

procedure TFZTaxes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DefaultTransaction.Commit;
Action:=caFree;
end;

procedure TFZTaxes.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZTaxes.Grid_CurrentRMoving_Column_KodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
AText := KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFZTaxes.Grid_TaxPeriod_Column_KodSetup1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
AText  := KodSetupToPeriod(StrToInt(AText),2);
end;

procedure TFZTaxes.Grid_TaxPeriod_Column_KodSetup2GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
AText  := KodSetupToPeriod(StrToInt(AText),2);
end;

procedure TFZTaxes.InsertBtnClick(Sender: TObject);
begin
if PNameActiveGrid=Grid_TaxPeriod.Name then
 if Insert1Btn.Enabled then Insert1BtnClick(Sender);
if PNameActiveGrid=Grid_TaxNets.Name then
 if Insert2Btn.Enabled then Insert2BtnClick(Sender);
end;

procedure TFZTaxes.UpdateBtnClick(Sender: TObject);
begin
if PNameActiveGrid=Grid_TaxPeriod.Name then
 if Update1Btn.Enabled then Update1BtnClick(Sender);
if PNameActiveGrid=Grid_TaxNets.Name then
 if Update2Btn.Enabled then Update2BtnClick(Sender);
end;

procedure TFZTaxes.DeleteBtnClick(Sender: TObject);
begin
if PNameActiveGrid=Grid_TaxPeriod.Name then
 If Delete1Btn.Enabled then Delete1BtnClick(Sender);
if PNameActiveGrid=Grid_TaxNets.Name then
 If Delete2Btn.Enabled then Delete2BtnClick(Sender);
end;

procedure TFZTaxes.DetailBtnClick(Sender: TObject);
begin
if PNameActiveGrid=Grid_TaxPeriod.Name then
 if Detail1Btn.Enabled then Detail1BtnClick(Sender);
if PNameActiveGrid=Grid_TaxNets.Name then
 if Detail2Btn.Enabled then Detail2BtnClick(Sender);
end;

procedure TFZTaxes.Grid_TaxNamesDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 Insert1Btn.Enabled := AFocusedRecord<>nil;
 Grid_TaxPeriodDBTableView1FocusedRecordChanged(Grid_TaxPeriodDBTableView1,nil,Grid_TaxPeriodDBTableView1.Controller.FocusedRecord,True);
end;

procedure TFZTaxes.Grid_TaxPeriodDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
If AFocusedRecord=nil then
 begin
  Insert2Btn.Enabled := False;
  Update1Btn.Enabled := False;
  Delete1Btn.Enabled := False;
  Detail1Btn.Enabled := False;
 end
else
 begin
  Insert2Btn.Enabled := True;
  Update1Btn.Enabled := True;
  Delete1Btn.Enabled := True;
  Detail1Btn.Enabled := True;
 end;
Grid_TaxNetsDBTableView1FocusedRecordChanged(Grid_TaxNetsDBTableView1,nil,Grid_TaxNetsDBTableView1.Controller.FocusedRecord,True);
end;

procedure TFZTaxes.Grid_TaxNetsDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
If AFocusedRecord<>nil then
 begin
  Delete1Btn.Enabled := False;
  Update2Btn.Enabled := True;
  Delete2Btn.Enabled := True;
  Detail2Btn.Enabled := True;
 end
else
 begin
  Delete1Btn.Enabled := True;
  Update2Btn.Enabled := False;
  Delete2Btn.Enabled := False;
  Detail2Btn.Enabled := False;
 end;
end;

procedure TFZTaxes.Grid_TaxPeriodEnter(Sender: TObject);
begin
PNameActiveGrid:=Grid_TaxPeriod.Name;
end;

procedure TFZTaxes.Grid_TaxNetsEnter(Sender: TObject);
begin
PNameActiveGrid:=Grid_TaxNets.Name;
end;

procedure TFZTaxes.Insert1BtnClick(Sender: TObject);
var Parameter:TZTaxesTermsParameters;
    ResLoad:Variant;
begin
  Parameter.ControlFormStyle:=zcfsInsert;
  Parameter.ID_TAX_NET:=DSet_Taxes.FieldValues['ID_TAX_NET'];
  ResLoad:=View_FZTaxesTerms(Self,DB.Handle,Parameter);
  if ResLoad[0]=mrYes then
   begin
    DSet_TaxInfo.Close;
    DSet_TaxTerms.CloseOpen(True);
    Grid_TaxPeriodDBTableView1.DataController.LocateByKey(ResLoad[1]);
    DSet_TaxInfo.Open;
   end;
end;

procedure TFZTaxes.Insert2BtnClick(Sender: TObject);
var Parameter:TZTaxNetsParameters;
    ResLoad:Variant;
begin
 Parameter.ControlFormStyle := zcfsInsert;
 Parameter.ID_TAX_NET_PERIOD := DSet_TaxTerms.FieldValues['ID_TAX_NET_PERIOD'];
 ResLoad:=View_FZTaxNets(self,db.Handle,Parameter);
 if ResLoad[0]=mrYes then
  begin
   DSet_TaxInfo.CloseOpen(True);
   Grid_TaxNetsDBTableView1.DataController.LocateByKey(ResLoad[1]);
  end;
end;

procedure TFZTaxes.Update1BtnClick(Sender: TObject);
var Parameter:TZTaxesTermsParameters;
    ResLoad:Variant;
begin
  Parameter.ControlFormStyle:=zcfsUpdate;
  Parameter.ID_TAX_NET:=DSet_Taxes.FieldValues['ID_TAX_NET'];
  Parameter.ID_TAX_NET_PERIOD:=DSet_TaxTerms.FieldValues['ID_TAX_NET_PERIOD'];
  Parameter.KodSetup1:=DSet_TaxTerms.FieldValues['KOD_SETUP_1'];
  Parameter.KodSetup2:=DSet_TaxTerms.FieldValues['KOD_SETUP_2'];
  ResLoad:=View_FZTaxesTerms(Self,DB.Handle,Parameter);
  if ResLoad[0]=mrYes then
   begin
    DataSetsCloseOpen(DSet_TaxTerms,DSet_TaxInfo,'ID_TAX_NET_PERIOD','ID_TAX');
    Grid_TaxPeriodDBTableView1FocusedRecordChanged(Grid_TaxPeriodDBTableView1,nil,Grid_TaxPeriodDBTableView1.Controller.FocusedRecord,True);
   end;
end;

procedure TFZTaxes.Update2BtnClick(Sender: TObject);
var Parameter:TZTaxNetsParameters;
    ResLoad:Variant;
begin
 Parameter.ControlFormStyle := zcfsUpdate;
 Parameter.ID_TAX_NET_PERIOD := DSet_TaxTerms.FieldValues['ID_TAX_NET_PERIOD'];
 Parameter.ID_TAX            := DSet_TaxInfo.FieldValues['ID_TAX'];
 Parameter.Summa_Min         := DSet_TaxInfo.FieldValues['SUM_MIN'];
 Parameter.Summa_Max         := DSet_TaxInfo.FieldValues['SUM_MAX'];
 Parameter.Percent           := DSet_TaxInfo.FieldValues['PERCENT'];
 Parameter.Add_Summa         := DSet_TaxInfo.FieldValues['ADD_SUM'];
 Parameter.Add_Text          := VarToStr(DSet_TaxInfo.FieldValues['ADD_TEXT']);
 ResLoad:=View_FZTaxNets(self,db.Handle,Parameter);
 if ResLoad[0]=mrYes then
  begin
   DataSetCloseOpen(DSet_TaxInfo,'ID_TAX');
   Grid_TaxNetsDBTableView1.DataController.LocateByKey(Parameter.ID_TAX);
  end;
end;

procedure TFZTaxes.Delete1BtnClick(Sender: TObject);
var Parameter:TZTaxesTermsParameters;
    ResLoad:Variant;
begin
  Parameter.ControlFormStyle:=zcfsDelete;
  Parameter.ID_TAX_NET_PERIOD:=DSet_TaxTerms.FieldValues['ID_TAX_NET_PERIOD'];
  ResLoad:=View_FZTaxesTerms(Self,DB.Handle,Parameter);
  if ResLoad[0]=mrYes then
   begin
    DataSetsCloseOpen(DSet_TaxTerms,DSet_TaxInfo);
    Grid_TaxPeriodDBTableView1FocusedRecordChanged(Grid_TaxPeriodDBTableView1,nil,Grid_TaxPeriodDBTableView1.Controller.FocusedRecord,True);
   end;
end;

procedure TFZTaxes.Delete2BtnClick(Sender: TObject);
var Parameter:TZTaxNetsParameters;
    ResLoad:Variant;
begin
 Parameter.ControlFormStyle := zcfsDelete;
 Parameter.ID_TAX            := DSet_TaxInfo.FieldValues['ID_TAX'];
 ResLoad:=View_FZTaxNets(self,db.Handle,Parameter);
 if ResLoad[0]=mrYes then
  begin
   DataSetCloseOpen(DSet_TaxInfo);
   Grid_TaxNetsDBTableView1.DataController.LocateByKey(DSet_TaxInfo.FieldValues['ID_TAX']);
  end;
end;

procedure TFZTaxes.Detail1BtnClick(Sender: TObject);
var Parameter:TZTaxesTermsParameters;
begin
  Parameter.ControlFormStyle:=zcfsShowDetails;
  Parameter.ID_TAX_NET:=DSet_Taxes.FieldValues['ID_TAX_NET'];
  Parameter.ID_TAX_NET_PERIOD:=DSet_TaxTerms.FieldValues['ID_TAX_NET_PERIOD'];
  Parameter.KodSetup1:=DSet_TaxTerms.FieldValues['KOD_SETUP_1'];
  Parameter.KodSetup2:=DSet_TaxTerms.FieldValues['KOD_SETUP_2'];
  View_FZTaxesTerms(Self,DB.Handle,Parameter);
end;

procedure TFZTaxes.Detail2BtnClick(Sender: TObject);
var Parameter:TZTaxNetsParameters;
begin
  Parameter.ControlFormStyle := zcfsShowDetails;
  Parameter.ID_TAX_NET_PERIOD := DSet_TaxTerms.FieldValues['ID_TAX_NET_PERIOD'];
  Parameter.ID_TAX            := DSet_TaxInfo.FieldValues['ID_TAX'];
  Parameter.Summa_Min         := DSet_TaxInfo.FieldValues['SUM_MIN'];
  Parameter.Summa_Max         := DSet_TaxInfo.FieldValues['SUM_MAX'];
  Parameter.Percent           := DSet_TaxInfo.FieldValues['PERCENT'];
  Parameter.Add_Summa         := DSet_TaxInfo.FieldValues['ADD_SUM'];
  Parameter.Add_Text          := VarToStr(DSet_TaxInfo.FieldValues['ADD_TEXT']);
  View_FZTaxNets(self,db.Handle,Parameter);
end;

procedure TFZTaxes.Grid_TaxNamesEnter(Sender: TObject);
begin
PNameActiveGrid:='';
end;

end.

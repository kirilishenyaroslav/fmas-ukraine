unit Sp_ReeVed_UV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, dxBar, dxBarExtItems,
  cxSplitter, cxLabel, cxContainer, cxTextEdit, cxMaskEdit, cxDBEdit,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxDockPanel, dxDockControl, Unit_ZGlobal_Consts, cxMemo,
  Sp_Ved_Uv, FIBQuery, pFIBQuery, SpReeVedUVControl, ZProc, Dates, ZTypes,
  PackageLoad, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZMessages, ComCtrls, Sp_ReeVed_UV_dataModule, ActnList,
  ZSvodLoaderUnit, ZSvodTypesUnit, dxStatusBar, ImgList, AccMgMt, unit_access_consts,
  ZcxFilterBar, cxButtonEdit, Menus, gr_uCommonProc, cxLookAndFeelPainters,
  StdCtrls, cxButtons, frxClass, frxDBSet, frxDesgn, cxCurrencyEdit;

type
  TFUV_REE_VED = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    ReportsBtn: TdxBarLargeButton;
    PopupMenuReports: TdxBarPopupMenu;
    VedOplPopupReportsBtn: TdxBarButton;
    VedReePopupReportsBtn: TdxBarButton;
    SvodPopupReportsBtn: TdxBarButton;
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
    CommandBtnDockControl: TdxBarDockControl;
    DockSite: TdxDockSite;
    dxLayoutDockSite2: TdxLayoutDockSite;
    DockPanel1: TdxDockPanel;
    cxSplitter2: TcxSplitter;
    PanelDopDataVed: TPanel;
    DBMaskSmetaTitleEdit: TcxDBMaskEdit;
    LabelSmetaTitle: TcxLabel;
    LabelDepartment: TcxLabel;
    DBMaskDepartmentEdit: TcxDBMaskEdit;
    InsertReeBtn: TdxBarButton;
    InsertVedBtn: TdxBarButton;
    DeleteReeBtn: TdxBarButton;
    DeleteVedBtn: TdxBarButton;
    DetailBtn: TdxBarLargeButton;
    ActionList: TActionList;
    ActionPrintToBank: TAction;
    SheetToBank: TdxBarButton;
    PanelReeVed: TPanel;
    GridReeVed: TcxGrid;
    GridReeVedView1: TcxGridDBTableView;
    GrColReeVedKodSetup: TcxGridDBColumn;
    GrColReeVedFullNumberSch: TcxGridDBColumn;
    GrColReeVedFullNameSch: TcxGridDBColumn;
    GrColReeVedViplata: TcxGridDBColumn;
    GrColReeVedDeponent: TcxGridDBColumn;
    GrColReeVedRaznoe: TcxGridDBColumn;
    GridReeVedLevel1: TcxGridLevel;
    Splitter1: TSplitter;
    DelVedBtn: TdxBarLargeButton;
    AddVedBtn: TdxBarLargeButton;
    BarDockControlReeVed: TdxBarDockControl;
    GridVed: TcxGrid;
    GridVedView1: TcxGridDBTableView;
    GridClVedKodSheet: TcxGridDBColumn;
    GridClVedKodSmeta: TcxGridDBColumn;
    GridClVedKodDepartment: TcxGridDBColumn;
    GridClVedTypePayment: TcxGridDBColumn;
    GridClVedGrSumma: TcxGridDBColumn;
    GridClVedViplata: TcxGridDBColumn;
    GridClVedDeponir: TcxGridDBColumn;
    GridClVedRaznoe: TcxGridDBColumn;
    GridVedLevel1: TcxGridLevel;
    FileToBankBtn: TdxBarLargeButton;
    ClearReeBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar2: TdxStatusBar;
    RefreshCardsReeBtn: TdxBarLargeButton;
    SystemAction: TAction;
    ShowAllReestr: TdxBarLargeButton;
    GrColReeVedIDReestr: TcxGridDBColumn;
    dxBarButton1: TdxBarButton;
    PodpisBtn: TdxBarLargeButton;
    FilterBarDockControl: TdxBarDockControl;
    GrColReeVednameViplata: TcxGridDBColumn;
    BtnSvod: TdxBarButton;
    dxBarButton2: TdxBarButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    GrColReeVedNote: TcxGridDBColumn;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    VedPopupReportsBtn: TdxBarButton;
    ButtonSheetToBankCheck: TdxBarLargeButton;
    DesignerSheetToBankCheck: TfrxDesigner;
    frDsetSheetToBankCheck: TfrxDBDataset;
    ReportSheetToBankCheck: TfrxReport;
    PopupMenu3: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    GridPeople: TcxGrid;
    GridPeopleView1: TcxGridDBTableView;
    GrColCh2Tn: TcxGridDBColumn;
    GrColCh2FIO: TcxGridDBColumn;
    GrColCh2Summa: TcxGridDBColumn;
    GrColCh2FlVipl: TcxGridDBColumn;
    GrColCh2TypeSum: TcxGridDBColumn;
    GridPeopleLevel1: TcxGridLevel;
    cxSplitter3: TcxSplitter;
    Grid: TcxGrid;
    GridView1: TcxGridDBTableView;
    GrColPeriod: TcxGridDBColumn;
    GrColVidOplKod: TcxGridDBColumn;
    GrColVidOplName: TcxGridDBColumn;
    GrColSumma: TcxGridDBColumn;
    GrColP1: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    dxBarButton3: TdxBarButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InsertBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure ShowDetailBtnClick(Sender: TObject);
    procedure GridReeVedView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ReportsBtnClick(Sender: TObject);
    procedure PrintSheetCh1BtnClick(Sender: TObject);
    procedure VedReePopupReportsBtnClick(Sender: TObject);
    procedure GridVedView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure VedOplPopupReportsBtnClick(Sender: TObject);
    procedure GrColReeVedKodSetupGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure GridPeopleView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GrColPeriodGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure GridView1DataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure GrColP1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure GridView1FocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure DockPanel2VisibleChanged(Sender: TdxCustomDockControl);
    procedure PanelPeopleDataVisibleChanging(Sender: TdxCustomDockControl);
    procedure SvodPopupReportsBtnClick(Sender: TObject);
    procedure SheetToBankClick(Sender: TObject);
    procedure AddVedBtnClick(Sender: TObject);
    procedure DelVedBtnClick(Sender: TObject);
    procedure ClearReeBtnClick(Sender: TObject);
    procedure GridReeVedView1CanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure PanelDopDataVedResize(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure RefreshCardsReeBtnClick(Sender: TObject);
    procedure SystemActionExecute(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure ShowAllReestrClick(Sender: TObject);
    procedure FileToBankBtnClick(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure PodpisBtnClick(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
    procedure GrColReeVednameViplataPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnSvodClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure VedPopupReportsBtnClick(Sender: TObject);
    procedure ButtonSheetToBankCheckClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure GrColCh2TypeSumGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure dxBarButton3Click(Sender: TObject);
  private
    PLanguageIndex:byte;
    FSystem:Boolean;
    DM_ReeVed:TDM_ReeVed;
    PId_1Df:Integer;
    PMR:TModalResult;
    PNumPredpr:integer;
    pBarFilter:TzFilterBarPeriods;
  public
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE;AId_1df:integer;System:boolean);reintroduce;
    property MR:TModalResult read PMR;
  end;



implementation

{$R *.dfm}

uses DelivInfo;


constructor TFUV_REE_VED.Create(AOwner : TComponent;DB:TISC_DB_HANDLE;AId_1df:integer;System:boolean);
var i:byte;
begin
Inherited Create(AOwner);
FSystem:=System;
PLanguageIndex:=LanguageIndex;
Caption                                      := ReeVed_Caption[PLanguageIndex];
//******************************************************************************
PanelDopDataVed.Color                        := GridVedView1.Styles.Background.Color;
//******************************************************************************
InsertBtn.Caption                            := InsertBtn_Caption[PLanguageIndex];
UpdateBtn.Caption                            := UpdateBtn_Caption[PLanguageIndex];
DeleteBtn.Caption                            := DeleteBtn_Caption[PLanguageIndex];
RefreshBtn.Caption                           := RefreshBtn_Caption[PLanguageIndex];
ReportsBtn.Caption                           := ReportsBtn_Caption[PLanguageIndex];
VedOplPopupReportsBtn.Caption                := ReeVed_PrintVedOpl_Caption[PLanguageIndex];
VedReePopupReportsBtn.Caption                := ReeVed_PrintReeVed_Caption[PLanguageIndex];
SvodPopupReportsBtn.Caption                  := ReeVed_PrintSvodRee_Caption[PLanguageIndex];
AddVedBtn.Caption                            := AddSheetsToReestrBtn_Hint[PLanguageIndex];
DelVedBtn.Caption                            := DelSheetFromReestrBtn_Hint[PLanguageIndex];
ClearReeBtn.Caption                          := ClearReestrBtn_Hint[PLanguageIndex];
FileToBankBtn.Caption                        := FileToBankBtn_Hint[PLanguageIndex];
ExitBtn.Caption                              := ExitBtn_Caption[PLanguageIndex];
SelectBtn.Caption                            := SelectBtn_Caption[PLanguageIndex];

GrColReeVedKodSetup.Caption                  := GridClKodSetup_Caption[PLanguageIndex];
GrColReeVedFullNumberSch.Caption             := GridClFullNumberSch_Caption[PLanguageIndex];
GrColReeVedFullNameSch.Caption               := GridClFullNameSch_Caption[PLanguageIndex];
GrColReeVedViplata.Caption                   := GridClViplata_Caption[PLanguageIndex];
GrColReeVedDeponent.Caption                  := GridClDeponir_Caption[PLanguageIndex];
GrColReeVedRaznoe.Caption                    := GridClRaznoe_Caption[PLanguageIndex];

GridClVedKodSheet.Caption                    := GridClKod_Caption[PLanguageIndex];
GridClVedGrSumma.Caption                     := GridClSumma_Caption[PLanguageIndex];
GridClVedViplata.Caption                     := GridClViplata_Caption[PLanguageIndex];
GridClVedDeponir.Caption                     := GridClDeponir_Caption[PLanguageIndex];
GridClVedRaznoe.Caption                      := GridClRaznoe_Caption[PLanguageIndex];
GridClVedKodSmeta.Caption                    := GridClKodSmeta_Caption[PLanguageIndex];
GridClVedKodDepartment.Caption               := GridClKodDepartment_Caption[PLanguageIndex];
GridClVedTypePayment.Caption                 := GridClTypePayment_Caption[PLanguageIndex];
GrColCh2Tn.Caption                           := GridClTn_Caption[PLanguageIndex];

GrColCh2FIO.Caption                          := GridClFIO_Caption[PLanguageIndex];
GrColCh2Summa.Caption                        := GridClSumma_Caption[PLanguageIndex];
GrColCh2FlVipl.Caption                       := GridClFlagVipl_Caption[PLanguageIndex];
LabelSmetaTitle.Caption                      := LabelSmeta_Caption[PLanguageIndex];
LabelDepartment.Caption                      := LabelDepartment_Caption[PLanguageIndex];
GridView1.DataController.Summary.FooterSummaryItems[1].Format := Itogo_Caption[PLanguageIndex];
//******************************************************************************
GrColPeriod.Caption                          := GridClKodSetup_Caption[PLanguageIndex];
GrColVidOplName.Caption                      := GridClNameVidopl_Caption[PLanguageIndex];
GrColVidOplKod.Caption                       := GridClKodVidOpl_Caption[PLanguageIndex];
GrColSumma.Caption                           := GridClSumma_Caption[PLanguageIndex];
GrColP1.Caption                              := GridClP1_Caption[PLanguageIndex];
//******************************************************************************
DockPanel1.Caption   := ReeVeds_Text[PLanguageIndex];
//DockPanel2.Caption   := SheetData_Text[PLanguageIndex];
InsertReeBtn.Caption := InsertBtn_Caption[PLanguageIndex] + ' ' + ReeVed_Text[PLanguageIndex];
DeleteReeBtn.Caption := DeleteBtn_Caption[PLanguageIndex] + ' ' + ReeVed_Text[PLanguageIndex];
InsertVedBtn.Caption := InsertBtn_Caption[PLanguageIndex] + ' ' + Sheet_Text[PLanguageIndex];
DeleteVedBtn.Caption := DeleteBtn_Caption[PLanguageIndex] + ' ' + Sheet_Text[PLanguageIndex];
DetailBtn.Caption    := DetailBtn_Caption[PLanguageIndex];
//******************************************************************************
  PBarFilter                   := TzFilterBarPeriods.Create(BarManager);
if System = True then
  PBarFilter.KodSetupBeg       := grKodSetup(DB)
else
  PBarFilter.KodSetupBeg       := CurrentKodSetup(DB);
  PBarFilter.KodSetupEnd       := PBarFilter.KodSetupBeg;
  PBarFilter.Bar.BorderStyle   := bbsNone;
  PBarFilter.Bar.DockControl   := FilterBarDockControl;
  PBarFilter.FilterBtn.OnClick := FilterBtnClick;
  pBarFilter.KodSetup2Visible  := ivNever;
//******************************************************************************
PId_1Df:=AId_1df;
PMR:=mrCancel;
DM_ReeVed := TDM_ReeVed.Create(self);
if FSystem
then DM_ReeVed.DataSetParent.SQLs.SelectSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT(1,'+IntToStr(pBarFilter.KodSetupBeg)+',1000)'
else DM_ReeVed.DataSetParent.SQLs.SelectSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT(1,'+IntToStr(pBarFilter.KodSetupBeg)+',999)';
DM_ReeVed.DataBase.Handle                   := DB;
DM_ReeVed.ReadTransaction.StartTransaction;
if AId_1df>0 then
 begin
  DM_ReeVed.DataSetParent.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_REE_FOR_ADD_S('+IntToStr(AId_1df)+')';
  GrColReeVedFullNumberSch.DataBinding.FieldName := 'SCH_NUMBER';
  GrColReeVedFullNameSch.DataBinding.FieldName := 'SCH_TITLE';
 end;
DM_ReeVed.DataSetParent.Open;
DM_ReeVed.DataSetParent.FetchAll;
DM_ReeVed.DataSetChildParent.Open;
DM_ReeVed.DataSetChildParent.FetchAll;
DM_ReeVed.DataSetChild.Open;
DM_ReeVed.DataSetChild.FetchAll;
DM_ReeVed.DataSetSheetData.Open;
DM_ReeVed.DataSetSheetData.FetchAll;
//******************************************************************************
AddVedBtn.ShortCut := 107;//Num +
DelVedBtn.ShortCut := 109;//Num -
//******************************************************************************
WindowState:=wsMaximized;
 if AId_1df>0 then
  begin
   InsertBtn.Visible  := ivNever;
   UpdateBtn.Visible  := ivNever;
   DeleteBtn.Visible  := ivNever;
   ReportsBtn.Visible := ivNever;
   SelectBtn.Visible  := ivAlways;
   BarDockControlReeVed.Visible := False;
   BarManager.BarByName('BarVed').Visible := False;
//   BorderStyle := bsDialog;
   FormStyle:=fsNormal;
   GridReeVedView1.OptionsSelection.MultiSelect:=True;
   GridReeVedView1.OptionsView.Indicator := True;
  end
 else
  begin
   dxStatusBar1.Panels[0].Text := 'Ins - '+InsertBtn.Caption;
   dxStatusBar1.Panels[1].Text := 'F2 - '+UpdateBtn.Caption;
   dxStatusBar1.Panels[2].Text := 'Del - '+DeleteBtn.Caption;
   dxStatusBar1.Panels[3].Text := 'F5 - '+RefreshBtn.Caption;
   dxStatusBar1.Panels[4].Text := 'Space - '+DetailBtn.Caption;
   FormStyle:=fsMDIChild;
  end;
 for i:=0 to dxStatusBar1.Panels.Count-1 do
  dxStatusBar1.Panels[i].Width:=dxStatusBar1.Width div dxStatusBar1.Panels.Count;
 for i:=0 to dxStatusBar2.Panels.Count-1 do
  dxStatusBar2.Panels[i].Width:=dxStatusBar2.Width div dxStatusBar2.Panels.Count;
//******************************************************************************
 PNumPredpr:=NumPredpr(DM_ReeVed.DataBase.Handle);
 {if PNumPredpr=1 then
  begin
   ReportsBtn.ButtonStyle := bsDefault;
   ReportsBtn.DropDownEnabled := False;
   FileToBankBtn.Visible := ivNever;
  end;}

  PodpisBtn.Enabled := fibCheckPermission(cUVReeVed,cSign)=0;
//******************************************************************************
end;

procedure TFUV_REE_VED.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFUV_REE_VED.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if DM_ReeVed.ReadTransaction.InTransaction then DM_ReeVed.ReadTransaction.Commit;
DM_ReeVed.Free;
If FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFUV_REE_VED.InsertBtnClick(Sender: TObject);
var DataForm:TFUV_ReeVed_Control;
    Id:Integer;
begin
  DataForm := TFUV_ReeVed_Control.Create(self,DM_ReeVed.DataBase.Handle,1,FSystem);
  DataForm.ShowModal;
  If DataForm.ModalResult=mrYes then
   with DM_ReeVed do
   try
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName                       := 'UV_REE_VED_INSERT';
    StoredProc.Prepare;
    StoredProc.ParamByName('VIPLATA').AsExtended         := 0;
    StoredProc.ParamByName('DEPONIR').AsExtended         := 0;
    StoredProc.ParamByName('RAZNOE').AsExtended          := 0;
    StoredProc.ParamByName('KOD_B1').AsExtended          := 0;
    StoredProc.ParamByName('KOD_B2').AsExtended          := 0;
    StoredProc.ParamByName('ID_SCH').AsExtended          := DataForm.DSet['ID_SCH'];
    StoredProc.ParamByName('FPRINT').AsString            := 'F';
    StoredProc.ParamByName('KOD_SETUP').AsInteger        := DataForm.DSet['KOD_SETUP'];
    if VarIsNUll(DataForm.DSet['ID_VIPLATA'])
    then StoredProc.ParamByName('ID_VIPLATA').AsVariant  := 0
    else StoredProc.ParamByName('ID_VIPLATA').AsVariant  := DataForm.DSet['ID_VIPLATA'];

    if FSystem
    then begin
              //Стипендия
              StoredProc.ParamByName('ID_system').AsVariant  :=1000;
    end
    else begin
              //зарплата
              StoredProc.ParamByName('ID_system').AsVariant  :=999;
    end;

    StoredProc.ExecProc;
    Id:=StoredProc.ParamByName('ID_REESTR').AsInteger;
    StoredProc.Transaction.Commit;
    DataSetParent.SQLs.InsertSQL.Text := 'execute procedure Z_EMPTY_PROC';

    if FSystem
    then DataSetParent.SQLs.RefreshSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT(1,'+IntToStr(pBarFilter.KodSetupBeg)+',1000) WHERE ID_REESTR='+IntToStr(Id)
    else DataSetParent.SQLs.RefreshSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT(1,'+IntToStr(pBarFilter.KodSetupBeg)+',999) WHERE ID_REESTR='+IntToStr(Id);

    DataSetParent.Insert;
    DataSetParent.Post;
   except
    on E:Exception do
     begin
      ZShowMessage(Error_caption[PLanguageIndex],E.Message,mtError,[mbOK]);
      WriteTransaction.Rollback;
     end;
   end;
  DataForm.Free;
end;

procedure TFUV_REE_VED.UpdateBtnClick(Sender: TObject);
var DataForm:TFUV_ReeVed_Control;
begin
DataForm := TFUV_ReeVed_Control.Create(self,DM_ReeVed.DataBase.Handle, 2, FSystem);
DataForm.ShowModal;
If DataForm.ModalResult=mrYes then
 with DM_ReeVed do
 try
  StoredProc.Database                             := DM_ReeVed.DataBase;
  StoredProc.Transaction                          := DM_ReeVed.WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName                       := 'UV_REE_VED_UPDATE';
  StoredProc.ParamByName('ID_REESTR').AsInteger   := DataSetParent['ID_REESTR'];
  StoredProc.ParamByName('VIPLATA').AsExtended    := 0;
  StoredProc.ParamByName('DEPONIR').AsExtended    := 0;
  StoredProc.ParamByName('RAZNOE').AsExtended     := 0;
  StoredProc.ParamByName('KOD_B1').AsExtended     := 0;
  StoredProc.ParamByName('KOD_B2').AsExtended     := 0;
  StoredProc.ParamByName('ID_SCH').AsExtended     := DataForm.DSet.FieldValues['Id_Sch'];
  StoredProc.ParamByName('FPRINT').AsString       := 'F';
  StoredProc.ParamByName('KOD_SETUP').AsInteger   := DataForm.DSet['KOD_SETUP'];
  StoredProc.ParamByName('ID_VIPLATA').AsVariant  := DataForm.DSet['ID_VIPLATA'];
  StoredProc.Prepare;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
  DataSetParent.SQLs.UpdateSQL.Text := 'execute procedure Z_EMPTY_PROC';

  if FSystem
  then DataSetParent.SQLs.RefreshSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT(NULL,'+IntToStr(pBarFilter.KodSetupBeg)+',1000) WHERE ID_REESTR='+VarToStr(DataSetParent['ID_REESTR'])
  else DataSetParent.SQLs.RefreshSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT(NULL,'+IntToStr(pBarFilter.KodSetupBeg)+',999) WHERE ID_REESTR='+VarToStr(DataSetParent['ID_REESTR']);

  DataSetParent.Edit;
  DataSetParent.Post;
 except
 on E:Exception do
  begin
    ZShowMessage(Error_caption[PLanguageIndex],E.Message,mtError,[mbOK]);
    DM_ReeVed.WriteTransaction.Rollback;
  end;
 end;
DataForm.Free;
end;

procedure TFUV_REE_VED.DeleteBtnClick(Sender: TObject);
begin
If ZShowMessage(Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
 with DM_ReeVed do
 Try
  StoredProc.Database                             := DM_ReeVed.DataBase;
  StoredProc.Transaction                          := DM_ReeVed.WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName                       := 'UV_REE_VED_DELETE';
  StoredProc.ParamByName('ID_REESTR').AsInteger   := DM_ReeVed.DataSetParent.FieldValues['ID_REESTR'];
  StoredProc.Prepare;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
  DataSetParent.SQLs.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
  DataSetParent.Delete;
 except
 on E:Exception do
  begin
   ZShowMessage(Error_caption[PLanguageIndex],E.Message,mtError,[mbOK]);
   DM_ReeVed.WriteTransaction.Rollback;
  end;
 end;
end;

procedure TFUV_REE_VED.ShowDetailBtnClick(Sender: TObject);
var Parameter:TUVSheetDataParameters;
begin
if DM_ReeVed.DataSetChild.RecordCount<>0 then
 begin
  Parameter.ID:=DM_ReeVed.DataSetChild.FieldValues['ID_SHEET'];
  Parameter.Caption:=DM_ReeVed.DataSetChild.FieldValues['FIO'];
  LoadSheetData(Self,DM_ReeVed.DataBase.Handle,Parameter);
 end;
end;

procedure TFUV_REE_VED.GridReeVedView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
 begin
//  ReportsBtn.Enabled:=(PNumPredpr=1) or False;
  DetailBtn.Enabled := False;
  AddVedBtn.Enabled := False;
  DelVedBtn.Enabled := False;
  ButtonSheetToBankCheck.Enabled:=false;
  RefreshCardsReeBtn.Enabled := False;
  GridVedView1.DataController.DataSource:=nil;
  SelectBtn.Enabled := False;
 end
else
 begin
//  ReportsBtn.Enabled:=(PNumPredpr=1) or True;
  DetailBtn.Enabled := (GridPeopleView1.Controller.FocusedRecord<>nil);
  AddVedBtn.Enabled := True;
  DelVedBtn.Enabled := True;
  RefreshCardsReeBtn.Enabled := True;
  GridVedView1.DataController.DataSource:=DM_ReeVed.DataSourceChildParent;
  SelectBtn.Enabled := True;
  ButtonSheetToBankCheck.Enabled:=true;
 end;
GridVedView1FocusedRecordChanged(GridVedView1,nil,GridVedView1.Controller.FocusedRecord,True);
end;

procedure TFUV_REE_VED.ReportsBtnClick(Sender: TObject);
begin
{if PNumPredpr=1 then
 ShowArhivPrintedSheets(self,DM_ReeVed.DataBase.Handle)
else}
 PrintSheet(self,DM_ReeVed.DataBase.Handle,DM_ReeVed.DataSetParent.FieldValues['ID_REESTR'],3);
end;

procedure TFUV_REE_VED.PrintSheetCh1BtnClick(Sender: TObject);
begin
PrintSheet(self,DM_ReeVed.DataBase.Handle,
            DM_ReeVed.DataSetChildParent.FieldValues['ID_GRSHEET'],1);
end;

procedure TFUV_REE_VED.VedReePopupReportsBtnClick(Sender: TObject);
begin
PrintSheet(self,DM_ReeVed.DataBase.Handle,
            DM_ReeVed.DataSetParent.FieldValues['ID_REESTR'],2);
end;

procedure TFUV_REE_VED.GridVedView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) then
 begin
  DeleteBtn.Enabled:=True;
  UpdateBtn.Enabled:=True;
  DelVedBtn.Enabled:=False;
  FileToBankBtn.Enabled := False;
  ClearReeBtn.Enabled := False;
  DBMaskSmetaTitleEdit.DataBinding.DataSource := nil;
  DBMaskDepartmentEdit.DataBinding.DataSource := nil;
  GridPeopleView1.DataController.DataSource:=nil;
 end
else
 begin
  DeleteBtn.Enabled:=False;
  UpdateBtn.Enabled:=False;
  DelVedBtn.Enabled:=True;
  FileToBankBtn.Enabled := True;
  ClearReeBtn.Enabled := True;
  DBMaskSmetaTitleEdit.DataBinding.DataSource := DM_ReeVed.DataSourceChildParent;
  DBMaskDepartmentEdit.DataBinding.DataSource := DM_ReeVed.DataSourceChildParent;
  GridPeopleView1.DataController.DataSource:=DM_ReeVed.DataSourceChild;
 end;
end;

procedure TFUV_REE_VED.FormCreate(Sender: TObject);
begin
GridReeVedView1FocusedRecordChanged(GridReeVedView1,nil,GridReeVedView1.Controller.FocusedRecord,True);
end;

procedure TFUV_REE_VED.VedOplPopupReportsBtnClick(Sender: TObject);
begin
  if (DM_ReeVed.DataSetChildParent.Active) and
     (not VarIsNull(DM_ReeVed.DataSetChildParent['ID_GRSHEET'])) then
  begin
    if (DM_ReeVed.DataSetChildParent['FPRINT']='F') or
        (LoadCheckPassword(self.Owner,'ПЕЧАТЬ')) then
    PrintSheet(self,DM_ReeVed.DataBase.Handle,DM_ReeVed.DataSetChildParent['ID_GRSHEET'],1);
  end;
end;

procedure TFUV_REE_VED.GrColReeVedKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText<>'' then
AText:=KodSetupToPeriod(strToInt(AText),1);
end;

procedure TFUV_REE_VED.GridPeopleView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
DetailBtn.Enabled := (not (AFocusedRecord=nil)) and (dxLayoutDockSite2.Visible);
end;

procedure TFUV_REE_VED.GrColPeriodGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText<>'' then AText:=KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFUV_REE_VED.GridView1DataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
var AItem: TcxGridTableSummaryItem;
begin
  AItem := TcxGridTableSummaryItem(Arguments.SummaryItem);
  if (AItem.Column = GrColSumma) and
     (AItem.Kind = skSum) and (AItem.Position = spFooter) then
  begin
   if VarToStr(GridView1.DataController.Values[Arguments.RecordIndex, GrColP1.Index]) ='F' then
      OutArguments.Value:=-OutArguments.Value;
  end;
end;

procedure TFUV_REE_VED.GrColP1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText='T' then
   Atext :=   GridClP1_Text_True[PLanguageIndex]
else
   AText :=   GridClP1_Text_False[PLanguageIndex];
end;

procedure TFUV_REE_VED.GridView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 Sender.ViewData.Expand(True);
end;

procedure TFUV_REE_VED.DockPanel2VisibleChanged(
  Sender: TdxCustomDockControl);
begin
DetailBtn.Enabled:=(not (GridPeopleView1.Controller.FocusedRecord=nil)) and (Sender.Visible);
if DM_ReeVed=nil then Exit;
if Sender.Visible then
 begin
  if GridVedView1.Controller.FocusedRecord=nil then Exit;
  if (not DM_ReeVed.DataSetChild.Active) then DM_ReeVed.DataSetChild.Open;
 end
else
 if DM_ReeVed.DataSetChild.Active then DM_ReeVed.DataSetChild.Close;
end;

procedure TFUV_REE_VED.PanelPeopleDataVisibleChanging(
  Sender: TdxCustomDockControl);
begin
if DM_ReeVed=nil then Exit;
if not Sender.Visible then
 begin
  if not DM_ReeVed.DataSetSheetData.Active then
    begin
     DM_ReeVed.DataSetSheetData.Open;
     DM_ReeVed.DataSetSheetData.FetchAll;
    end;
  GridView1.DataController.DataSource:=DM_ReeVed.DataSourceSheetData;
 end
else
 if DM_ReeVed.DataSetSheetData.Active then
    DM_ReeVed.DataSetSheetData.Close;
end;

procedure TFUV_REE_VED.SvodPopupReportsBtnClick(Sender: TObject);
begin
PrintSheet(self,DM_ReeVed.DataBase.Handle,
            DM_ReeVed.DataSetParent.FieldValues['ID_REESTR'],3);
end;

procedure TFUV_REE_VED.SheetToBankClick(Sender: TObject);
var Param:TSheetToBankParameter;
begin
     Param.DB_Handle:=DM_ReeVed.DataBase.Handle;
     Param.Owner:=self;
     Param.Id_reestr:=DM_ReeVed.DataSetParent['ID_REESTR'];
     Param.id_system:=FSystem;
     if DM_ReeVed.DataSetParent['ID_VIPLATA']<>null
     then begin
               Param.id_type_payment:=DM_ReeVed.DataSetParent['ID_VIPLATA'];
               Param.type_payment:=DM_ReeVed.DataSetParent['name_viplata'];
     end
     else begin
               Param.id_type_payment:=-1;
               Param.type_payment:='';
     end;
     PrintSheetToBank(Param);
end;

procedure TFUV_REE_VED.AddVedBtnClick(Sender: TObject);
var DataUVForm:TFUV_Ved;
begin
  DataUVForm:=TFUV_Ved.Create(self,DM_ReeVed.DataBase.Handle,DM_ReeVed.DataSetParent['ID_REESTR'],FSystem);
  DataUVForm.ShowModal;
  DataUVForm.Free;
  if Length(PArrayID) > 0 then
   with DM_ReeVed do
   try
    DataSetChildParent.CloseOpen(True);
    DataSetChildParent.FetchAll;
    DataSetChild.Open;
    DataSetChild.FetchAll;
    DataSetSheetData.Open;
    DataSetSheetData.FetchAll;
    StoredProc.Database                             := DataBase;
    StoredProc.Transaction                          := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName                       := 'UV_REE_VED_UPDATESUMS';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_REESTR').AsInteger   := DataSetParent['ID_REESTR'];
    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
    DataSetParent.SQLs.UpdateSQL.Text := 'Execute procedure Z_empty_proc';

    if FSystem
    then DataSetParent.SQLs.RefreshSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT(NULL,'+IntToStr(pBarFilter.KodSetupBeg)+',1000) WHERE ID_REESTR='+VarToStr(DataSetParent['ID_REESTR'])
    else DataSetParent.SQLs.RefreshSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT(NULL,'+IntToStr(pBarFilter.KodSetupBeg)+',999) WHERE ID_REESTR='+VarToStr(DataSetParent['ID_REESTR']);

    DataSetParent.Edit;
    DataSetParent.Post;
    GridReeVedView1.DataController.LocateByKey(DataSetParent['ID_REESTR']);
   except
    on E:Exception do
     begin
      ZShowMessage(Error_caption[PLanguageIndex],E.Message,mtError,[mbOK]);
      if WriteTransaction.InTransaction then WriteTransaction.Rollback;
     end;
   end;
end;

procedure TFUV_REE_VED.DelVedBtnClick(Sender: TObject);
begin
If ZShowMessage(Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
 with DM_ReeVed do
 Try
  StoredProc.Database                             := DataBase;
  StoredProc.Transaction                          := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName                       := 'UV_GRSHEET_DELFROMREESTR';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_GRSHEET').AsInteger  := DM_ReeVed.DataSetChildParent.FieldValues['ID_GRSHEET'];
  StoredProc.ExecProc;
  StoredProc.StoredProcName                       := 'UV_REE_VED_UPDATESUMS';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_REESTR').AsInteger   := DM_ReeVed.DataSetParent.FieldValues['ID_REESTR'];
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
  DataSetChildParent.SQLs.DeleteSQL.Text          := 'execute procedure Z_EMPTY_PROC';
  DataSetChildParent.Delete;
  StoredProc.Database                             := DataBase;
  StoredProc.Transaction                          := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName                       := 'UV_REE_VED_UPDATESUMS';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_REESTR').AsInteger   := DataSetParent['ID_REESTR'];
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
  DataSetParent.SQLs.UpdateSQL.Text := 'Execute procedure Z_empty_proc';

  if FSystem
  then DataSetParent.SQLs.RefreshSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT(NULL,'+IntToStr(pBarFilter.KodSetupBeg)+',1000) WHERE ID_REESTR='+VarToStr(DataSetParent['ID_REESTR'])
  else DataSetParent.SQLs.RefreshSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT(NULL,'+IntToStr(pBarFilter.KodSetupBeg)+',999) WHERE ID_REESTR='+VarToStr(DataSetParent['ID_REESTR']);

  DataSetParent.Edit;
  DataSetParent.Post;
  GridReeVedView1.DataController.LocateByKey(DataSetParent['ID_REESTR']);
 except
 on E:Exception do
  begin
   ZShowMessage(Error_caption[PLanguageIndex],E.Message,mtError,[mbOK]);
   DM_ReeVed.WriteTransaction.Rollback;
  end;
 end;
end;

procedure TFUV_REE_VED.ClearReeBtnClick(Sender: TObject);
begin
If ZShowMessage(Caption_Delete[PLanguageIndex],ClearReestrQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
 with DM_ReeVed do
 Try
  StoredProc.Database                             := DataBase;
  StoredProc.Transaction                          := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName                       := 'UV_REE_VED_CLEAR';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_REESTR').AsInteger   := DM_ReeVed.DataSetParent.FieldValues['ID_REESTR'];
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
  DataSetChildParent.CloseOpen(True);
  DataSetChildParent.FetchAll;
  DataSetChild.Open;
  DataSetChild.FetchAll;
  DataSetSheetData.Open;
  DataSetSheetData.FetchAll;
  StoredProc.Database                             := DataBase;
  StoredProc.Transaction                          := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName                       := 'UV_REE_VED_UPDATESUMS';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_REESTR').AsInteger   := DataSetParent['ID_REESTR'];
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
  DataSetParent.SQLs.UpdateSQL.Text := 'Execute procedure Z_empty_proc';

  if FSystem
  then DataSetParent.SQLs.RefreshSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT(NULL,'+VarToStrDef(DataSetParent['KOD_SETUP'],'NULL')+',1000) WHERE ID_REESTR='+VarToStr(DataSetParent['ID_REESTR'])
  else DataSetParent.SQLs.RefreshSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT(NULL,'+VarToStrDef(DataSetParent['KOD_SETUP'],'NULL')+',999) WHERE ID_REESTR='+VarToStr(DataSetParent['ID_REESTR']);

  DataSetParent.Edit;
  DataSetParent.Post;
  GridReeVedView1.DataController.LocateByKey(DataSetParent['ID_REESTR']);
 except
 on E:Exception do
  begin
   ZShowMessage(Error_caption[PLanguageIndex],E.Message,mtError,[mbOK]);
   DM_ReeVed.WriteTransaction.Rollback;
  end;
 end;
end;

procedure TFUV_REE_VED.GridReeVedView1CanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
if (ARecord=nil) or (ARecord.Expandable) then AAllow:=False;
end;

procedure TFUV_REE_VED.PanelDopDataVedResize(Sender: TObject);
begin
DBMaskSmetaTitleEdit.Width := PanelDopDataVed.Width-96;
DBMaskDepartmentEdit.Width := PanelDopDataVed.Width-96;
end;

procedure TFUV_REE_VED.SelectBtnClick(Sender: TObject);
begin
 with DM_ReeVed do
  try
   WriteTransaction.StartTransaction;
   StoredProc.StoredProcName := 'Z_1DF_VEDOMOST_ADD';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_REESTR').AsInteger := DataSetParent['ID_REESTR'];
   StoredProc.ParamByName('ID_1DF_REPORT').AsInteger := PId_1Df;
   StoredProc.ParamByName('ID_SMETA').AsVariant := NULL;
   StoredProc.ParamByName('ID_SCH').AsVariant := NULL;
   StoredProc.ParamByName('KOD_SETUP').AsVariant := NULL;
   StoredProc.ParamByName('TYPE_OPER').AsVariant := NULL;
   StoredProc.ParamByName('TYPE_R').AsString := 'T';
   StoredProc.ExecProc;
   WriteTransaction.Commit;
   DataSetParent.SQLs.DeleteSQL.Text := 'execute procedure z_empty_proc';
   DataSetParent.Delete;
   PMR:=mrYes;
  except
   on E:Exception do
    begin
     ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
     WriteTransaction.Rollback;
    end;
  end;
end;

procedure TFUV_REE_VED.RefreshCardsReeBtnClick(Sender: TObject);
begin
If ZShowMessage(Caption_Confirmation[PLanguageIndex],AreYouSureQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
 with DM_ReeVed do
 Try
  StoredProc.Database                             := DataBase;
  StoredProc.Transaction                          := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName                       := 'UV_REE_VED_UPDATE_CARDS';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_REESTR').AsInteger   := DM_ReeVed.DataSetParent.FieldValues['ID_REESTR'];
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
 except
 on E:Exception do
  begin
   ZShowMessage(Error_caption[PLanguageIndex],E.Message,mtError,[mbOK]);
   DM_ReeVed.WriteTransaction.Rollback;
  end;
 end;
end;

procedure TFUV_REE_VED.SystemActionExecute(Sender: TObject);
begin
 with DM_ReeVed do
     ShowMessage('ID_REESTR='+VarToStrDef(DataSetParent['ID_REESTR'],'NULL')+#13+
                 'ID_GRSHEET='+VarToStrDef(DataSetChildParent['ID_GRSHEET'],'NULL'));
end;

procedure TFUV_REE_VED.RefreshBtnClick(Sender: TObject);
begin
 if DM_ReeVed.DataSetSheetData.Active then DM_ReeVed.DataSetSheetData.Close;
 if DM_ReeVed.DataSetChild.Active then DM_ReeVed.DataSetChild.Close;
 if DM_ReeVed.DataSetChildParent.Active then DM_ReeVed.DataSetChildParent.Close;
 DM_ReeVed.DataSetParent.CloseOpen(True);
 DM_ReeVed.DataSetChildParent.Open;
 DM_ReeVed.DataSetChild.Open;
 DM_ReeVed.DataSetSheetData.Open;
 DM_ReeVed.DataSetSheetData.FetchAll;
end;

procedure TFUV_REE_VED.ShowAllReestrClick(Sender: TObject);
begin
 if DM_ReeVed.DataSetSheetData.Active then DM_ReeVed.DataSetSheetData.Close;
 if DM_ReeVed.DataSetChild.Active then DM_ReeVed.DataSetChild.Close;
 if DM_ReeVed.DataSetChildParent.Active then DM_ReeVed.DataSetChildParent.Close;
 if DM_ReeVed.DataSetParent.Active then DM_ReeVed.DataSetParent.Close;

 if FSystem
 then begin
           if ShowAllReestr.Down then DM_ReeVed.DataSetParent.SQLs.SelectSQL.Text:= 'SELECT * FROM UV_REE_VED_SELECT(NULL,'+IntToStr(pBarFilter.KodSetupBeg)+',1000)'
                                 else DM_ReeVed.DataSetParent.SQLs.SelectSQL.Text:= 'SELECT * FROM UV_REE_VED_SELECT(1,'+IntToStr(pBarFilter.KodSetupBeg)+',1000)';
 end
 else begin
           if ShowAllReestr.Down then DM_ReeVed.DataSetParent.SQLs.SelectSQL.Text:= 'SELECT * FROM UV_REE_VED_SELECT(NULL,'+IntToStr(pBarFilter.KodSetupBeg)+',999)'
                                 else DM_ReeVed.DataSetParent.SQLs.SelectSQL.Text:= 'SELECT * FROM UV_REE_VED_SELECT(1,'+IntToStr(pBarFilter.KodSetupBeg)+',999)';
 end;
 DM_ReeVed.DataSetParent.Open;
 DM_ReeVed.DataSetParent.FetchAll;
 DM_ReeVed.DataSetChildParent.Open;
 DM_ReeVed.DataSetChildParent.FetchAll;
 DM_ReeVed.DataSetChild.Open;
 DM_ReeVed.DataSetChild.FetchAll;
 DM_ReeVed.DataSetSheetData.Open;
 DM_ReeVed.DataSetSheetData.FetchAll;
// DockPanel2VisibleChanged(DockPanel2);

 if ShowAllReestr.Down then PodpisBtn.Visible:=ivNever
                       else PodpisBtn.Visible:=ivAlways;
end;


procedure TFUV_REE_VED.FileToBankBtnClick(Sender: TObject);
begin
  if (GridReeVedView1.Controller.FocusedRecord<>nil) and (not GridReeVedView1.Controller.FocusedRecord.Expandable) then
  begin
{    if pNumPredpr=1 then LoadBankExportPackage(self,DM_ReeVed.DataBase.Handle,DM_ReeVed.DataSetParent['ID_REESTR'])
    else}
    try
       DM_ReeVed.ExportToBankDataSet.SQLs.SelectSQL.Text := 'select * from UV_SHEET_TO_BANK('+VarToStr(DM_ReeVed.DataSetParent['ID_REESTR'])+')';
       DM_ReeVed.ExportToBankDataSet.Open;

       ExportBankDataSet(self,DM_ReeVed.ExportToBankDataSet,StrToInt(VarToStrDef(DM_ReeVed.DataSetParent['ID_MFO'],'0')));

    finally
       if DM_ReeVed.ExportToBankDataSet.Active then DM_ReeVed.ExportToBankDataSet.Close;
    end;
  end;
end;

procedure TFUV_REE_VED.dxBarButton1Click(Sender: TObject);
begin
  if (GridReeVedView1.Controller.FocusedRecord<>nil) and (not GridReeVedView1.Controller.FocusedRecord.Expandable) then
    PrintReeVed(self,DM_ReeVed.DataBase.Handle,DM_ReeVed.DataSetParent.FieldValues['ID_REESTR']);
end;

procedure TFUV_REE_VED.PodpisBtnClick(Sender: TObject);
var StProc:TpFIBStoredProc;
begin
  if (GridReeVedView1.Controller.FocusedRecord<>nil) and (not GridReeVedView1.Controller.FocusedRecord.Expandable) then
  begin
    StProc := TpFIBStoredProc.Create(nil);
    StProc.Transaction := TpFIBTransaction.Create(nil);
    StProc.Transaction.DefaultDatabase := TpFIBDatabase.Create(nil);
    StProc.Database := StProc.Transaction.DefaultDatabase;
    StProc.Database.Handle := DM_ReeVed.DataBase.Handle;
    try
      StProc.StoredProcName := 'UV_REE_VED_SET_PODPIS';
      StProc.Transaction.StartTransaction;
      StProc.Prepare;
      StProc.ParamByName('ID_REESTR').AsInteger := DM_ReeVed.DataSetParent['ID_REESTR'];
      StProc.ParamByName('ID_USER').AsInteger := AccMGMT.GetUserId;
      StProc.ExecProc;
      StProc.Transaction.Commit;
      if not ShowAllReestr.Down then
      begin
        DM_ReeVed.DataSetParent.SQLs.DeleteSQL.Text := 'execute procedure z_empty_proc';
        DM_ReeVed.DataSetParent.Delete;
        DM_ReeVed.DataSetParent.SQLs.DeleteSQL.Clear;
      end;
    except
     on E:Exception do
     begin
      StProc.Transaction.Commit;
      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
     end;
    end;
  end;
end;

procedure TFUV_REE_VED.FilterBtnClick(Sender: TObject);
begin
  ShowAllReestrClick(self);
end;

procedure TFUV_REE_VED.GrColReeVednameViplataPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var StProc:TpFIBStoredProc;
    Viplata:variant;
    id_reestr:Integer;
begin
  if (GridReeVedView1.Controller.FocusedRecord<>nil) and (not GridReeVedView1.Controller.FocusedRecord.Expandable) then
  begin

    viplata:=LoadViplata(self,DM_ReeVed.DataBase.Handle,zfsModal);
    if VarArrayDimCount(Viplata)>0 then
    begin
      StProc := TpFIBStoredProc.Create(nil);
      StProc.Transaction := TpFIBTransaction.Create(nil);
      StProc.Transaction.DefaultDatabase := TpFIBDatabase.Create(nil);
      StProc.Database := StProc.Transaction.DefaultDatabase;
      StProc.Database.Handle := DM_ReeVed.DataBase.Handle;
      try
        StProc.StoredProcName := 'UV_REE_VED_SET_BANK';
        StProc.Transaction.StartTransaction;
        StProc.Prepare;
        id_reestr:=DM_ReeVed.DataSetParent['ID_REESTR'];
        StProc.ParamByName('ID_REESTR').AsInteger := DM_ReeVed.DataSetParent['ID_REESTR'];
        StProc.ParamByName('ID_BANK').AsInteger := Viplata[0];
        StProc.ExecProc;
        StProc.Transaction.Commit;
        DM_ReeVed.DataSetParent.SQLs.UpdateSQL.Text := 'Execute procedure Z_empty_proc';

        if FSystem
        then DM_ReeVed.DataSetParent.SQLs.RefreshSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT(NULL,'+IntToStr(pBarFilter.KodSetupBeg)+',1000) WHERE ID_REESTR='+VarToStr(DM_ReeVed.DataSetParent['ID_REESTR'])
        else DM_ReeVed.DataSetParent.SQLs.RefreshSQL.Text := 'SELECT * FROM UV_REE_VED_SELECT(NULL,'+IntToStr(pBarFilter.KodSetupBeg)+',999) WHERE ID_REESTR='+VarToStr(DM_ReeVed.DataSetParent['ID_REESTR']);

        DM_ReeVed.DataSetParent.Edit;
        DM_ReeVed.DataSetParent.Post;
        DM_ReeVed.DataSetParent.CloseOpen(true);
        DM_ReeVed.DataSetParent.Locate('ID_REESTR',id_reestr,[]);
        DM_ReeVed.DataSetChildParent.CloseOpen(TRUE);
        DM_ReeVed.DataSetSheetData.CloseOpen(true);
      except
       on E:Exception do
       begin
        StProc.Transaction.Commit;
        ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
       end;
      end;
    end;
  end;
end;

procedure TFUV_REE_VED.BtnSvodClick(Sender: TObject);
begin
  PrintReeList(self,DM_ReeVed.DataBase.Handle,DM_ReeVed.DataSetParent['ID_REESTR']);
end;

procedure TFUV_REE_VED.N1Click(Sender: TObject);
begin
     if (DM_ReeVed.DataSetParent.RecordCount>0)
     then begin
               with TfrmDelivInfo.Create(Self,DM_ReeVed.DataSetParent.FieldByName('ID_REESTR').value,DM_ReeVed.DataBase.Handle) do
               begin
                    ShowModal;
                    Free;
                    RefreshBtnClick(Self);
               end;
     end;
end;

procedure TFUV_REE_VED.N2Click(Sender: TObject);
var StProc:TpFIBStoredProc;
begin
     if DM_ReeVed.DataSetChild.RecordCount>0
     then begin
                StProc := TpFIBStoredProc.Create(nil);
                StProc.Transaction := TpFIBTransaction.Create(nil);
                StProc.Transaction.DefaultDatabase := TpFIBDatabase.Create(nil);
                StProc.Database := StProc.Transaction.DefaultDatabase;
                StProc.Database.Handle := DM_ReeVed.DataBase.Handle;
                try
                  StProc.StoredProcName := 'UV_REE_VED_CORR_SHEET_ID_SHEET';
                  StProc.Transaction.StartTransaction;
                  StProc.Prepare;
                  StProc.ParamByName('ID_SHEET').AsInteger:=DM_ReeVed.DataSetChild.FieldByName('ID_SHEET').Value;
                  StProc.ExecProc;
                  StProc.Transaction.Commit;
                  DM_ReeVed.DataSetChild.CloseOpen(true);
                except
                 on E:Exception do
                 begin
                      StProc.Transaction.Commit;
                      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
                 end;
                end;
    end;
end;

procedure TFUV_REE_VED.cxButton1Click(Sender: TObject);
begin
      ShowMessage('!');
end;

procedure TFUV_REE_VED.VedPopupReportsBtnClick(Sender: TObject);
begin
PrintSheet(self,DM_ReeVed.DataBase.Handle,
            DM_ReeVed.DataSetParent.FieldValues['ID_REESTR'],4);
end;

procedure TFUV_REE_VED.ButtonSheetToBankCheckClick(Sender: TObject);
begin
DM_ReeVed.DsetSheetToBankCheck.close;
DM_ReeVed.DsetSheetToBankCheck.selectsql.Text:='select * from UV_SHEET_TO_BANK_CHECK('+
inttostr(DM_ReeVed.DataSetParent['ID_REESTR'])+')';
DM_ReeVed.DsetSheetToBankCheck.open;
if DM_ReeVed.DsetSheetToBankCheck.RecordCountFromSrv =0 then
  ZShowMessage(GetConst('Attention','OtherConsts'),GetConst('AllOk','OtherConsts'),mtInformation, [mbOK])
else
begin

 ReportSheetToBankCheck.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Zarplata\ReeVedSheetToBankCheck.fr3');
 ReportSheetToBankCheck.ShowReport;

end;
end;

procedure TFUV_REE_VED.N3Click(Sender: TObject);
var StProc:TpFIBStoredProc;
    IdReestr:Integer;
    IdGrSheet:Integer;
    IdSheet:Integer;
begin
     if DM_ReeVed.DataSetChild.RecordCount>0
     then begin
                try
                  IdReestr:=DM_ReeVed.DataSetParent['ID_REESTR'];
                  IdGrSheet:=DM_ReeVed.DataSetChildParent['ID_GRSHEET'];
                  IdSheet:=DM_ReeVed.DataSetChild['ID_SHEET'];
                  DM_ReeVed.StoredProc.StoredProcName := 'UV_SHEET_CORR_SUM';
                  DM_ReeVed.StoredProc.Transaction.StartTransaction;
                  DM_ReeVed.StoredProc.Prepare;
                  DM_ReeVed.StoredProc.ParamByName('ID_SHEET').AsInteger:=DM_ReeVed.DataSetChild.FieldByName('ID_SHEET').Value;
                  DM_ReeVed.StoredProc.ParamByName('TYPE_SUM').AsInteger:=0;
                  DM_ReeVed.StoredProc.ExecProc;
                  DM_ReeVed.StoredProc.Transaction.Commit;
                  DM_ReeVed.DataSetParent.CloseOpen(true);
                  GridReeVedView1.DataController.LocateByKey(IdReestr);
                  DM_ReeVed.DataSetChildParent.CloseOpen(true);
                  GridVedView1.DataController.LocateByKey(IdGrSheet);
                  DM_ReeVed.DataSetChild.CloseOpen(true);
                  GridPeopleView1.DataController.LocateByKey(IdSheet);
                  DM_ReeVed.DataSetSheetData.CloseOpen(true);
                except
                 on E:Exception do
                 begin
                      StProc.Transaction.Commit;
                      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
                 end;
                end;
    end;
end;

procedure TFUV_REE_VED.N4Click(Sender: TObject);
var StProc:TpFIBStoredProc;
    IdReestr:Integer;
    IdGrSheet:Integer;
    IdSheet:Integer;
begin
     if DM_ReeVed.DataSetChild.RecordCount>0
     then begin
                try
                  IdReestr:=DM_ReeVed.DataSetParent['ID_REESTR'];
                  IdGrSheet:=DM_ReeVed.DataSetChildParent['ID_GRSHEET'];
                  IdSheet:=DM_ReeVed.DataSetChild['ID_SHEET'];
                  DM_ReeVed.StoredProc.StoredProcName := 'UV_SHEET_CORR_SUM';
                  DM_ReeVed.StoredProc.Transaction.StartTransaction;
                  DM_ReeVed.StoredProc.Prepare;
                  DM_ReeVed.StoredProc.ParamByName('ID_SHEET').AsInteger:=DM_ReeVed.DataSetChild.FieldByName('ID_SHEET').Value;
                  DM_ReeVed.StoredProc.ParamByName('TYPE_SUM').AsInteger:=1;
                  DM_ReeVed.StoredProc.ExecProc;
                  DM_ReeVed.StoredProc.Transaction.Commit;
                  DM_ReeVed.DataSetParent.CloseOpen(true);
                  GridReeVedView1.DataController.LocateByKey(IdReestr);
                  DM_ReeVed.DataSetChildParent.CloseOpen(true);
                  GridVedView1.DataController.LocateByKey(IdGrSheet);
                  DM_ReeVed.DataSetChild.CloseOpen(true);
                  GridPeopleView1.DataController.LocateByKey(IdSheet);
                  DM_ReeVed.DataSetSheetData.CloseOpen(true);
                except
                 on E:Exception do
                 begin
                      StProc.Transaction.Commit;
                      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
                 end;
                end;
    end;
end;

procedure TFUV_REE_VED.N5Click(Sender: TObject);
var StProc:TpFIBStoredProc;
    IdReestr:Integer;
    IdGrSheet:Integer;
    IdSheet:Integer;
begin
     if DM_ReeVed.DataSetChild.RecordCount>0
     then begin
                try
                  IdReestr:=DM_ReeVed.DataSetParent['ID_REESTR'];
                  IdGrSheet:=DM_ReeVed.DataSetChildParent['ID_GRSHEET'];
                  IdSheet:=DM_ReeVed.DataSetChild['ID_SHEET'];
                  DM_ReeVed.StoredProc.StoredProcName := 'UV_SHEET_CORR_SUM';
                  DM_ReeVed.StoredProc.Transaction.StartTransaction;
                  DM_ReeVed.StoredProc.Prepare;
                  DM_ReeVed.StoredProc.ParamByName('ID_SHEET').AsInteger:=DM_ReeVed.DataSetChild.FieldByName('ID_SHEET').Value;
                  DM_ReeVed.StoredProc.ParamByName('TYPE_SUM').AsInteger:=2;
                  DM_ReeVed.StoredProc.ExecProc;
                  DM_ReeVed.StoredProc.Transaction.Commit;
                  DM_ReeVed.DataSetParent.CloseOpen(true);
                  GridReeVedView1.DataController.LocateByKey(IdReestr);
                  DM_ReeVed.DataSetChildParent.CloseOpen(true);
                  GridVedView1.DataController.LocateByKey(IdGrSheet);
                  DM_ReeVed.DataSetChild.CloseOpen(true);
                  GridPeopleView1.DataController.LocateByKey(IdSheet);
                  DM_ReeVed.DataSetSheetData.CloseOpen(true);
                except
                 on E:Exception do
                 begin
                      StProc.Transaction.Commit;
                      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
                 end;
                end;
    end;
end;

procedure TFUV_REE_VED.N6Click(Sender: TObject);
var StProc:TpFIBStoredProc;
    IdReestr:Integer;
    IdGrSheet:Integer;
begin
     if DM_ReeVed.DataSetChildParent.RecordCount>0
     then begin
                try
                  IdReestr:=DM_ReeVed.DataSetParent['ID_REESTR'];
                  IdGrSheet:=DM_ReeVed.DataSetChildParent['ID_GRSHEET'];
                  DM_ReeVed.StoredProc.StoredProcName := 'UV_GRSHEET_CORR_SUM';
                  DM_ReeVed.StoredProc.Transaction.StartTransaction;
                  DM_ReeVed.StoredProc.Prepare;
                  DM_ReeVed.StoredProc.ParamByName('ID_GRSHEET').AsInteger:=DM_ReeVed.DataSetChildParent.FieldByName('ID_GRSHEET').Value;
                  DM_ReeVed.StoredProc.ParamByName('TYPE_SUM').AsInteger:=0;
                  DM_ReeVed.StoredProc.ExecProc;
                  DM_ReeVed.StoredProc.Transaction.Commit;
                  DM_ReeVed.DataSetParent.CloseOpen(true);
                  GridReeVedView1.DataController.LocateByKey(IdReestr);
                  DM_ReeVed.DataSetChildParent.CloseOpen(true);
                  GridVedView1.DataController.LocateByKey(IdGrSheet);
                  DM_ReeVed.DataSetChild.CloseOpen(true);
                  DM_ReeVed.DataSetSheetData.CloseOpen(true);
                except
                 on E:Exception do
                 begin
                      StProc.Transaction.Commit;
                      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
                 end;
                end;
    end;
end;

procedure TFUV_REE_VED.N7Click(Sender: TObject);
var StProc:TpFIBStoredProc;
    IdReestr:Integer;
    IdGrSheet:Integer;
begin
     if DM_ReeVed.DataSetChildParent.RecordCount>0
     then begin
                try
                  IdReestr:=DM_ReeVed.DataSetParent['ID_REESTR'];
                  IdGrSheet:=DM_ReeVed.DataSetChildParent['ID_GRSHEET'];
                  DM_ReeVed.StoredProc.StoredProcName := 'UV_GRSHEET_CORR_SUM';
                  DM_ReeVed.StoredProc.Transaction.StartTransaction;
                  DM_ReeVed.StoredProc.Prepare;
                  DM_ReeVed.StoredProc.ParamByName('ID_GRSHEET').AsInteger:=DM_ReeVed.DataSetChildParent.FieldByName('ID_GRSHEET').Value;
                  DM_ReeVed.StoredProc.ParamByName('TYPE_SUM').AsInteger:=1;
                  DM_ReeVed.StoredProc.ExecProc;
                  DM_ReeVed.StoredProc.Transaction.Commit;
                  DM_ReeVed.DataSetParent.CloseOpen(true);
                  GridReeVedView1.DataController.LocateByKey(IdReestr);
                  DM_ReeVed.DataSetChildParent.CloseOpen(true);
                  GridVedView1.DataController.LocateByKey(IdGrSheet);
                  DM_ReeVed.DataSetChild.CloseOpen(true);
                  DM_ReeVed.DataSetSheetData.CloseOpen(true);
                except
                 on E:Exception do
                 begin
                      StProc.Transaction.Commit;
                      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
                 end;
                end;
    end;
end;

procedure TFUV_REE_VED.N8Click(Sender: TObject);
var StProc:TpFIBStoredProc;
    IdReestr:Integer;
    IdGrSheet:Integer;
begin
     if DM_ReeVed.DataSetChildParent.RecordCount>0
     then begin
                try
                  IdReestr:=DM_ReeVed.DataSetParent['ID_REESTR'];
                  IdGrSheet:=DM_ReeVed.DataSetChildParent['ID_GRSHEET'];
                  DM_ReeVed.StoredProc.StoredProcName := 'UV_GRSHEET_CORR_SUM';
                  DM_ReeVed.StoredProc.Transaction.StartTransaction;
                  DM_ReeVed.StoredProc.Prepare;
                  DM_ReeVed.StoredProc.ParamByName('ID_GRSHEET').AsInteger:=DM_ReeVed.DataSetChildParent.FieldByName('ID_GRSHEET').Value;
                  DM_ReeVed.StoredProc.ParamByName('TYPE_SUM').AsInteger:=2;
                  DM_ReeVed.StoredProc.ExecProc;
                  DM_ReeVed.StoredProc.Transaction.Commit;
                  DM_ReeVed.DataSetParent.CloseOpen(true);
                  GridReeVedView1.DataController.LocateByKey(IdReestr);
                  DM_ReeVed.DataSetChildParent.CloseOpen(true);
                  GridVedView1.DataController.LocateByKey(IdGrSheet);
                  DM_ReeVed.DataSetChild.CloseOpen(true);
                  DM_ReeVed.DataSetSheetData.CloseOpen(true);
                except
                 on E:Exception do
                 begin
                      StProc.Transaction.Commit;
                      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
                 end;
                end;
    end;
end;

procedure TFUV_REE_VED.GrColCh2TypeSumGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if(AText='0')then
    AText:=GridClFlagVipl_Caption[PLanguageIndex]
  else
    if(AText='1')then
      AText:=GridClDeponir_Caption[PLanguageIndex]
    else
      if(AText='2')then
        AText:=GridClRaznoe_Caption[PLanguageIndex];
end;

procedure TFUV_REE_VED.dxBarButton3Click(Sender: TObject);
begin
  PrintSheet(self,DM_ReeVed.DataBase.Handle,
             DM_ReeVed.DataSetParent.FieldValues['ID_REESTR'],5);
end;

end.

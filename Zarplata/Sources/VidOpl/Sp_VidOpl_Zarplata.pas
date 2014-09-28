unit Sp_VidOpl_Zarplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxBar, dxBarExtItems, cxTL,
  cxMaskEdit, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer,
  cxTextEdit, ExtCtrls, cxInplaceContainer, cxDBTL, cxTLData, dxDockPanel,
  dxDockControl,ZProc, Kernel, PackageLoad, Sp_VidOpl_Corespond_Edit,
  cxCheckBox, FIBDataSet, pFIBDataSet, Unit_ZGlobal_Consts,
  SpVidOplZarplataControl, cxLabel, cxDBEdit, ZTypes,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, IBase,
  RxMemDS, zMessages, pFIBErrorHandler, ComCtrls, Sp_VidOpl_DataModule,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxGridBandedTableView, cxGridDBBandedTableView, SP_VidOpl_Locate,
  Sp_MainProp, GlobalSpr, Sp_VidOplPropUse;

type TVoplPropUse = record
 Id:integer;
 In_use:string[1];
end;

type
  TFZSp_VidOpl = class(TForm)
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    UpdateAllBtn: TdxBarLargeButton;
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
    PageControl: TPageControl;
    TabSheetNarchisl: TTabSheet;
    PanelNarGrid1: TPanel;
    GridVidOpl: TcxGrid;
    GridVidOplView1: TcxGridDBTableView;
    GridColumnVidOplName: TcxGridDBColumn;
    GridColumnVidOplGroup: TcxGridDBColumn;
    GridColumnVidOplCash: TcxGridDBColumn;
    GridColumnVidOplKod: TcxGridDBColumn;
    GridVidOplLevel1: TcxGridLevel;
    PanelNarChild2: TPanel;
    GridVidOplOptions: TcxGrid;
    GridVidOplOptionsView1: TcxGridDBTableView;
    GridColumnOptinsName: TcxGridDBColumn;
    GridColumnOptionsUse: TcxGridDBColumn;
    GridColumnOptionsNameGroup: TcxGridDBColumn;
    GridVidOplOptionsLevel1: TcxGridLevel;
    SplitterNarDopData: TcxSplitter;
    PanelDopDataVOpl: TPanel;
    NarEditTipNach: TcxDBMaskEdit;
    NarEditTipFund: TcxDBMaskEdit;
    NarLabelTipNach: TcxLabel;
    NarLabelTipFund: TcxLabel;
    TabSheetUder: TTabSheet;
    PanelUdGrid1: TPanel;
    UDGrid1DBTableView1: TcxGridDBTableView;
    UDGrid1Level1: TcxGridLevel;
    UDGrid1: TcxGrid;
    UdGr1ClVOName: TcxGridDBColumn;
    UdGr1ClVOGroup: TcxGridDBColumn;
    UdGr1ClVOKod: TcxGridDBColumn;
    UdGr1ClVOCash: TcxGridDBColumn;
    SplitterNarProps: TcxSplitter;
    PanelUDGrid2: TPanel;
    UDGrid2: TcxGrid;
    UDGrid2DBTableView1: TcxGridDBTableView;
    UdGr2ClNameGroup: TcxGridDBColumn;
    UdGr2ClNameProp: TcxGridDBColumn;
    UdGr2ClUse: TcxGridDBColumn;
    UDGrid2Level1: TcxGridLevel;
    SplitterUdProps: TcxSplitter;
    PanelUDDopData: TPanel;
    UdEditTipNach: TcxDBMaskEdit;
    UdEditTipFund: TcxDBMaskEdit;
    UdLabelTipNach: TcxLabel;
    UdLabelTipFund: TcxLabel;
    SplitterUdDopData: TcxSplitter;
    UdGr2ClIdProp: TcxGridDBColumn;
    UdGr2ClIdPropGroup: TcxGridDBColumn;
    SpravGroupVidOplBtn: TdxBarButton;
    SpravPropVidOplBtn: TdxBarButton;
    SpravGroupVidOplPropBtn: TdxBarButton;
    TabSheetCorespond: TTabSheet;
    TabSheetConstsVo: TTabSheet;
    CorGrid: TcxGrid;
    CorGridDBTableView1: TcxGridDBTableView;
    CorGrClKOd: TcxGridDBColumn;
    CorGrClName: TcxGridDBColumn;
    CorGrClNameGroup: TcxGridDBColumn;
    CorGrClCash: TcxGridDBColumn;
    COrGridLevel1: TcxGridLevel;
    CorGrClNameVoplProp: TcxGridDBColumn;
    CorPanelDopData: TPanel;
    CorSplitterDopData: TcxSplitter;
    CorLabelTipNach: TcxLabel;
    CorEditTipNach: TcxDBMaskEdit;
    CorLabelTipFund: TcxLabel;
    CorEditTipFund: TcxDBMaskEdit;
    CorLabelDateBeg: TcxLabel;
    CorEditDateBeg: TcxDBMaskEdit;
    CorLabelDateEnd: TcxLabel;
    CorEditDateEnd: TcxDBMaskEdit;
    CorGrClNachisl: TcxGridDBColumn;
    GridConsts: TcxGrid;
    GridConstsLevel1: TcxGridLevel;
    GridConstsDBBandedTableView1: TcxGridDBBandedTableView;
    GridConstsClPropName: TcxGridDBBandedColumn;
    GridConstsClVoName: TcxGridDBBandedColumn;
    GridConstsClVOKod: TcxGridDBBandedColumn;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
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
    LocateBtn: TdxBarLargeButton;
    GridColumnOptionsIdProp: TcxGridDBColumn;
    GridColumnOptionsIdPropGroup: TcxGridDBColumn;
    PropertiesBtn: TdxBarLargeButton;
    GridVidOplView1DBColumn1: TcxGridDBColumn;
    UDGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    SpravTypeVidOplBtn: TdxBarButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InsertBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure SpravPropBtnClick(Sender: TObject);
    procedure SpravGroupBtnClick(Sender: TObject);
    procedure UpdateAllBtnClick(Sender: TObject);
    procedure TabSheetUderShow(Sender: TObject);
    procedure TabSheetNarchislShow(Sender: TObject);
    procedure UDGrid2DBTableView1DblClick(Sender: TObject);
    procedure SpravGroupVidOplBtnClick(Sender: TObject);
    procedure SpravGroupVidOplPropBtnClick(Sender: TObject);
    procedure SpravPropVidOplBtnClick(Sender: TObject);
    procedure TabSheetCorespondShow(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure UDGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure CorGridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TabSheetConstsVoShow(Sender: TObject);
    procedure GridConstsDBBandedTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure LocateBtnClick(Sender: TObject);
    procedure GridVidOplOptionsView1DblClick(Sender: TObject);
    procedure PropertiesBtnClick(Sender: TObject);
    procedure GridVidOplView1KeyPress(Sender: TObject; var Key: Char);
    procedure UDGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure SpravTypeVidOplBtnClick(Sender: TObject);
  private
    DM:TDMVidOpl;
    Ins_ZFormStyle:TZFormStyle;
    Ins_Resault: Variant;
    LocateParam:TLocateData;
    PlanguageIndex:byte;
    pIdSystem:integer;
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsChild;Id_Filter:Integer=0;Id_System:integer=0);reintroduce;
    property ZFormStyle:TZFormStyle read Ins_ZFormStyle;
    property Resault: Variant read Ins_Resault;
  end;

function View_FZ_VidOpl_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle;Id_VoplFilter:Integer;Id_System:integer=0):Variant;stdcall;
 exports View_FZ_VidOpl_Sp;

implementation

uses cxCalendar, Math;

{$R *.dfm}

function View_FZ_VidOpl_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle;Id_VoplFilter:Integer;Id_System:integer=0):Variant;
var ViewForm: TFZSp_VidOpl;
    Res:Variant;
begin
 case ComeFormStyle of
  zfsChild:
   begin
    if not IsMDIChildFormShow(TFZSp_VidOpl) then
      ViewForm  :=  TFZSp_VidOpl.Create(AOwner, DB, ComeFormStyle,Id_VoplFilter,Id_System);
    res :=NULL;
   end;
  zfsNormal:
   begin
    ViewForm  :=  TFZSp_VidOpl.Create(AOwner, DB, ComeFormStyle, Id_VoplFilter,Id_System);
    ViewForm.ShowModal;
    res:=NULL;
    ViewForm.Free;
   end;
  zfsModal:
   begin
    ViewForm  :=  TFZSp_VidOpl.Create(AOwner, DB, ComeFormStyle, Id_VoplFilter,Id_System);
    ViewForm.ShowModal;
    if (ViewForm.ModalResult=mrYes) then
     res:=ViewForm.Resault
    else
      res:=NULL;
    ViewForm.Free;
   end;
 end;
 View_FZ_VidOpl_Sp:=res;
end;

constructor TFZSp_VidOpl.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsChild;Id_Filter:Integer=0;Id_System:integer=0);
begin
inherited Create(ComeComponent);
PlanguageIndex := LanguageIndex;
pIdSystem := Id_System;
Ins_ZFormStyle:=ComeFormStyle;
Ins_Resault := VarArrayCreate([0,2],varVariant);
//******************************************************************************//
PanelDopDataVOpl.Color           := GridVidOplOptionsView1.Styles.Background.Color;
SplitterNarDopData.Color         := GridVidOplOptionsView1.Styles.Header.Color;
PanelUdDopData.Color             := UDGrid1DBTableView1.Styles.Background.Color;
SplitterUdDopData.Color          := UDGrid1DBTableView1.Styles.Header.Color;
CorPanelDopData.Color            := CorGridDBTableView1.Styles.Background.Color;
CorSplitterDopData.Color         := CorGridDBTableView1.Styles.Header.Color;
//******************************************************************************//
DM:=TDMVidOpl.Create(Self);
DM.DB.Handle:=ComeDB;
DM.RTransaction.StartTransaction;
//******************************************************************************//
LocateParam.Text := '';
LocateParam.Field := fflNameVo;
LocateParam.Fields := [];
//******************************************************************************//
UDGrid1DBTableView1.DataController.DataSource:=DM.DSourceUD1;
UDGrid2DBTableView1.DataController.DataSource:=DM.DSourceUD2;
GridVidOplView1.DataController.DataSource:=DM.DSourceNar1;
GridVidOplOptionsView1.DataController.DataSource:=DM.DSourceNar2;
GridConstsDBBandedTableView1.DataController.DataSource:=DM.DSourceConsts1;
CorGridDBTableView1.DataController.DataSource:=DM.DSourceCor1;
NarEditTipNach.DataBinding.DataSource := DM.DSourceNar1;
NarEditTipFund.DataBinding.DataSource := DM.DSourceNar1;
UdEditTipNach.DataBinding.DataSource := DM.DSourceUd1;
UdEditTipFund.DataBinding.DataSource := DM.DSourceUd1;
CorEditTipNach.DataBinding.DataSource := DM.DSourceCor1;
CorEditTipFund.DataBinding.DataSource := DM.DSourceCor1;
CorEditDateBeg.DataBinding.DataSource := DM.DSourceCor1;
CorEditDateEnd.DataBinding.DataSource := DM.DSourceCor1;
//******************************************************************************//

DM.DSetUD1.SQLs.SelectSQL.Text  := 'SELECT * FROM Z_SP_VIDOPL_SELECT('+IntToStr(Id_Filter)+',2,'+IfThen(Id_System=0,'NULL',IntToStr(Id_System))+
                                           ') ORDER BY NAME_GROUP,KOD_VIDOPL';
DM.DSetUD2.SQLs.SelectSQL.Text  := 'SELECT * from Z_VIDOPL_PROPERTIES_SELECT(:ID_VIDOPL,2) ORDER BY NAME_VIDOPL_PROP';
DM.DSetNar1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SP_VIDOPL_SELECT('+IntToStr(Id_Filter)+',1,'+IfThen(Id_System=0,'NULL',IntToStr(Id_System))+
                                           ') ORDER BY NAME_GROUP,KOD_VIDOPL';
DM.DSetNar2.SQLs.SelectSQL.Text := 'SELECT * from Z_VIDOPL_PROPERTIES_SELECT(:ID_VIDOPL,1) ORDER BY NAME_VIDOPL_PROP';
DM.DSetCor1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_VIDOPL_CORESPOND_S(NULL) ORDER BY NAME_VOPL_PROP,NAME_GROUP,KOD_VIDOPL';
DM.DSetConsts1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_VIDOPL_PROP_CONSTS_S ORDER BY NAME_VOPL_PROP,KOD_VIDOPL';

self.Caption                             := FZSp_VidOpl_Caption[PLanguageIndex];
self.InsertBtn.Caption                   := InsertBtn_Caption[PLanguageIndex];
self.UpdateBtn.Caption                   := UpdateBtn_Caption[PLanguageIndex];
self.DeleteBtn.Caption                   := DeleteBtn_Caption[PLanguageIndex];
self.RefreshBtn.Caption                  := RefreshBtn_Caption[PLanguageIndex];
self.SelectBtn.Caption                   := SelectBtn_Caption[PLanguageIndex];
self.LocateBtn.Caption                   := LocateBtn_Caption[PLanguageIndex];
self.SpravPropVidOplBtn.Caption          := SpravPropVidOplBtn_Caption[PLanguageIndex];
self.SpravGroupVidOplBtn.Caption         := SpravGroupVidOplBtn_Caption[PLanguageIndex];
self.SpravGroupVidOplPropBtn.Caption     := SpravGroupVidOplPropBtn_Caption[PLanguageIndex];
self.SpravTypeVidOplBtn.Caption          := SpravTypeVidOplPropBtn_Caption[PLanguageIndex];
self.TabSheetNarchisl.Caption            := TabSheetNar_Caption[PLanguageIndex];
self.TabSheetUder.Caption                := TabSheetUd_Caption[PLanguageIndex];
self.TabSheetCorespond.Caption           := TabSheetCorespond_Caption[PLanguageIndex];
self.TabSheetConstsVo.Caption            := TabSheetConstsVo_Caption[PLanguageIndex];
self.ExitBtn.Caption                     := ExitBtn_Caption[PLanguageIndex];
self.UpdateAllBtn.Caption                := UpdateAllBtn_Caption[PLanguageIndex];
self.PropertiesBtn.Caption               := PropertiesBtn_Caption[PlanguageIndex];
//******************************************************************************//
NarLabelTipNach.Caption               := FZSp_VidOpl_LabelTipNach_Caption[PLanguageIndex];
NarLabelTipFund.Caption               := FZSp_VidOpl_LabelTipFund_Caption[PLanguageIndex];
UdLabelTipNach.Caption                := FZSp_VidOpl_LabelTipNach_Caption[PLanguageIndex];
UdLabelTipFund.Caption                := FZSp_VidOpl_LabelTipFund_Caption[PLanguageIndex];
CorLabelTipNach.Caption               := FZSp_VidOpl_LabelTipNach_Caption[PLanguageIndex];
CorLabelTipFund.Caption               := FZSp_VidOpl_LabelTipFund_Caption[PLanguageIndex];
CorLabelDateBeg.Caption               := FZSp_VidOpl_LabelDateBeg_Caption[PLanguageIndex];
CorLabelDateEnd.Caption               := FZSp_VidOpl_LabelDateEnd_Caption[PLanguageIndex];
GridColumnOptinsName.Caption          := FZSp_VidOpl_GridColumnOptionsName_Caption[PLanguageIndex];
GridColumnOptionsUse.Caption          := FZSp_VidOpl_GridColumnOptionsUse_Caption[PLanguageIndex];
GridColumnOptionsNameGroup.Caption    := FZSp_VidOpl_GridColumnOptionsNameGroup_Caption[PLanguageIndex];

GridConstsClPropName.Caption          := FZSp_VidOpl_GridConstsColumnNameProp_Caption[PLanguageIndex];
GridConstsClVoName.Caption            := FZSp_VidOpl_GridColumnVidOpl_Name_Caption[PLanguageIndex];
GridConstsClVOKod.Caption             := FZSp_VidOpl_GridColumnVidOplKod_Caption[PLanguageIndex];

CorGrClNameVoplProp.Caption           := FZSp_VidOpl_GridCorColumnNameProp_Caption[PLanguageIndex];


GridColumnVidOplName.Caption     := FZSp_VidOpl_GridColumnVidOpl_Name_Caption[PLanguageIndex];
GridColumnVidOplGroup.Caption    := FZSp_VidOpl_GridColumnVidOplGroup_Caption[PLanguageIndex];
GridColumnVidOplCash.Caption     := FZSp_VidOpl_GridColumnVidOplCash_Caption[PLanguageIndex];
GridColumnVidOplKod.Caption      := FZSp_VidOpl_GridColumnVidOplKod_Caption[PLanguageIndex];
//******************************************************************************//
UdGr1ClVOName.Caption     := FZSp_VidOpl_GridColumnVidOpl_Name_Caption[PLanguageIndex];
UdGr1ClVOGroup.Caption    := FZSp_VidOpl_GridColumnVidOplGroup_Caption[PLanguageIndex];
UdGr1ClVOCash.Caption     := FZSp_VidOpl_GridColumnVidOplCash_Caption[PLanguageIndex];
UdGr1ClVOKod.Caption      := FZSp_VidOpl_GridColumnVidOplKod_Caption[PLanguageIndex];

UdGr2ClNameProp.Caption   := FZSp_VidOpl_GridColumnOptionsName_Caption[PLanguageIndex];
UdGr2ClUse.Caption        := FZSp_VidOpl_GridColumnOptionsUse_Caption[PLanguageIndex];
UdGr2ClNameGroup.Caption  := FZSp_VidOpl_GridColumnOptionsNameGroup_Caption[PLanguageIndex];
//******************************************************************************//
CorGrClName.Caption       := FZSp_VidOpl_GridColumnVidOpl_Name_Caption[PLanguageIndex];
CorGrClNameGroup.Caption  := FZSp_VidOpl_GridColumnVidOplGroup_Caption[PLanguageIndex];
CorGrClCash.Caption       := FZSp_VidOpl_GridColumnVidOplCash_Caption[PLanguageIndex];
CorGrClKOd.Caption        := FZSp_VidOpl_GridColumnVidOplKod_Caption[PLanguageIndex];
CorGrClNachisl.Caption    := FZSp_VidOpl_GridColumnVidOplNachisl_Caption[PLanguageIndex];
//******************************************************************************//
case ComeFormStyle of
 zfsModal:
  begin
   self.InsertBtn.Visible := ivNever;
   self.UpdateBtn.Visible := ivNever;
   self.DeleteBtn.Visible := ivNever;
   BarManager.BarByName('SpravVidOplBar').Visible := False;
   self.FormStyle         := fsNormal;
   self.BorderStyle       := bsDialog;
   self.SelectBtn.Visible := ivAlways;
   self.Position          := poOwnerFormCenter;
   TabSheetCorespond.Free;
   TabSheetConstsVo.Free;
  end;
 zfsChild:
  begin
   self.FormStyle         := fsMDIChild;
   self.BorderStyle       := bsSizeable;
   self.SelectBtn.Visible := ivNever;
   self.Position          := poMainFormCenter;
   CorSplitterDopData.CloseSplitter;
   TabSheetCorespond.Free;
  end;
 zfsNormal:
  begin
   self.FormStyle         := fsNormal;
   self.BorderStyle       := bsDialog;
   self.SelectBtn.Visible := ivNever;
   self.Position          := poOwnerFormCenter;
   CorSplitterDopData.CloseSplitter;
   TabSheetCorespond.Free;
  end;
end;
//******************************************************************************//
  PageControlChange(Self);
  PageControl.ActivePage := TabSheetNarchisl;
  InsertBtn.Enabled:=True;
  UpdateBtn.Enabled:=false;
  Self.WindowState:=wsMaximized;
end;

procedure TFZSp_VidOpl.ExitBtnClick(Sender: TObject);
begin
if Ins_ZFormStyle<>zfsChild then ModalResult:=mrNo
else  Close;
end;

procedure TFZSp_VidOpl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if Dm.RTransaction.InTransaction then Dm.RTransaction.Commit;
if Self.FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZSp_VidOpl.InsertBtnClick(Sender: TObject);
var InsertForm:TZFVidOplControl;
    Id:Integer;
    TmpDSet:TpFIBDataSet;
begin
TmpDSet:=TpFIBDataSet.Create(self);
if PageControl.ActivePage=TabSheetNarchisl then TmpDSet:=DM.DSetNar1;
if PageControl.ActivePage=TabSheetUder then TmpDSet:=DM.DSetUD1;

InsertForm         := TZFVidOplControl.Create(self,DM.DB.Handle);
InsertForm.Caption := ZFVidOplControl_Caption_Insert[PLanguageIndex];
InsertForm.CheckNachisl.Properties.ReadOnly:=true;
if PageControl.ActivePage=TabSheetNarchisl then InsertForm.CheckNachisl.Checked:=True;
if PageControl.ActivePage=TabSheetUder then InsertForm.CheckNachisl.Checked:=False;
InsertForm.ShowModal;
If InsertForm.ModalResult=mrYes then
 try
   DM.StProc.Database                               := DM.DB;
   DM.StProc.Transaction                            := DM.WTransaction;
   DM.StProc.Transaction.StartTransaction;
   DM.StProc.StoredProcName                         := 'Z_SP_VIDOPL_INSERT';
   DM.StProc.Prepare;
   DM.StProc.ParamByName('NAME_VIDOPL').AsString    := InsertForm.NameEdit.Text;
   DM.StProc.ParamByName('NACHISL').AsString        := InsertForm.CheckNachisl.EditValue;
   DM.StProc.ParamByName('CASH').AsString           := InsertForm.CheckCash.EditValue;
   DM.StProc.ParamByName('TIP_NACH').AsInteger      := InsertForm.TypeNachislEdit.EditValue;
   DM.StProc.ParamByName('TIP_FUND').AsInteger      := InsertForm.TypeFundEdit.EditValue;
   If InsertForm.KodEdit.Text<>'' then
    DM.StProc.ParamByName('KOD_VIDOPL').AsInteger   := StrToInt(InsertForm.KodEdit.Text)
   else
    DM.StProc.ParamByName('KOD_VIDOPL').AsVariant   := NULL;
   DM.StProc.ParamByName('ID_VOPL_GROUP').AsInteger := InsertForm.Id_VOPl_Group;
   DM.StProc.ParamByName('DATE_BEG').AsDate         := InsertForm.DateBeg.Date;
   DM.StProc.ParamByName('DATE_END').AsDate         := InsertForm.DateEnd.Date;

   DM.StProc.ParamByName('SHIFR').AsString          := InsertForm.shifr.text;


   if InsertForm.Kod1DFEdit.Text = '' then
     DM.StProc.ParamByName('KOD_1DF').AsVariant     := NULL
   else
     DM.StProc.ParamByName('KOD_1DF').AsInteger     := StrToInt(InsertForm.Kod1DFEdit.Text);
   DM.StProc.ParamByName('ID_SYSTEM').AsInteger     := pIdSystem;
   DM.StProc.ParamByName('ID_VIDOPL_TYPE').AsInteger:=InsertForm.Id_VOPl_Type;
   DM.StProc.ExecProc;
   ID := DM.StProc.ParamByName('ID_VIDOPL').AsInteger;
   DM.StProc.Transaction.Commit;
   GridVidOplView1.DataController.DataSource:=nil;
    TmpDSet.SQLs.RefreshSQL.Text:='SELECT * FROM Z_SP_VIDOPL_SELECT_BY_ID('+IntToStr(Id)+')';
    TmpDSet.SQLs.InsertSQL.Text:='SELECT * FROM Z_SP_VIDOPL_SELECT_BY_ID('+IntToStr(ID)+')';
    TmpDSet.Insert;
    TmpDSet.Post;
   GridVidOplView1.DataController.DataSource:=DM.DSourceNar1;
   GridVidOplView1.DataController.LocateByKey(ID);
 except
  on E: Exception do
   begin
    ZShowMessage(Error_caption[PLanguageIndex],e.Message,mtError,[mbOK]);
    DM.StProc.Transaction.Rollback;
   end;
 end;
InsertForm.Free;
TmpDSet:=nil;
TmpDSet.Free;
self.Activate;
end;

procedure TFZSp_VidOpl.RefreshBtnClick(Sender: TObject);
var KeyParent,KeyChild:variant;
begin
if PageControl.ActivePage=TabSheetNarchisl then
 begin
  KeyParent:=DM.DSetNar1['ID_VIDOPL'];

  KeyChild:=VarArrayCreate([0,1],varVariant);
  KeyChild[0]:=DM.DSetNar2['ID_VIDOPL_PROP'];
  KeyChild[1]:=DM.DSetNar2['ID_VOPL_PROP_GROUP'];

  DM.DSetNar2.Close;
  DM.DSetNar1.CloseOpen(True);
  DM.DSetNar2.Open;
  GridVidOplView1.DataController.LocateByKey(KeyParent);
  GridVidOplOptionsView1.DataController.LocateByKey(KeyChild);
 end;
if PageControl.ActivePage=TabSheetUder then
 begin
  KeyParent:=DM.DSetUD1['ID_VIDOPL'];

  KeyChild:=VarArrayCreate([0,1],varVariant);
  KeyChild[0]:=DM.DSetUD2['ID_VIDOPL_PROP'];
  KeyChild[1]:=DM.DSetUD2['ID_VOPL_PROP_GROUP'];

  DM.DSetUD2.Close;
  DM.DSetUD1.CloseOpen(True);
  DM.DSetUD2.Open;
  UDGrid1DBTableView1.DataController.LocateByKey(KeyParent);
  UDGrid2DBTableView1.DataController.LocateByKey(KeyChild);
 end;
if PageControl.ActivePage=TabSheetCorespond then
 begin
  KeyParent:=DM.DSetCor1['ID_VIDOPL'];

  DM.DSetCor1.CloseOpen(True);
  CorGridDBTableView1.DataController.LocateByKey(KeyParent);
 end;
if PageControl.ActivePage=TabSheetConstsVo then
 begin
  KeyParent:=DM.DSetConsts1['ID_VIDOPL'];

  DM.DSetConsts1.CloseOpen(True);
  GridConstsDBBandedTableView1.DataController.LocateByKey(KeyParent);
 end;
end;

procedure TFZSp_VidOpl.UpdateBtnClick(Sender: TObject);
var UpdateForm:TZFVidOplControl;
    RecInfo:RECORD_INFO_STRUCTURE;
    TmpDSet:TpFIBDataSet;
    CorrForm:TFCorespondEdit;
    VidOpl:variant;
begin
if PageControl.ActivePage=TabSheetCorespond then
 begin
  View_FZ_MainProps_Sp(self,DM.DB.Handle,2);
{  CorrForm:=TFCorespondEdit.Create(self,dm.DB.Handle);
  CorrForm.EditVoName.Text:=varToStr(DM.DSetCor1['KOD_VIDOPL'])+' - '+varToStr(DM.DSetCor1['NAME_VIDOPL']);
  if CorrForm.ShowModal=mrYes then
   try
    dm.DSetCor1.SQLs.UpdateSQL.Text := 'execute procedure Z_VIDOPL_CORESPOND_EDIT('+
       varToStr(dm.DSetCor1['ID_VIDOPL'])+','+VarToStr(dm.DSetCor1['ID_VOPL_PROP'])+','+
       VarToStr(CorrForm.CorespondComboBox.EditValue)+')';
    dm.DSetCor1.SQLs.RefreshSQL.Text:='SELECT * FROM Z_VIDOPL_CORESPOND_S(NULL) WHERE ID_VOPL_PROP='+
       VarToStr(dm.DSetCor1['ID_VOPL_PROP'])+' and ID_VIDOPL='+
       varToStr(dm.DSetCor1['ID_VIDOPL']);
    dm.DSetCor1.Edit;
    dm.DSetCor1.Post;
   except
    on E:exception do
     ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
   end;
  CorrForm.Free;}
  exit;
 end;
if PageControl.ActivePage=TabSheetConstsVo then
 begin
  VidOPl:=LoadVidOpl(self,dm.DB.Handle,zfsModal,0);
  if VarArrayDimCount(VidOpl)<>0 then
   try
    dm.DSetConsts1.SQLs.UpdateSQL.Text := 'execute procedure Z_VIDOPL_PROP_CONSTS_U('+
       VarToStr(dm.DSetConsts1['ID_VOPL_PROP'])+','+IfThen(VarIsNull(dm.DSetConsts1['ID_VIDOPL']),'NULL',varToStr(dm.DSetConsts1['ID_VIDOPL']))+','+
       VarToStr(VidOpl[0])+')';
    dm.DSetConsts1.SQLs.RefreshSQL.Text:='SELECT * FROM Z_VIDOPL_PROP_CONSTS_S WHERE ID_VOPL_PROP='+
       VarToStr(dm.DSetConsts1['ID_VOPL_PROP'])+' and ID_VIDOPL='+
       varToStr(VidOpl[0]);
    dm.DSetConsts1.Edit;
    dm.DSetConsts1.Post;
   except
    on E:exception do ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
   end;
  exit;
 end;

TmpDSet:=TpFIBDataSet.Create(self);
if PageControl.ActivePage=TabSheetNarchisl then TmpDSet:=DM.DSetNar1;
if PageControl.ActivePage=TabSheetUder then TmpDSet:=DM.DSetUD1;
try
 DM.StProc.Database                               := DM.DB;
 DM.StProc.Transaction                            := DM.WTransaction;
 DM.StProc.Transaction.StartTransaction;

  RecInfo.TRHANDLE       :=DM.WTransaction.Handle;
  RecInfo.DBHANDLE       :=DM.DB.Handle;
  RecInfo.ID_RECORD      :=VarArrayOf([TmpDSet['ID_VIDOPL']]);
  RecInfo.PK_FIELD_NAME  :=VarArrayOf(['ID_VIDOPL']);
  RecInfo.TABLE_NAME     :='SP_VIDOPL';
  RecInfo.RAISE_FLAG     :=True;
  LockRecord(@RecInfo);

 UpdateForm                        := TZFVidOplControl.Create(self, DM.DB.Handle);
 UpdateForm.Caption                := ZFVidOplControl_Caption_Update[PLanguageIndex];
 if TmpDSet['KOD_VIDOPL']<>NULL then
    UpdateForm.KodEdit.Text        := IntToStr(TmpDSet['KOD_VIDOPL']);
 if TmpDSet['SHIFR']<>NULL then
    UpdateForm.shifr.Text        := TmpDSet['SHIFR'];
 if TmpDSet['NAME_VIDOPL']<>NULL then
    UpdateForm.NameEdit.Text          := TmpDSet['NAME_VIDOPL'];
 if TmpDSet['CASH']<>NULL then
    UpdateForm.CheckCash.EditValue    := TmpDSet['CASH'];
 if TmpDSet['NACHISL']<>NULL then
    UpdateForm.CheckNachisl.EditValue := TmpDSet['NACHISL'];
 if TmpDSet['TIP_NACH']<>NULL then
    UpdateForm.TypeNachislEdit.EditValue := TmpDSet['TIP_NACH'];
 if TmpDSet['TIP_FUND']<>NULL then
    UpdateForm.TypeFundEdit.EditValue := TmpDSet['TIP_FUND'];
 if TmpDSet['KOD_1DF']<>NULL then
    UpdateForm.Kod1DFEdit.Text        := TmpDSet['KOD_1DF'];
 if TmpDSet['NAME_GROUP']<>NULL then
  begin
   UpdateForm.GroupEdit.text    := TmpDSet['NAME_GROUP'];
   UpdateForm.Id_VOPl_Group     := TmpDSet['ID_GROUP'];
  end;
 if not VarIsNull(TmpDSet['DATE_BEG']) then
    UpdateForm.DateBeg.Date      := VarToDateTime(TmpDSet['DATE_BEG']);
 if not VarIsNULL(TmpDSet['DATE_END']) then
    UpdateForm.DateEnd.Date      := VarToDateTime(TmpDSet['DATE_END']);
 if TmpDSet['ID_VIDOPL_TYPE']<>NULL then
 begin
    UpdateForm.TypeEdit.Text    := TmpDSet['NAME_VIDOPL_TYPE'];
    UpdateForm.Id_VOPl_Type     := TmpDSet['ID_VIDOPL_TYPE'];
 end;
 UpdateForm.ShowModal;
 If UpdateForm.ModalResult=mrYes then
  begin
   DM.StProc.StoredProcName                         := 'Z_SP_VIDOPL_UPDATE';
   DM.StProc.Prepare;
   DM.StProc.ParamByName('ID_VIDOPL').AsInteger     := TmpDSet['ID_VIDOPL'];
   DM.StProc.ParamByName('NAME_VIDOPL').AsString    := UpdateForm.NameEdit.Text;
   DM.StProc.ParamByName('NACHISL').AsString        := UpdateForm.CheckNachisl.EditValue;
   DM.StProc.ParamByName('CASH').AsString           := UpdateForm.CheckCash.EditValue;
   DM.StProc.ParamByName('TIP_NACH').AsInteger      := UpdateForm.TypeNachislEdit.EditValue;
   DM.StProc.ParamByName('TIP_FUND').AsInteger      := UpdateForm.TypeFundEdit.EditValue;
   If UpdateForm.KodEdit.Text<>'' then
    DM.StProc.ParamByName('KOD_VIDOPL').AsInteger   := StrToInt(UpdateForm.KodEdit.Text)
   else
    DM.StProc.ParamByName('KOD_VIDOPL').AsVariant   := NULL;
   DM.StProc.ParamByName('ID_VOPL_GROUP').AsInteger := UpdateForm.Id_VOPl_Group;
   DM.StProc.ParamByName('DATE_BEG').AsDate         := UpdateForm.DateBeg.Date;
   DM.StProc.ParamByName('DATE_END').AsDate         := UpdateForm.DateEnd.Date;
   DM.StProc.ParamByName('SHIFR').AsString          := UpdateForm.shifr.text;

   if UpdateForm.Kod1DFEdit.Text = '' then
      DM.StProc.ParamByName('KOD_1DF').AsVariant     := NULL
   else
      DM.StProc.ParamByName('KOD_1DF').AsInteger     := StrToInt(UpdateForm.Kod1DFEdit.Text);
   DM.StProc.ParamByName('ID_VIDOPL_TYPE').AsInteger := UpdateForm.Id_VOPl_Type;
   DM.StProc.ExecProc;
  end;
  If UpdateForm.ModalResult=mrYes then DM.StProc.Transaction.Commit;
 except
  on E: Exception do
   begin
    ZShowMessage(Error_caption[PLanguageIndex],e.Message,mtError,[mbOK]);
    DM.WTransaction.Rollback;
   end;
 end;
 if UpdateForm.ModalResult=mrYes then
  begin
   TmpDSet.SQLs.RefreshSQL.Text:='SELECT * FROM Z_SP_VIDOPL_SELECT_BY_ID('+VarToStr(TmpDSet['ID_VIDOPL'])+')';
   TmpDSet.SQLs.UpdateSQL.Text:='SELECT * FROM Z_SP_VIDOPL_SELECT_BY_ID('+VarToStr(TmpDSet['ID_VIDOPL'])+')';
   TmpDSet.Edit;
   TmpDSet.Post;
   if PageControl.ActivePage=TabSheetNarchisl then GridVidOplView1.DataController.LocateByKey(DM.DSetNar1['ID_VIDOPL']);
   if PageControl.ActivePage=TabSheetUder then GridVidOplView1.DataController.LocateByKey(DM.DSetUD1['ID_VIDOPL']);
  end;
 UpdateForm.Free;
 TmpDSet:=nil;
 TmpDSet.Free;
end;

procedure TFZSp_VidOpl.DeleteBtnClick(Sender: TObject);
var TmpDSet:TpFIBDataSet;
begin
TmpDSet:=TpFIBDataSet.Create(self);
if PageControl.ActivePage=TabSheetNarchisl then TmpDSet:=DM.DSetNar1;
if PageControl.ActivePage=TabSheetUder then TmpDSet:=DM.DSetUD1;
if ZShowMessage(Caption_Delete[PlanguageIndex],DeleteRecordQuestion_Text[PlanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
 try
  DM.StProc.Transaction.StartTransaction;
  DM.StProc.StoredProcName:='Z_SP_VIDOPL_DELETE';
  DM.StProc.Prepare;
  DM.StProc.ParamByName('ID_VIDOPL').AsInteger := TmpDSet['ID_VIDOPL'];
  DM.StProc.ExecProc;
  DM.StProc.Transaction.Commit;
//  TmpDSet.SQLs.DeleteSQL.Text:='EXECUTE PROCEDURE Z_SP_VIDOPL_DELETE '+IntToStr(TmpDSet['ID_VIDOPL']);
  TmpDSet.SQLs.DeleteSQL.Text:='EXECUTE PROCEDURE Z_EMPTY_PROC';
  TmpDSet.Delete;
 except
  on E: Exception do
   begin
    ZShowMessage(Error_caption[PLanguageIndex],e.Message,mtError,[mbOK]);
    DM.StProc.Transaction.Rollback;
   end;
 end;
TmpDSet:=nil;
TmpDSet.Free;
end;

procedure TFZSp_VidOpl.SelectBtnClick(Sender: TObject);
begin
if PageControl.ActivePage=TabSheetNarchisl then
 begin
  Ins_Resault[0] := DM.DSetNar1['ID_VIDOPL'];
  Ins_Resault[1] := DM.DSetNar1['NAME_VIDOPL'];
  Ins_Resault[2] := DM.DSetNar1['KOD_VIDOPL'];
 end;
if PageControl.ActivePage=TabSheetUder then
 begin
  Ins_Resault[0] := DM.DSetUd1['ID_VIDOPL'];
  Ins_Resault[1] := DM.DSetUd1['NAME_VIDOPL'];
  Ins_Resault[2] := DM.DSetUd1['KOD_VIDOPL'];
 end;
  self.ModalResult:=mrYes;
end;

procedure TFZSp_VidOpl.SpravPropBtnClick(Sender: TObject);
begin
LoadVOplProp(self,DM.DB.Handle,zfsNormal,1);
end;

procedure TFZSp_VidOpl.SpravGroupBtnClick(Sender: TObject);
begin
LoadVOplPropGroup(self,DM.DB.Handle,zfsNormal,1);
end;

procedure TFZSp_VidOpl.UpdateAllBtnClick(Sender: TObject);
begin
if LoadVOplPropControl(self,DM.DB.Handle,
                    DM.DSetNar1.FieldValues['ID_VIDOPL'],1)=mrYes then
DataSetCloseOpen(DM.DSetNar2, 'ID_VIDOPL_PROP');
end;

procedure TFZSp_VidOpl.TabSheetUderShow(Sender: TObject);
begin
if not DM.DSetUD1.Active then DM.DSetUD1.Open;
if not DM.DSetUD2.Active then DM.DSetUD2.Open;
end;

procedure TFZSp_VidOpl.TabSheetNarchislShow(Sender: TObject);
begin
if not DM.DSetNar1.Active then DM.DSetNar1.Open;
if not DM.DSetNar2.Active then DM.DSetNar2.Open;
end;

procedure TFZSp_VidOpl.UDGrid2DBTableView1DblClick(Sender: TObject);
var Key:variant;
begin
if (UDGrid2DBTableView1.Controller.FocusedRecord=nil) or
   (UDGrid2DBTableView1.Controller.FocusedRecord.Expandable) then exit;
try
  Key:=VarArrayCreate([0,1],varVariant);
  Key[0]:=DM.DSetUD2['ID_VIDOPL_PROP'];
  Key[1]:=DM.DSetUD2['ID_VOPL_PROP_GROUP'];

  DM.StProc.Transaction.StartTransaction;
  DM.StProc.SQL.Text:='EXECUTE PROCEDURE Z_VIDOPL_PROPERTIES_UPDATE('+
     VarToStr(DM.DSetUD1['ID_VIDOPL'])+','+VarToStr(DM.DSetUD2['ID_VIDOPL_PROP'])+','+
     VarToStr(UDGrid2DBTableView1.Controller.FocusedRecord.Values[UdGr2ClUse.Index])+')';
  DM.StProc.ExecQuery;
  DM.StProc.Transaction.Commit;
  DM.DSetUD2.CloseOpen(True);
  UDGrid2DBTableView1.DataController.LocateByKey(Key);
except
 on E:Exception do
  begin
   ZShowMessage(Error_caption[PLanguageIndex],e.Message,mtError,[mbOK]);
   DM.StProc.Transaction.Rollback;
  end;
end;
end;

procedure TFZSp_VidOpl.SpravGroupVidOplBtnClick(Sender: TObject);
begin
LoadVOplFilter(self,DM.DB.Handle,zfsChild);
end;

procedure TFZSp_VidOpl.SpravGroupVidOplPropBtnClick(Sender: TObject);
begin
LoadVOplPropGroup(self,DM.DB.Handle,zfsChild,1);
end;

procedure TFZSp_VidOpl.SpravPropVidOplBtnClick(Sender: TObject);
begin
LoadVOplProp(self,DM.DB.Handle,zfsNormal,1);
end;

procedure TFZSp_VidOpl.TabSheetCorespondShow(Sender: TObject);
begin
if not DM.DSetCor1.Active then DM.DSetCor1.Open;
end;

procedure TFZSp_VidOpl.PageControlChange(Sender: TObject);
begin
if (PageControl.ActivePage = TabSheetCorespond) or
   (PageControl.ActivePage = TabSheetConstsVo) then
 begin
  InsertBtn.Enabled:=False;
  DeleteBtn.Enabled:=False;
  SelectBtn.Enabled:=False;
  if (PageControl.ActivePage = TabSheetCorespond) then
      CorGridDBTableView1FocusedRecordChanged(CorGridDBTableView1,nil,CorGridDBTableView1.Controller.FocusedRecord,True);
 end
else
 begin
  InsertBtn.Enabled:=True;
  DeleteBtn.Enabled:=True;
  SelectBtn.Enabled:=True;
  if PageControl.ActivePage = TabSheetNarchisl then
     UDGrid1DBTableView1FocusedRecordChanged(GridVidOplView1,nil,GridVidOplView1.Controller.FocusedRecord,True);
  if PageControl.ActivePage = TabSheetUder then
     UDGrid1DBTableView1FocusedRecordChanged(UDGrid1DBTableView1,nil,UDGrid1DBTableView1.Controller.FocusedRecord,True);
 end;
end;

procedure TFZSp_VidOpl.UDGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
 begin
  if Sender=GridVidOplView1 then GridVidOplOptionsView1.DataController.DataSource:=nil;
  if Sender=UDGrid1DBTableView1 then UDGrid2DBTableView1.DataController.DataSource:=nil;
  UpdateBtn.Enabled:=False;
  DeleteBtn.Enabled:=False;
  SelectBtn.Enabled:=False;
 end
else
 begin
  if Sender=GridVidOplView1 then GridVidOplOptionsView1.DataController.DataSource:=DM.DSourceNar2;
  if Sender=UDGrid1DBTableView1 then UDGrid2DBTableView1.DataController.DataSource:=DM.DSourceUD2;
  UpdateBtn.Enabled:=True;
  DeleteBtn.Enabled:=True;
  SelectBtn.Enabled:=True;
 end;
end;

procedure TFZSp_VidOpl.CorGridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
 begin
  UpdateBtn.Enabled:=False;
  SelectBtn.Enabled:=False;
  CorEditTipNach.DataBinding.DataSource:=nil;
  CorEditTipFund.DataBinding.DataSource:=nil;
  CorEditDateBeg.DataBinding.DataSource:=nil;
  CorEditDateEnd.DataBinding.DataSource:=nil;
 end
else
 begin
  UpdateBtn.Enabled:=True;
  SelectBtn.Enabled:=True;
  CorEditTipNach.DataBinding.DataSource:=DM.DSourceCor1;
  CorEditTipFund.DataBinding.DataSource:=DM.DSourceCor1;
  CorEditDateBeg.DataBinding.DataSource:=DM.DSourceCor1;
  CorEditDateEnd.DataBinding.DataSource:=DM.DSourceCor1;
 end
end;

procedure TFZSp_VidOpl.TabSheetConstsVoShow(Sender: TObject);
begin
if not dm.DSetConsts1.Active then dm.DSetConsts1.Open;
end;

procedure TFZSp_VidOpl.GridConstsDBBandedTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
  begin
   UpdateBtn.Enabled:=False;
   SelectBtn.Enabled:=False;
  end
else
  begin
   UpdateBtn.Enabled:=True;
   SelectBtn.Enabled:=True;
  end;
end;

procedure TFZSp_VidOpl.LocateBtnClick(Sender: TObject);
var FormLocate:TFVOLocate;
begin
LocateParam.Fields:=[fflNameVo,fflKodVO];
if PageControl.ActivePage=TabSheetConstsVo then LocateParam.Fields:=LocateParam.Fields+[fflConstVO];
FormLocate:=TFVOLocate.Create(self,LocateParam);
if FormLocate.ShowModal=mrYes then
  begin
   LocateParam:=FormLocate.Result;
   if PageControl.ActivePage=TabSheetNarchisl then
    begin
      DM.DSetNar1.Locate(FieldForLocateToName(LocateParam.Field),LocateParam.Text,[loCaseInsensitive, loPartialKey]);;
      GridVidOplView1.DataController.LocateByKey(DM.DSetNar1['ID_VIDOPL']);
    end;
   if PageControl.ActivePage=TabSheetUder then
    begin
      DM.DSetUD1.Locate(FieldForLocateToName(LocateParam.Field),LocateParam.Text,[loCaseInsensitive, loPartialKey]);;
      GridVidOplView1.DataController.LocateByKey(DM.DSetUD1['ID_VIDOPL']);
    end;
   if PageControl.ActivePage=TabSheetCorespond then
    begin
      DM.DSetCor1.Locate(FieldForLocateToName(LocateParam.Field),LocateParam.Text,[loCaseInsensitive, loPartialKey]);;
      GridVidOplView1.DataController.LocateByKey(DM.DSetCor1['ID_VIDOPL']);
    end;
   if PageControl.ActivePage=TabSheetConstsVo then
    begin
      DM.DSetConsts1.Locate(FieldForLocateToName(LocateParam.Field),LocateParam.Text,[loCaseInsensitive, loPartialKey]);;
      GridVidOplView1.DataController.LocateByKey(DM.DSetConsts1['ID_VIDOPL']);
    end;
  end;
FormLocate.Free;
end;

procedure TFZSp_VidOpl.GridVidOplOptionsView1DblClick(Sender: TObject);
var Key:variant;
  Form: TFZVidOplPropUse;
  p:integer;
begin
{  p:=0;}
if (GridVidOplView1.Controller.FocusedRecord=nil) or
   (GridVidOplView1.Controller.FocusedRecord.Expandable) then exit;
  begin
    Key:=VarArrayCreate([0,1],varVariant);
    Key[0]:=GridVidOplOptionsView1.Controller.FocusedRecord.Values[GridColumnOptionsIdProp.Index];
    Key[1]:=GridVidOplOptionsView1.Controller.FocusedRecord.Values[GridColumnOptionsIdPropGroup.Index];

{    Form:=TFZVidOplPropUse.Create(self,DM.DB.Handle,DM.DSetNar1['ID_VIDOPL'],Key[0]);
    Form.ShowModal;

  try
    DM.StProc.Transaction.StartTransaction;
    DM.StProc.SQL.Text:='EXECUTE PROCEDURE Z_VIDOPL_PROPERTIES_CURRENT_USE('+
     VarToStr(DM.DSetNar1['ID_VIDOPL'])+','+VarToStr(Key[0])+')';
    DM.StProc.ExecQuery;
    p:=DM.StProc.ParamByName('IN_USE').AsInteger;
    DM.StProc.Transaction.Commit;
    DM.DSetNar2.CloseOpen(True);
    GridVidOplOptionsView1.DataController.LocateByKey(Key);
  except
   on E:Exception do
    begin
      ZShowMessage(Error_caption[PLanguageIndex],e.Message,mtError,[mbOK]);
     DM.StProc.Transaction.Rollback;
    end;
  end;
}
  try
    DM.StProc.Transaction.StartTransaction;
    DM.StProc.SQL.Text:='EXECUTE PROCEDURE Z_VIDOPL_PROPERTIES_UPDATE('+
     VarToStr(DM.DSetNar1['ID_VIDOPL'])+','+VarToStr(Key[0])+','+IfThen(GridColumnOptionsUse.EditValue,'1','0'){IntToStr(p)}+')';
    DM.StProc.ExecQuery;
    DM.StProc.Transaction.Commit;
    DM.DSetNar2.CloseOpen(True);
    GridVidOplOptionsView1.DataController.LocateByKey(Key);
  except
   on E:Exception do
    begin
      ZShowMessage(Error_caption[PLanguageIndex],e.Message,mtError,[mbOK]);
     DM.StProc.Transaction.Rollback;
    end;
  end;
  end;
end;

procedure TFZSp_VidOpl.PropertiesBtnClick(Sender: TObject);
var Id:integer;
    DSet:TpFIBDataSet;
begin

   if PageControl.ActivePage=TabSheetNarchisl then DSet := DM.DSetNar1;
   if PageControl.ActivePage=TabSheetUder then DSet := DM.DSetUD1;
   if PageControl.ActivePage=TabSheetCorespond then DSet := DM.DSetCor1;
   if PageControl.ActivePage=TabSheetConstsVo then DSet := DM.DSetConsts1;

   if not VarIsNull(DSet['ID_VIDOPL']) then
     GlobalSpr.GetPropByObj(self,DM.DB.Handle,DSet['ID_VIDOPL'],Date,ptVidOpl);

end;

procedure TFZSp_VidOpl.GridVidOplView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (GridVidOplView1.OptionsBehavior.IncSearchItem <> GridColumnVidOplKod)then
    begin
     GridVidOplView1.Controller.IncSearchingText   := '';
     GridVidOplView1.OptionsBehavior.IncSearchItem := GridColumnVidOplKod;
    end
  end
 else
  if (GridVidOplView1.OptionsBehavior.IncSearchItem <> GridColumnVidOplName)then
   begin
    GridVidOplView1.Controller.IncSearchingText   := '';
    GridVidOplView1.OptionsBehavior.IncSearchItem := GridColumnVidOplName;
   end;
end;

procedure TFZSp_VidOpl.UDGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (UDGrid1DBTableView1.OptionsBehavior.IncSearchItem <> UdGr1ClVOKod)then
    begin
     UDGrid1DBTableView1.Controller.IncSearchingText   := '';
     UDGrid1DBTableView1.OptionsBehavior.IncSearchItem := UdGr1ClVOKod;
    end
  end
 else
  if (UDGrid1DBTableView1.OptionsBehavior.IncSearchItem <> UdGr1ClVOName)then
   begin
    UDGrid1DBTableView1.Controller.IncSearchingText   := '';
    UDGrid1DBTableView1.OptionsBehavior.IncSearchItem := UdGr1ClVOName;
   end;
end;

procedure TFZSp_VidOpl.FormCreate(Sender: TObject);
begin
InsertBtn.Enabled:=True;
UpdateBtn.Enabled:=False;
end;

procedure TFZSp_VidOpl.SpravTypeVidOplBtnClick(Sender: TObject);
begin
  LoadVOplType(self,DM.DB.Handle,zfsChild);
end;

end.


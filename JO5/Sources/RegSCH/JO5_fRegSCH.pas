unit JO5_fRegSCH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, dxBar,
  dxBarExtItems, cxInplaceContainer, cxDBTL, cxControls, cxTLData, JO5_dmCommonStyles,
  IBase, JO5_dmRegSCH, Jo5_Types, Jo5_Consts, Jo5_Proc, Jo5_PackageLoad,
  ExtCtrls, cxSplitter, cxContainer, cxEdit, cxCheckBox, cxDBEdit, Jo5_Classes,
  Menus, ActnList;

type
  TfRegSCH = class(TForm)
    SchetTreeList: TcxDBTreeList;
    cmnID_SCH: TcxDBTreeListColumn;
    cmnID_PARENT_SCH: TcxDBTreeListColumn;
    cmnSCH_NUMBER: TcxDBTreeListColumn;
    cmnSCH_TITLE: TcxDBTreeListColumn;
    cmnKR_SUMMA: TcxDBTreeListColumn;
    cmnDB_SUMMA: TcxDBTreeListColumn;
    cmnKR_SALDO_CUR: TcxDBTreeListColumn;
    cmnDB_SALDO_CUR: TcxDBTreeListColumn;
    cmnDB_SALDO_INPUT: TcxDBTreeListColumn;
    cmnKR_SALDO_INPUT: TcxDBTreeListColumn;
    cmnHAS_CHILDREN: TcxDBTreeListColumn;
    BarManager: TdxBarManager;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDelete: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    PrintBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    MonthCombo: TdxBarCombo;
    RegUchComboBox: TdxBarCombo;
    CloseSchBtn: TdxBarLargeButton;
    OpenSchBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    YearSpinEdit: TdxBarSpinEdit;
    FilterDockControl: TdxBarDockControl;
    dxBarButton1: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    dxBarButton2: TdxBarButton;
    cxSplitter1: TcxSplitter;
    DetailPnl: TPanel;
    IsNotOpenCheckBox: TcxDBCheckBox;
    IsLockedCheckBox: TcxDBCheckBox;
    PopupMenu1: TPopupMenu;
    ActionList1: TActionList;
    A_ExpandAll: TAction;
    A_CloseAll: TAction;
    AExpandAll1: TMenuItem;
    ACloseAll1: TMenuItem;
    FilterBtn: TdxBarButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitBtnClick(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure DetailBtnClick(Sender: TObject);
    procedure A_ExpandAllExecute(Sender: TObject);
    procedure A_CloseAllExecute(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure DoSomeThing(WhatToDo:Integer);
    procedure OpenSchBtnClick(Sender: TObject);
    procedure CloseSchBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
  private
    { Private declarations }
    PStylesDM: TStylesDM;
    DM: TdmRegSCH;
    PLanguageIndex:byte;
    SysInfo:TJo5SysInfo;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE;IN_SysInfo:TJo5SysInfo); reintroduce;
  end;

function View_Jo5_RegSch(AOwner:TComponent;AHandle:TISC_DB_HANDLE;IN_SysInfo:TJo5SysInfo):Variant; stdcall;
 exports View_Jo5_RegSch;

implementation

{$R *.dfm}

uses Dates, ZWait;

function View_Jo5_RegSch(AOwner:TComponent;AHandle:TISC_DB_HANDLE;IN_SysInfo:TJo5SysInfo):Variant;
var ViewForm: TfRegSCH;
begin
 if not MDIFormExists('TfRegSCH') then
  ViewForm:=TfRegSCH.Create(AOwner,AHandle,IN_SysInfo);
end;

constructor TfRegSCH.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE;IN_SysInfo:TJo5SysInfo);
begin
  inherited Create(AOwner);
  PLanguageIndex:=IndexLanguage;
  SysInfo:=IN_SysInfo;
//******************************************************************************
  PStylesDM:=TStylesDM.Create(Self);
  SchetTreeList.Styles.StyleSheet:=PStylesDM.TreeListBandedStyleSheetDevExpress;
//******************************************************************************
  DM:=TdmRegSCH.Create(Application,AHandle,IN_SysInfo);
  SchetTreeList.DataController.DataSource:=DM.DSource1;
  IsNotOpenCheckBox.DataBinding.DataSource:=DM.DSource1;
  IsLockedCheckBox.DataBinding.DataSource:=DM.DSource1;
//******************************************************************************
  Caption:=RegSch_Caption[PLanguageIndex];
  DetailBtn.Caption  := DetailBtn_Caption[PLanguageIndex];
  FilterBtn.Caption  := FilterBtn_Caption[PLanguageIndex];
  PrintBtn.Caption   := PrintBtn_Caption[PLanguageIndex];
  RefreshBtn.Caption := RefreshBtn_Caption[PLanguageIndex];
  OpenSchBtn.Caption := OpenSchBtn_Caption[PLanguageIndex];
  CloseSchBtn.Caption:= CloseSchBtn_Caption[PLanguageIndex];
  SelectBtn.Caption  := SelectBtn_Caption[PLanguageIndex];
  ExitBtn.Caption    := ExitBtn_Caption[PLanguageIndex];
//******************************************************************************
  DetailBtn.Hint  := DetailBtn_Caption[PLanguageIndex];
  FilterBtn.Hint  := FilterBtn_Caption[PLanguageIndex];
  PrintBtn.Hint   := PrintBtn_Caption[PLanguageIndex];
  RefreshBtn.Hint := RefreshBtn_Caption[PLanguageIndex];
  OpenSchBtn.Hint := OpenSchBtn_Hint[PLanguageIndex];
  CloseSchBtn.Hint:= CloseSchBtn_Hint[PLanguageIndex];
  SelectBtn.Hint  := SelectAnalizeBtn_Hint[PLanguageIndex];
  ExitBtn.Hint    := ExitBtn_Caption[PLanguageIndex];
//******************************************************************************
  MonthCombo.Caption     := LabelFilterPeriod_Caption[PLanguageIndex];
  RegUchComboBox.Caption := LabelRegUch_Caption[PLanguageIndex];
  MonthCombo.Hint        := LabelMonth_Caption[PLanguageIndex];
  YearSpinEdit.Hint      := LabelYear_Caption[PLanguageIndex];
  RegUchComboBox.Hint    := LabelCurrentRegUch_Caption[PLanguageIndex];
//******************************************************************************
  MonthCombo.Items.Text := MonthesList_Text[PLanguageIndex];
  MonthCombo.ItemIndex := YearMonthFromKodSetup(DM.SysInfo.KodSetup,False)-1;
  YearSpinEdit.Value := YearMonthFromKodSetup(DM.SysInfo.KodSetup);
//******************************************************************************
  cmnSCH_NUMBER.Caption.Text     := GridClNum_Caption[PLanguageIndex];
  cmnSCH_TITLE.Caption.Text      := GridClName_Caption[PLanguageIndex];
  cmnKR_SUMMA.Caption.Text       := GridClKredit_Caption[PLanguageIndex];
  cmnDB_SUMMA.Caption.Text       := GridClDebet_Caption[PLanguageIndex];
  cmnKR_SALDO_CUR.Caption.Text   := GridClKredit_Caption[PLanguageIndex];
  cmnDB_SALDO_CUR.Caption.Text   := GridClDebet_Caption[PLanguageIndex];
  cmnKR_SALDO_INPUT.Caption.Text := GridClKredit_Caption[PLanguageIndex];
  cmnDB_SALDO_INPUT.Caption.Text := GridClDebet_Caption[PLanguageIndex];
//******************************************************************************
  SchetTreeList.Bands[0].Caption.Text := GridClRekvizitSch_Caption[PLanguageIndex];
  SchetTreeList.Bands[1].Caption.Text := GridClBegSaldo_Caption[PLanguageIndex];
  SchetTreeList.Bands[2].Caption.Text := GridClOborots_Caption[PLanguageIndex];
  SchetTreeList.Bands[3].Caption.Text := GridClEndSaldo_Caption[PLanguageIndex];
//******************************************************************************
  A_ExpandAll.Caption:=LabelExpandAll_Caption[PLanguageIndex];
  A_CloseAll.Caption :=LabelCloseAll_Caption[PLanguageIndex];
//******************************************************************************
  IsNotOpenCheckBox.Properties.Caption := LabelIsNotOpenSch_Caption[PLanguageIndex];
  IsLockedCheckBox.Properties.Caption  := LabelIsLockedSch_Caption[PLanguageIndex];
//******************************************************************************
  RefreshBtnClick(Self);


  RegUchComboBox.ItemIndex:=0;
end;
procedure TfRegSCH.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  DisableServiceMenu;
  DM.Free;
  Action:=caFree;
end;

procedure TfRegSCH.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TfRegSCH.FilterBtnClick(Sender: TObject);
begin
  DoSomeThing(1);
end;

procedure TfRegSCH.RefreshBtnClick(Sender: TObject);
begin
  DoSomeThing(2);
end;

procedure TfRegSCH.DetailBtnClick(Sender: TObject);
begin
  LoadKorToSch(Application,DM.DB.Handle,DM.GetKorParam, SysInfo);
end;

procedure TfRegSCH.A_ExpandAllExecute(Sender: TObject);
begin
  SchetTreeList.FullExpand;
end;

procedure TfRegSCH.A_CloseAllExecute(Sender: TObject);
begin
  SchetTreeList.FullCollapse;
end;

procedure TfRegSCH.PrintBtnClick(Sender: TObject);
begin
  DoSomeThing(3);
end;

procedure TfRegSCH.DoSomeThing(WhatToDo:Integer);
var
  Cast:TJo5RegTreeCast;
  pNodes:TcxTreeListNodes;
  pSelectedNum:Integer;
//***********************//
  FilterKodSetup:Integer;
  FilterDate:TDate;
//**********************//
  wf:TForm;
begin
  wf:=ShowWaitForm(Self);
  pSelectedNum:=-1;
  Cast:=TJo5RegTreeCast.Create;
  pNodes:=SchetTreeList.Nodes;
  Cast.GetCast(pNodes,cmnID_SCH);
//******************************************************************************
  case WhatToDo of
    1:begin //FILTER
        FilterKodSetup:= PeriodToKodSetup(YearSpinEdit.IntValue,MonthCombo.ItemIndex+1);
        FilterDate:=ConvertKodToDate(FilterKodSetup);
        DM.Filter(FilterKodSetup,FilterDate,RegUchComboBox.Items,RegUchComboBox.ItemIndex,2, SysInfo.id_system);
      end;
    2:begin //REFRESH
        DM.Refresh(SysInfo.id_system);
        FilterKodSetup:= PeriodToKodSetup(YearSpinEdit.IntValue,MonthCombo.ItemIndex+1);
        FilterDate:=ConvertKodToDate(FilterKodSetup);
        RegUchComboBox.ItemIndex:=DM.ReturnRegUch(RegUchComboBox.Items,FilterDate);
      end;
    3:begin //PRINT
        DM.DoPrint;
      end;
  end;
//******************************************************************************
  Cast.UseCastOnTree(cmnID_SCH,pNodes,pSelectedNum);
  SchetTreeList.Nodes:=pNodes;
  DM.SelectSch(pSelectedNum);
  Cast.Free;
  CloseWaitForm(wf);
end;

procedure TfRegSCH.OpenSchBtnClick(Sender: TObject);
begin
  DM.OpenSch;
end;

procedure TfRegSCH.CloseSchBtnClick(Sender: TObject);
begin
  DM.CloseSch;
end;

procedure TfRegSCH.SelectBtnClick(Sender: TObject);
begin
  LoadSaldoBySmRzSt(Self,DM.DB.Handle,DM.GetCurrIDSch,DM.GetCurrSelDate);
end;

end.

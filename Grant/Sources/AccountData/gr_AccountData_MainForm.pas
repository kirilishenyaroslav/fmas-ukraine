unit gr_AccountData_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, dxBar, dxBarExtItems,
  cxSplitter, cxLabel, cxContainer, cxTextEdit, cxMaskEdit, cxDBEdit,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxDockPanel, dxDockControl, cxMemo, ZcxLocateBar,
  FIBQuery, pFIBQuery, Dates, ZTypes,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  cxCheckListBox, cxGridBandedTableView, cxGridDBBandedTableView,
  dxStatusBar, ActnList,
  gr_uCommonLoader, gr_uCommonConsts, gr_uMessage, gr_uCommonProc, gr_dmCommonStyles,
  gr_uWaitForm;

type TgrTypeDataFilter = (tdfPeople,tdfDepartment,tdfVidOpl,tdfNULL);

type
  TFgrAccountData = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    DSource3: TDataSource;
    DSource1: TDataSource;
    DataBase: TpFIBDatabase;
    DSet3: TpFIBDataSet;
    DSet1: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    dxBarDockControl2: TdxBarDockControl;
    FilterBtn: TdxBarLargeButton;
    PrintBtn: TdxBarLargeButton;
    PanelGrid3: TPanel;
    Grid3: TcxGrid;
    Grid3DBBandedTableView1: TcxGridDBBandedTableView;
    Grid3ClVo: TcxGridDBBandedColumn;
    Grid3ClVidOpl: TcxGridDBBandedColumn;
    Grid3ClSumma: TcxGridDBBandedColumn;
    Grid3ClP1: TcxGridDBBandedColumn;
    Grid3ClDepartment: TcxGridDBBandedColumn;
    Grid3ClSmeta: TcxGridDBBandedColumn;
    Grid3ClKodSetup3: TcxGridDBBandedColumn;
    Grid3ClReCount: TcxGridDBBandedColumn;
    Grid3ClNDay: TcxGridDBBandedColumn;
    Grid3Level1: TcxGridLevel;
    PanelGrid3DopData: TPanel;
    DBMaskEditDepartment: TcxDBMaskEdit;
    DBMaskEditSmeta: TcxDBMaskEdit;
    LabelDepartment: TcxLabel;
    LabelSmeta: TcxLabel;
    cxSplitter1: TcxSplitter;
    PanelGrids1and2: TPanel;
    SplitterGrids1And2: TSplitter;
    Grid2View1: TcxGridDBTableView;
    Grid2Level1: TcxGridLevel;
    Grid2: TcxGrid;
    cxSplitter2: TcxSplitter;
    Grid1: TcxGrid;
    Grid1View1: TcxGridDBTableView;
    Grid1ClTin: TcxGridDBColumn;
    Grid1ClFIO: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    Grid2ClKodSetup: TcxGridDBColumn;
    Grid2ClDateAcc: TcxGridDBColumn;
    Grid2ClTypeAcc: TcxGridDBColumn;
    DSet2: TpFIBDataSet;
    DSource2: TDataSource;
    dxStatusBar1: TdxStatusBar;
    BarDockLocate: TdxBarDockControl;
    ActionList: TActionList;
    ActionSystem: TAction;
    PersonBtn: TdxBarLargeButton;
    VObtn: TdxBarLargeButton;
    DepartmentBtn: TdxBarLargeButton;
    NotFilterBtn: TdxBarLargeButton;
    EditData: TdxBarEdit;
    MonthList1: TdxBarCombo;
    YearSpin1: TdxBarSpinEdit;
    dxBarStatic1: TdxBarStatic;
    MonthList2: TdxBarCombo;
    YearSpin2: TdxBarSpinEdit;
    BtnPrintAll: TdxBarLargeButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FilterBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Grid3ClP1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure PrintBtnClick(Sender: TObject);
    procedure Grid3ClKodSetup3GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Grid3ClNDayGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Grid3ClClockGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure Grid2ClKodSetupGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure Grid1View1KeyPress(Sender: TObject; var Key: Char);
    procedure DSet3AfterOpen(DataSet: TDataSet);
    procedure Grid3DBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure RefreshBtnClick(Sender: TObject);
    procedure dxStatusBar1Resize(Sender: TObject);
    procedure PanelGrid3DopDataResize(Sender: TObject);
    procedure ActionSystemExecute(Sender: TObject);
    procedure PersonBtnClick(Sender: TObject);
    procedure NeedFilterBtnDown(Sender:TObject);
    procedure VObtnClick(Sender: TObject);
    procedure DepartmentBtnClick(Sender: TObject);
    procedure NotFilterBtnClick(Sender: TObject);
    procedure Grid2View1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure BtnPrintAllClick(Sender: TObject);
  private
    PMode:boolean;
    PLanguageIndex:byte;
    PBarLocate:TZBarLocate;
    PdmStyles:TStylesDM;
    pCurrentFilterBtnIndex:byte;
    pIdFilter:integer;
    pTypeDataFilter:TgrTypeDataFilter;

    KOD_SETUP1:String;
    KOD_SETUP2:String;
    id:String;
    ID_TYPE:String;
    PAYMENT_TYPE:String;
  public
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE;APriznak:boolean);reintroduce;
    property Mode:boolean read PMode;
  end;

function View_grAccountData(AParameter:TObject):Variant; stdcall;
 exports View_grAccountData;


implementation

uses StrUtils, Math;

{$R *.dfm}
const PPayment_Type=11;

function TypeDataFilterToByte(AParameter:TgrTypeDataFilter):Byte;
begin
 Result:=0;
 case AParameter of
  tdfPeople: Result:=1;
  tdfDepartment: Result:=2;
  tdfNULL: Result:=3;
  tdfVidOpl: Result:=4;
 end;
end;

function View_grAccountData(AParameter:TObject):Variant;
var ViewForm: TFgrAccountData;
    i:integer;
begin
result:=False;
for i:=Application.MainForm.MDIChildCount-1 downto 0 do
 if (Application.MainForm.MDIChildren[i].ClassType = TFgrAccountData) then
  if (Application.MainForm.MDIChildren[i] as TFgrAccountData).Mode=TgrBooleanParam(AParameter).Priznak
   then
    begin
     Application.MainForm.MDIChildren[i].BringToFront;
     Result:=True;
     break;
    end;
if Result=False then
 begin
      ViewForm  :=  TFgrAccountData.Create(TgrBooleanParam(AParameter).Owner,
                                           TgrBooleanParam(AParameter).DB_Handle,
                                           TgrBooleanParam(AParameter).Priznak);
 end;
Result:=NULL;
end;

constructor TFgrAccountData.Create(AOwner : TComponent;DB:TISC_DB_HANDLE;APriznak:boolean);
var pCurrKodSetup:integer;
    i:integer;
begin
Inherited Create(AOwner);
//******************************************************************************
 PLanguageIndex:=IndexLanguage;
 Caption := IfThen(APriznak,LastPeriodData_Text[PLanguageIndex],ViewAccData_Text[PLanguageIndex]);
 RefreshBtn.Caption := RefreshBtn_Caption[PLanguageIndex];
 PrintBtn.Caption := PrintBtn_Caption[PLanguageIndex];
 FilterBtn.Caption := FilterBtn_Caption[PLanguageIndex];
 ExitBtn.Caption := ExitBtn_Caption[PLanguageIndex];
 PersonBtn.Caption := LabelStudent_Caption[PLanguageIndex];
 DepartmentBtn.Caption := LabelDepartment_Caption[PLanguageIndex];
 VObtn.Caption := LabelVidOpl_Caption[PLanguageIndex];
 NotFilterBtn.Caption := NotFilter_Text[PLanguageIndex];
 MonthList1.Caption := LabelMonth_Caption[PLanguageIndex];
 YearSpin1.Caption :=  LabelYear_Caption[PLanguageIndex];
 MonthList2.Caption := LabelMonth_Caption[PLanguageIndex];
 YearSpin2.Caption :=  LabelYear_Caption[PLanguageIndex];
 EditData.Caption := '';
//******************************************************************************
 MonthList1.Items.Text := MonthesList_Text[PLanguageIndex];
 MonthList2.Items.Text := MonthesList_Text[PLanguageIndex];
 pCurrKodSetup         := grKodSetup(DB);
 MonthList1.ItemIndex  := YearMonthFromKodSetup(pCurrKodSetup,False)-1;
 MonthList2.ItemIndex  := YearMonthFromKodSetup(pCurrKodSetup,False)-1;
 YearSpin1.Value       := YearMonthFromKodSetup(pCurrKodSetup);
 YearSpin2.Value       := YearMonthFromKodSetup(pCurrKodSetup);
//******************************************************************************
 Grid1ClTin.Caption := GridClTin_Caption[PLanguageIndex];
 Grid1ClFIO.Caption := GridClFIO_Caption[PLanguageIndex];
//******************************************************************************
 Grid2ClKodSetup.Caption := GridClKodSetup_Caption[PLanguageIndex];
 Grid2ClDateAcc.Caption := GridClDate_Caption[PLanguageIndex];
 Grid2ClTypeAcc.Caption := GridClTypeCount_Caption[PLanguageIndex];
//******************************************************************************
 Grid3ClVo.Caption := GridClKodVo_Caption[PLanguageIndex];
 Grid3ClVidOpl.Caption := GridClNameVo_Caption[PLanguageIndex];
 Grid3ClSumma.Caption := GridClSumma_Caption[PLanguageIndex];
 Grid3ClP1.Caption := GridClP1_Caption[PLanguageIndex];
 Grid3ClDepartment.Caption := GridClKodDepartment_Caption[PLanguageIndex];
 Grid3ClSmeta.Caption := GridClKodSmeta_Caption[PLanguageIndex];
 Grid3ClKodSetup3.Caption := GridClKodSetup_Caption[PLanguageIndex];
 Grid3ClReCount.Caption := '';
 Grid3ClNDay.Caption := GridClNday_Caption[PLanguageIndex];
//******************************************************************************
 LabelDepartment.Caption := LabelDepartment_Caption[PLanguageIndex];
 LabelSmeta.Caption := LabelSmeta_Caption[PLanguageIndex];
//******************************************************************************
 pCurrentFilterBtnIndex:=0;
 PMode:=APriznak;
//******************************************************************************
 Grid1View1.DataController.Summary.FooterSummaryItems[0].Format := Summary_Text[PLanguageIndex]+': 0';
 Grid3DBBandedTableView1.DataController.Summary.FooterSummaryItems[1].Format := Summary_Text[PLanguageIndex]+':';
//******************************************************************************
 PBarLocate:=TZBarLocate.Create(BarManager);

 PBarLocate.DataSet := DSet1;
 PBarLocate.BorderStyle := bbsNone;
 PBarLocate.AddLocateItem('TIN',
                           Grid1ClTin.Caption,
                           [loCaseInsensitive]);
 PBarLocate.AddLocateItem('FIO',
                           Grid1ClFIO.Caption,
                           [loCaseInsensitive,loPartialKey]);
 PBarLocate.DigitalField := 'TN';
 PBarLocate.DockControl  := BarDockLocate;
//******************************************************************************
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
 dxStatusBar1.Panels[0].Text:= RefreshBtn.Caption+' (F5)';
 dxStatusBar1.Panels[1].Text:= PBarLocate.LocateBtn.Caption+' (F7)';
 dxStatusBar1.Panels[2].Text:= PBarLocate.LocateNextBtn.Caption+' (Ctrl+F7)';
 dxStatusBar1.Panels[3].Text:= FilterBtn.Caption+' (F8)';
 dxStatusBar1.Panels[4].Text:= PrintBtn.Caption+' (Ctrl+F5)';
 dxStatusBar1.Panels[5].Text:= ExitBtn.Caption+' (Esc)';
//******************************************************************************
 DataBase.Handle                              := DB;
 ReadTransaction.StartTransaction;
 DSet1.SQLs.SelectSQL.Text := '';
 DSet2.SQLs.SelectSQL.Text := '';
 DSet3.SQLs.SelectSQL.Text := '';
//******************************************************************************
 SetOptionsBarManager(BarManager);
 SetOptionsGridView(Grid1View1);
 SetOptionsGridView(Grid2View1);
 SetOptionsGridView(Grid3DBBandedTableView1);
 dxBarDockControl2.SunkenBorder := True;
 PdmStyles := TStylesDM.Create(Self);
 Grid1View1.Styles.StyleSheet := PdmStyles.GridTableViewStyleSheetDevExpress;
 Grid2View1.Styles.StyleSheet := PdmStyles.GridTableViewStyleSheetDevExpress;
 Grid3DBBandedTableView1.Styles.StyleSheet := PdmStyles.GridBandedTableViewStyleSheetDevExpress;
 Grid1View1.OptionsView.Footer := True;
 Grid3DBBandedTableView1.OptionsView.Footer := True;
//******************************************************************************
 PanelGrid3DopData.Color := Grid3DBBandedTableView1.Styles.Background.Color;
 cxSplitter1.Color := Grid3DBBandedTableView1.Styles.Header.Color;
//******************************************************************************

end;

procedure TFgrAccountData.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFgrAccountData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFgrAccountData.FilterBtnClick(Sender: TObject);
var wf:TForm;
    TypeId:byte;
begin
     wf:=ShowWaitForm(self,wfSelectData);
     try
      DSet3.Close;
      DSet2.Close;
      DSet1.Close;


      TypeId:=IfThen(PMode,0,2);
      DSet3.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACCOUNT_ACC_S(?ID_GROUP_ACCOUNT,?ID_MAN,?KOD_SETUP_2,'
                                                                 +IntToStr(TypeId)+') order by Kod_vidopl';
      TypeId:=IfThen(PMode,0,1)+TypeDataFilterToByte(pTypeDataFilter)*2;
      
      KOD_SETUP1:=IntToStr(PeriodToKodSetup(YearSpin1.IntValue,MonthList1.ItemIndex+1)) ;
      KOD_SETUP2:=IntToStr(PeriodToKodSetup(YearSpin2.IntValue,MonthList2.ItemIndex+1)) ;
      ID:=IntToStr(pIdFilter);
      ID_TYPE:= IntToStr(TypeId);
      PAYMENT_TYPE:=IntToStr(PPayment_Type);
      DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACC_PEOPLE_LIST('+IntToStr(PeriodToKodSetup(YearSpin1.IntValue,MonthList1.ItemIndex+1))+','
                                                                   +IntToStr(PeriodToKodSetup(YearSpin2.IntValue,MonthList2.ItemIndex+1))+','
                                                                   +IntToStr(pIdFilter)+','
                                                                   +IntToStr(TypeId)+','
                                                                   +IntToStr(PPayment_Type)+') order by tn';

                                                                   //      ShowMessage(DSet1.SQLs.SelectSQL.Text);
      DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACC_PEOPLE_LIST_ACCS(?ID_MAN,'
                                                                   +IntToStr(PeriodToKodSetup(YearSpin1.IntValue,MonthList1.ItemIndex+1))+','
                                                                   +IntToStr(PeriodToKodSetup(YearSpin2.IntValue,MonthList2.ItemIndex+1))+','
                                                                   +IntToStr(pIdFilter)+','
                                                                   +IntToStr(TypeId)+','
                                                                   +IntToStr(PPayment_Type)+') order by KOD_SETUP_2,DATE_ACC descending';

      DSet1.Open;
      DSet2.Open;
      DSet3.Open;
     finally
      CloseWaitForm(wf);
     end;
end;

procedure TFgrAccountData.FormCreate(Sender: TObject);
begin
Grid3DBBandedTableView1.DataController.Summary.FooterSummaryItems[1].Format := Summary_Text[PLanguageIndex];
end;

procedure TFgrAccountData.Grid3ClP1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
 if AText='False' then
    AText:=GridClP1_Ud_Text[PLanguageIndex];
 if AText='True' then
    AText:=GridClP1_Nar_Text[PLanguageIndex];
end;

procedure TFgrAccountData.PrintBtnClick(Sender: TObject);
var grParam:TgrAccListParam;
begin
   grParam:=TgrAccListParam.Create;
   grParam.DB_Handle := DataBase.Handle;
   grParam.Owner := self;
   grParam.Id_Man:=DSet2['ID_MAN'];
   grParam.IdGroupAccount:=DSet2['ID_GROUP_ACCOUNT'];
   grParam.KodSetup2:=DSet2['KOD_SETUP_2'];
   grParam.TypeTable:=IfThen(PMode,0,1);
   DoFunctionFromPackage(grParam,Stud_AccList_Pack);
   grParam.Destroy;
end;

procedure TFgrAccountData.Grid3ClKodSetup3GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
Atext:=KodSetupToPeriod(StrToInt(Atext),1);
end;

procedure TFgrAccountData.Grid3ClNDayGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText='' then Exit;
if StrToInt(AText)=0 then AText:='';
end;

procedure TFgrAccountData.Grid3ClClockGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText='' then Exit;
if StrToFloat(AText)=0 then AText:='';
end;

procedure TFgrAccountData.Grid2ClKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
Atext:=KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFgrAccountData.Grid1View1KeyPress(Sender: TObject; var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (Grid1View1.OptionsBehavior.IncSearchItem <> Grid1ClTin)then
    begin
     Grid1View1.Controller.IncSearchingText   := '';
     Grid1View1.OptionsBehavior.IncSearchItem := Grid1ClTin;
    end
  end
 else
  if (Grid1View1.OptionsBehavior.IncSearchItem <> Grid1ClFIO)then
   begin
    Grid1View1.Controller.IncSearchingText   := '';
    Grid1View1.OptionsBehavior.IncSearchItem := Grid1ClFIO;
   end;
end;

procedure TFgrAccountData.DSet3AfterOpen(DataSet: TDataSet);
begin
Grid3DBBandedTableView1.ViewData.Expand(False);
end;

procedure TFgrAccountData.Grid3DBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
var AItem: TcxGridTableSummaryItem;
begin
  AItem := TcxGridTableSummaryItem(Arguments.SummaryItem);
  if (AItem.Column = Grid3ClSumma) and
     (AItem.Kind = skSum) and (AItem.Position = spFooter) then
  begin
   if (VarToStr(Grid3DBBandedTableView1.DataController.Values[Arguments.RecordIndex, Grid3ClP1.Index]) ='F')
      then OutArguments.Value:=-OutArguments.Value;
  end;
end;

procedure TFgrAccountData.RefreshBtnClick(Sender: TObject);
var wf:TForm;
begin
wf:=ShowWaitForm(self,wfSelectData);
if DSet3.Active then DSet3.Close;
if DSet2.Active then DSet2.Close;
if DSet1.Active then DSet1.Close;
if Trim(DSet1.SQLs.SelectSQL.Text)<>'' then DSet1.Open;
if Trim(DSet2.SQLs.SelectSQL.Text)<>'' then DSet2.Open;
if Trim(DSet3.SQLs.SelectSQL.Text)<>'' then DSet3.Open;
CloseWaitForm(wf);
end;

procedure TFgrAccountData.dxStatusBar1Resize(Sender: TObject);
var i:byte;
begin
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
end;

procedure TFgrAccountData.PanelGrid3DopDataResize(Sender: TObject);
begin
DBMaskEditDepartment.Width:=PanelGrid3DopData.Width-61;
DBMaskEditSmeta.Width:=PanelGrid3DopData.Width-61;
end;

procedure TFgrAccountData.ActionSystemExecute(Sender: TObject);
begin
grShowMessage('System Data','ID_MAN = '+VarToStrDef(DSet2['ID_MAN'],'NULL')+#13+
                           'ID_GROUP_ACCOUNT = '+VarToStrDef(DSet2['ID_GROUP_ACCOUNT'],'NULL')+#13+
                           'KOD_SETUP_2 = '+VarToStrDef(DSet2['KOD_SETUP_2'],'NULL'),mtInformation,[mbOk]);
end;

procedure TFgrAccountData.PersonBtnClick(Sender: TObject);
var Man:variant;
begin
  Man:=ShowSpPeople(Self,DataBase.Handle);
  if VarArrayDimCount(Man)>0 then
   begin
     EditData.Text := ifThen(varIsNull(Man[4]),'',VarToStr(Man[4])+' - ')+
                             VarToStr(Man[1])+' '+VarToStr(Man[2])+' '+VarToStr(Man[3]);
     pTypeDataFilter := tdfPeople;
     pIdFilter := Man[0];
     EditData.Caption := PersonBtn.Caption;
     EditData.ShowCaption := True;
   end
  else NeedFilterBtnDown(Sender);
end;

procedure TFgrAccountData.NeedFilterBtnDown(Sender:TObject);
begin
 case pTypeDataFilter of
  tdfPeople: PersonBtn.Down := True;
  tdfDepartment: DepartmentBtn.Down := True;
  tdfVidOpl: VObtn.Down := True;
  tdfNULL: NotFilterBtn.Down := True;
 end;
end;

procedure TFgrAccountData.VObtnClick(Sender: TObject);
var VidOpl:variant;
begin
  VidOpl:=ShowSpVidOpl(Self,DataBase.Handle);
  if VarArrayDimCount(VidOpl)>0 then
   begin
     EditData.Text := ifThen(varIsNull(VidOpl[2]),'',VarToStr(VidOpl[2])+' - ')+
                             VarToStr(VidOpl[1]);
     pTypeDataFilter := tdfVidOpl;
     pIdFilter := VidOpl[0];
     EditData.Caption := VObtn.Caption;
     EditData.ShowCaption := True;
   end
  else
   NeedFilterBtnDown(Sender);
end;

procedure TFgrAccountData.DepartmentBtnClick(Sender: TObject);
var Department:variant;
begin
  Department:=ShowSpDepartment(DataBase.Handle);
  if VarArrayDimCount(Department)>0 then
   begin
     EditData.Text := ifThen(varIsNull(Department[1]),'',VarToStr(Department[1])+' - ')+
                              VarToStr(Department[3]);
     pTypeDataFilter := tdfDepartment;
     pIdFilter := Department[0];
     EditData.Caption := DepartmentBtn.Caption;
     EditData.ShowCaption := True;
   end
  else
   NeedFilterBtnDown(Sender);
end;

procedure TFgrAccountData.NotFilterBtnClick(Sender: TObject);
begin
pTypeDataFilter := tdfNULL;
EditData.Text := '';
pIdFilter := 0;
EditData.ShowCaption := False;
EditData.Caption := NotFilterBtn.Caption;
end;

procedure TFgrAccountData.Grid2View1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
PrintBtn.Enabled := not((AFocusedRecord=nil) or (AFocusedRecord.Expandable));
BtnPrintAll.Enabled := not((AFocusedRecord=nil) or (AFocusedRecord.Expandable));
end;

procedure TFgrAccountData.BtnPrintAllClick(Sender: TObject);
var grParam:TgrAccListParam;
begin
  grParam:=TgrAccListParam.Create;
  grParam.DB_Handle := DataBase.Handle;
  grParam.Owner := self;
  grParam.Id_Man:=0;
  grParam.IdGroupAccount:=0;//DSet2['ID_GROUP_ACCOUNT'];
  grParam.KodSetup2:=DSet2['KOD_SETUP_2'];
  grParam.TypeTable:=2;
  grParam.KOD_SETUP1:=KOD_SETUP1;
  grParam.KOD_SETUP2:=KOD_SETUP2;
  grParam.id:=id;
  grParam.ID_TYPE:=ID_TYPE;
  grParam.PAYMENT_TYPE:=PAYMENT_TYPE;
  DoFunctionFromPackage(grParam,Stud_AccList_Pack);
  grParam.Destroy;
end;

end.

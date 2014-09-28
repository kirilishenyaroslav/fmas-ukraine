unit DatesAcc2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, dxBar, dxBarExtItems,
  cxSplitter, cxLabel, cxContainer, cxTextEdit, cxMaskEdit, cxDBEdit,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxDockPanel, dxDockControl, cxMemo, ZcxLocateBar,
  FIBQuery, pFIBQuery, ZProc, Dates, ZSvodTypesUnit, ZTypes, Filter_AccDate2,ZMessages,
  ZSvodLoaderUnit, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  cxCheckListBox, cxGridBandedTableView, cxGridDBBandedTableView, Unit_ZGlobal_Consts,
  dxStatusBar, ActnList, unit_NumericConsts,
  PackageLoad, z_dmCommonStyles, cxDBLabel, pFIBProps,
  cxGridCustomPopupMenu, cxGridPopupMenu, zWait, Menus, DMViewData,
  cxProgressBar, ComCtrls, StdCtrls;

type
  TFZDateAcc2 = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    FilterBtn: TdxBarLargeButton;
    PrintBtn: TdxBarLargeButton;
    ShowGroupBoxBtn: TdxBarLargeButton;
    PrintSmetaBtn: TdxBarLargeButton;
    BtnPrintPeriod: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    BarBtnShortPrint: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarButton3: TdxBarButton;
    Panel2: TPanel;
    Panel1: TPanel;
    ActionList: TActionList;
    ActionSystem: TAction;
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
    Panel3: TPanel;
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
    Grid3ClClock: TcxGridDBBandedColumn;
    Grid3ClStavkaPercent: TcxGridDBBandedColumn;
    Grid3ClKodSetTaxGroup: TcxGridDBBandedColumn;
    Grid3Level1: TcxGridLevel;
    Grid5: TcxGrid;
    Grid5DBTableView1: TcxGridDBTableView;
    Grid5ClKodSheet: TcxGridDBColumn;
    Grid5ClTypeSheet: TcxGridDBColumn;
    Grid5ClSumma: TcxGridDBColumn;
    Grid5ClSmetaKod: TcxGridDBColumn;
    Grid5ClDep: TcxGridDBColumn;
    Grid5ClReestr: TcxGridDBColumn;
    Grid5ClNameViplata: TcxGridDBColumn;
    Grid5Level1: TcxGridLevel;
    PanelGrid3DopData: TPanel;
    DBMaskEditDepartment: TcxDBMaskEdit;
    DBMaskEditSmeta: TcxDBMaskEdit;
    LabelDepartment: TcxLabel;
    LabelSmeta: TcxLabel;
    DBMaskEditPost: TcxDBMaskEdit;
    LabelPost: TcxLabel;
    DBMaskEditCategory: TcxDBMaskEdit;
    LabelCategory: TcxLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    Grid1: TcxGrid;
    Grid1View1: TcxGridDBTableView;
    Grid1ClTn: TcxGridDBColumn;
    Grid1ClFIO: TcxGridDBColumn;
    Grid1ClTin: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    Grid2: TcxGrid;
    Grid2View1: TcxGridDBTableView;
    Grid2ClKodSetup: TcxGridDBColumn;
    Grid2ClDateAcc: TcxGridDBColumn;
    Grid2ClTypeAcc: TcxGridDBColumn;
    Grid2Level1: TcxGridLevel;
    Label3: TLabel;
    DateBeg: TDateTimePicker;
    Label13: TLabel;
    DateEnd: TDateTimePicker;
    cxSplitter3: TcxSplitter;
    DeleteMenu: TdxBarPopupMenu;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    RozrahMenu: TdxBarPopupMenu;
    Grid1Clidman: TcxGridDBColumn;
    Panel4: TPanel;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Grid3ClP1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
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
    procedure ActionSystemExecute(Sender: TObject);
    procedure ShowGroupBoxBtnClick(Sender: TObject);
    procedure Grid3DBBandedTableView1DataControllerSummaryDefaultGroupSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure PrintSmetaBtnClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure Grid1View1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure dxBarButton5Click(Sender: TObject);
    procedure DateBegChange(Sender: TObject);
    procedure DateBegExit(Sender: TObject);
    procedure DateBegKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndExit(Sender: TObject);
  private
    //PParameter:TZDataFilter;
    //PMode:TZTypeData;
    PLanguageIndex:byte;
    PBarLocate:TZBarLocate;
    pStyles:TStylesDM;
    pWidth:integer;
    DateBegIn,DateEndIn :  Tdate;

  public
    constructor Create(AOwner : TComponent;KodSetupBeg:integer; KodSetupEnd:integer);reintroduce;
    //property Mode:TZTypeData read PMode;
  end;

function View_ZDateAcc2(AOwner : TComponent; DB:TISC_DB_HANDLE; KodSetupBeg:integer; KodSetupEnd:integer; id_man: variant):Variant; stdcall;
exports  View_ZDateAcc2;


implementation

uses StrUtils, Math;
var form:TFFilter;
{$R *.dfm}

function View_ZDateAcc2(AOwner : TComponent; DB:TISC_DB_HANDLE; KodSetupBeg:integer; KodSetupEnd:integer; id_man: variant):Variant;
var ViewForm: TFZDateAcc2;
    i:integer;
  //  Parameter:TZDataFilter;
begin
  for i:=Application.MainForm.MDIChildCount-1 downto 0 do
  if (Application.MainForm.MDIChildren[i].ClassType = TFZDateAcc2) then
  begin
     Application.MainForm.MDIChildren[i].close;
     break;
  end;
  DatesAcc2Dm:=TDatesAcc2Dm.Create(AOwner,DB, KodSetupBeg, KodSetupEnd, id_man);
  ViewForm  :=  TFZDateAcc2.Create(AOwner, KodSetupBeg, KodSetupEnd);
end;

constructor TFZDateAcc2.Create(AOwner : TComponent; KodSetupBeg:integer; KodSetupEnd:integer);  //;ATypeView:TZTypeData;AParameter:TZDataFilter
var TypeId,i:Byte;
    tmpColumn:TcxGridDBBandedColumn;
begin
 try
   Inherited Create(AOwner);

  //******************************************************************************
   PLanguageIndex:=LanguageIndex;

  //******************************************************************************
   DateBeg.Date:=ConvertKodToDate(KodSetupBeg);
   DateEnd.Date:=ConvertKodToDate(KodSetupEnd+1)-1;
   DateBegIn    := ConvertKodToDate(KodSetupBeg);
   DateEndIn    :=ConvertKodToDate(KodSetupEnd+1)-1;

  //******************************************************************************
  //******************************************************************************
   Caption := DatesAcc_NotSaves_Caption[PLanguageIndex];

   RefreshBtn.Caption := RefreshBtn_Caption[PLanguageIndex];
   PrintBtn.Caption := PrintBtn_Caption[PLanguageIndex];
   FilterBtn.Caption := FilterBtn_Caption[PLanguageIndex];
   ExitBtn.Caption := ExitBtn_Caption[PLanguageIndex];
   ShowGroupBoxBtn.Caption:=ShowGroupBoxBtn_Caption[PLanguageIndex];
  //******************************************************************************
   Grid1ClTn.Caption := GridClTn_Caption[PLanguageIndex];
   Grid1ClTin.Caption := GridClTin_Caption[PLanguageIndex];
   Grid1ClFIO.Caption := GridClFIO_Caption[PLanguageIndex];
  //******************************************************************************
   Grid2ClKodSetup.Caption := GridClKodSetup_Caption[PLanguageIndex];
   Grid2ClDateAcc.Caption := GridClDate_Caption[PLanguageIndex];
   Grid2ClTypeAcc.Caption := Acc_Const[PLanguageIndex];
  //******************************************************************************
   Grid3ClVo.Caption := GridClKodVidOpl_Caption[PLanguageIndex];
   Grid3ClVidOpl.Caption := GridClNameVidopl_Caption[PLanguageIndex];
   Grid3ClSumma.Caption := GridClSumma_Caption[PLanguageIndex];
   Grid3ClP1.Caption := GridClP1_Caption[PLanguageIndex];
   Grid3ClDepartment.Caption := GridClKodDepartment_Caption[PLanguageIndex];
   Grid3ClSmeta.Caption := GridClKodSmeta_Caption[PLanguageIndex];
   Grid3ClKodSetup3.Caption := GridClKodSetup_Caption[PLanguageIndex];
   Grid3ClReCount.Caption := '';
   Grid3ClNDay.Caption := GridClNday_Caption[PLanguageIndex];
   Grid3ClClock.Caption := GridClClock_Caption[PLanguageIndex];
   Grid3ClStavkaPercent.Caption := GridClStavkaPercent_Caption[PLanguageIndex];
   Grid3ClKodSetTaxGroup.Caption:='Період для податків';
  //******************************************************************************
   Grid5ClKodSheet.Caption    := GridClKod_Caption[PLanguageIndex];
   Grid5ClTypeSheet.Caption   := GridClTypeSheet_Caption[PLanguageIndex];
   Grid5ClSumma.Caption       := GridClSumma_Caption[PLanguageIndex];
   Grid5ClSmetaKod.Caption    := GridClKodSmeta_Caption[PLanguageIndex];
   Grid5ClDep.Caption         := GridClKodDepartment_Caption[PLanguageIndex];
   Grid5ClReestr.Caption      := Reestr_Const[PLanguageIndex];
   Grid5ClNameViplata.Caption := GridClViplata_Caption[PLanguageIndex];
  //******************************************************************************
   LabelDepartment.Caption := LabelDepartment_Caption[PLanguageIndex];
   LabelSmeta.Caption := LabelSmeta_Caption[PLanguageIndex];
   LabelPost.Caption := LabelPost_Caption[PLanguageIndex];
   LabelCategory.Caption := LabelCategory_Caption[PLanguageIndex];
  //******************************************************************************
   //PParameter:=AParameter;
   //PMode:=ATypeView;
  //******************************************************************************
//   Grid1View1.DataController.Summary.FooterSummaryItems[0].Format := Itogo_Caption[PLanguageIndex]+': 0';

   Grid3DBBandedTableView1.DataController.Summary.FooterSummaryItems[1].Format := Itogo_Caption[PLanguageIndex]+':';

   Grid5DBTableView1.DataController.Summary.FooterSummaryItems[1].Format := Itogo_Caption[PLanguageIndex]+':';

  //******************************************************************************
   PanelGrid3DopData.Color := Grid3DBBandedTableView1.Styles.Background.Color;
   cxSplitter1.Color := Grid3DBBandedTableView1.Styles.Header.Color;
  //******************************************************************************

  //******************************************************************************
   {for i:=0 to dxStatusBar1.Panels.Count-1 do
     dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
   dxStatusBar1.Panels[0].Text:= RefreshBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[1].Text:= LocateBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[2].Text:= LocateNextBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[3].Text:= FilterBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[4].Text:= PrintBtn_Hint[PLanguageIndex];
   dxStatusBar1.Panels[5].Text:= ExitBtn_Hint[PLanguageIndex];   }
  //******************************************************************************

   Grid3DBBandedTableView1.ViewData.Expand(true);
   
 finally

 end;
end;

procedure TFZDateAcc2.ExitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TFZDateAcc2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with DatesAcc2Dm do
  try
    WriteTransaction.StartTransaction;
    SProcDelete.StoredProcName:='Z_DATE_TMP_ACC_VIEW_D';
    SProcDelete.ParamByName('ID_MAN').AsVariant:=NULL;
    SProcDelete.ParamByName('ID_SESSION').AsInt64:=DatesAcc2Dm.PSES_ACC;
    SProcDelete.ExecProc;
    WriteTransaction.Commit;
    WriteTransaction.StartTransaction;
    QClean.SQL.Text:='Delete From z_spisok_for_count_VIEW where ID_SESSION='+IntToStr(DatesAcc2Dm.PSes_man);
    QClean.ExecQuery;
    WriteTransaction.Commit;
    ReadTransaction.Commit;
  except
    WriteTransaction.Rollback;
    ReadTransaction.Rollback;
  end;
  DatesAcc2Dm.Free;
  Form.free;
  Action:=caFree;
end;

procedure TFZDateAcc2.FormCreate(Sender: TObject);
begin
  //Grid3DBBandedTableView1.DataController.Summary.FooterSummaryItems[1].Format := Itogo_Caption[PLanguageIndex];
end;

procedure TFZDateAcc2.Grid3ClP1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
 if AText='False' then
    AText:=GridClP1_Text_False[PLanguageIndex];
 if AText='True' then
    AText:=GridClP1_Text_True[PLanguageIndex];
end;

procedure TFZDateAcc2.Grid3ClKodSetup3GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
 if Atext<>'' then Atext:=KodSetupToPeriod(StrToInt(Atext),1);
end;

procedure TFZDateAcc2.Grid3ClNDayGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if (AText<>'') then
    if StrToInt(AText)=0 then AText:='';
end;

procedure TFZDateAcc2.Grid3ClClockGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);

begin
  if (AText='0,000') or (AText='0') then AText:='';
end;

procedure TFZDateAcc2.Grid2ClKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if AText<>'' then Atext:=KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFZDateAcc2.Grid1View1KeyPress(Sender: TObject; var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (Grid1View1.OptionsBehavior.IncSearchItem <> Grid1ClTn)then
    begin
     Grid1View1.Controller.IncSearchingText   := '';
     Grid1View1.OptionsBehavior.IncSearchItem := Grid1ClTn;
    end
  end
 else
  if (Grid1View1.OptionsBehavior.IncSearchItem <> Grid1ClFIO)then
   begin
    Grid1View1.Controller.IncSearchingText   := '';
    Grid1View1.OptionsBehavior.IncSearchItem := Grid1ClFIO;
   end;
end;

procedure TFZDateAcc2.DSet3AfterOpen(DataSet: TDataSet);
begin
  //Grid3DBBandedTableView1.ViewData.Expand(False);
end;

procedure TFZDateAcc2.Grid3DBBandedTableView1DataControllerSummaryFooterSummaryItemsSummary(
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

procedure TFZDateAcc2.RefreshBtnClick(Sender: TObject);
begin

  DatesAcc2Dm.DSet1.CloseOpen(True);
  DatesAcc2Dm.DSet2.Close;
  DatesAcc2Dm.DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACC_PEOPLE_LIST_ACCS_VIEW(?ID_MAN,'
                                                             +IntToStr(DateToKodSetup(Self.DateBeg.date))+','
                                                             +IntToStr(DateToKodSetup(Self.DateEnd.date))+','
                                                             +IntToStr(0)+','
                                                             +IntToStr(3)+','
                                                             +IntToStr(DatesAcc2Dm.PSES_ACC)+') order by KOD_SETUP_2,DATE_ACC descending';
  DatesAcc2Dm.DSet2.Open;
  DatesAcc2Dm.DSet3.CloseOpen(True);
  DatesAcc2Dm.DSet5.CloseOpen(True);
  Grid3DBBandedTableView1.ViewData.Expand(true);
end;

procedure TFZDateAcc2.dxStatusBar1Resize(Sender: TObject);
var i:byte;
begin
 {for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count; }
end;

procedure TFZDateAcc2.ActionSystemExecute(Sender: TObject);
begin
{ZShowMessage('System Data','ID_MAN = '+VarToStrDef(DSet2['ID_MAN'],'NULL')+#13+
                           'ID_GROUP_ACCOUNT = '+VarToStrDef(DSet2['ID_GROUP_ACCOUNT'],'NULL')+#13+
                           'KOD_SETUP_2 = '+VarToStrDef(DSet2['KOD_SETUP_2'],'NULL'),mtInformation,[mbOk]);}
end;

procedure TFZDateAcc2.ShowGroupBoxBtnClick(Sender: TObject);
begin

    If (ShowGroupBoxBtn.Down) then
    begin
        Grid3DBBandedTableView1.OptionsView.GroupByBox:=True;
        ShowGroupBoxBtn.Caption:=HideGroupBoxBtn_Caption[PLanguageIndex];
    end
    else
    begin
        Grid3DBBandedTableView1.OptionsView.GroupByBox:=False;
        ShowGroupBoxBtn.Caption:=ShowGroupBoxBtn_Caption[PLanguageIndex];
    end;
   

end;

procedure TFZDateAcc2.Grid3DBBandedTableView1DataControllerSummaryDefaultGroupSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
var AItem: TcxGridTableSummaryItem;
begin
  AItem := TcxGridTableSummaryItem(Arguments.SummaryItem);
  if (AItem.Column = Grid3ClSumma) and
     (AItem.Kind = skSum) and (AItem.Position = spGroup) then
  begin
   if (AItem.Column.GroupIndex<Grid3ClP1.GroupIndex) and (VarToStr(Grid3DBBandedTableView1.DataController.Values[Arguments.RecordIndex, Grid3ClP1.Index]) ='F')
      then OutArguments.Value:=-OutArguments.Value;
  end;
end;

procedure TFZDateAcc2.PrintSmetaBtnClick(Sender: TObject);
var parameter:TZAccListParameter;
begin

end;

procedure TFZDateAcc2.dxBarLargeButton3Click(Sender: TObject);
begin
  if form=nil then  form:=TFFilter.Create(Self, DateBeg.DateTime, DateEnd.DateTime)
  else
    begin
      //form.DateBeg.MinDate:=DateBeg.Date;
      form.DateBeg.Date:=DateBeg.Date;
      //form.DateEnd.MaxDate:=DateEnd.Date;
      form.DateEnd.Date:=DateEnd.Date;
    end;
  if  form.ShowModal=mrOk
    then
      with DatesAcc2Dm do
      begin
        WriteTransaction.StartTransaction;
        QClean.SQL.Text:='Delete From z_spisok_for_count_VIEW where ID_SESSION='+IntToStr(PSes_man);
        QClean.ExecQuery;
        WriteTransaction.Commit;

        if form.AllPeopleBtn.Checked then FillSpisokForCountQuery.ParamByName('KIND_OF_CHOOSE').Value:='*';
        if form.ManSelBtn.Checked    then FillSpisokForCountQuery.ParamByName('KIND_OF_CHOOSE').Value:='F';
        if form.DepNameBtn.Checked   then FillSpisokForCountQuery.ParamByName('KIND_OF_CHOOSE').Value:='D';
        if form.RadioButton1.Checked then FillSpisokForCountQuery.ParamByName('KIND_OF_CHOOSE').Value:='H';
        if form.RadioButton2.Checked then FillSpisokForCountQuery.ParamByName('KIND_OF_CHOOSE').Value:='M';
        if form.RadioButton3.Checked then FillSpisokForCountQuery.ParamByName('KIND_OF_CHOOSE').Value:='A';
        if form.RadioButton5.Checked then FillSpisokForCountQuery.ParamByName('KIND_OF_CHOOSE').Value:='P';

        FillSpisokForCountQuery.ParamByName('HOL_DATE_BEG').Value   :=form.HolDateBeg.Date;
        FillSpisokForCountQuery.ParamByName('HOL_DATE_END').Value   :=form.HolDateEnd.Date;


        FillSpisokForCountQuery.ParamByName('DATE_BEG').Value   :=form.DateBeg.Date;
        FillSpisokForCountQuery.ParamByName('DATE_END').Value   :=form.DateEnd.Date;

        if (form.ManSelBtn.Checked)
        then FillSpisokForCountQuery.ParamByName('IN_ID_MAN').Value:=form.FIdMan
        else FillSpisokForCountQuery.ParamByName('IN_ID_MAN').Value:=null;

        if (form.RadioButton5.Checked)
        then FillSpisokForCountQuery.ParamByName('ID_VID_OPL_PROP').Value:=form.Fidvidoplprop
        else FillSpisokForCountQuery.ParamByName('ID_VID_OPL_PROP').Value:=NUll;

        if (form.DepNameBtn.Checked)
        then FillSpisokForCountQuery.ParamByName('ID_DEPARTMENT').Value:= form.FIdDepartment
        else FillSpisokForCountQuery.ParamByName('ID_DEPARTMENT').Value:=null;

        FillSpisokForCountQuery.ParamByName('ID_SESSION').Value:=PSes_man;

        WriteTransaction.StartTransaction;

        try
          FillSpisokForCountQuery.ExecProc;
          WriteTransaction.Commit;
          DSet1.CloseOpen(True);
          DSet2.Close;
          DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACC_PEOPLE_LIST_ACCS_VIEW(?ID_MAN,'
                                                             +IntToStr(DateToKodSetup(Self.DateBeg.date))+','
                                                             +IntToStr(DateToKodSetup(Self.DateEnd.date))+','
                                                             +IntToStr(0)+','
                                                             +IntToStr(3)+') order by KOD_SETUP_2,DATE_ACC descending';
          DSet2.Open;

          DSet3.CloseOpen(True);
          DSet5.CloseOpen(True);

        except on E:Exception
        do
          begin
            ShowMessage(E.Message);
            WriteTransaction.Rollback;
          end;
        end;

        self.DateBeg.Date:=form.DateBeg.Date;
        self.DateEnd.Date:=form.DateEnd.Date;
      end;

end;

procedure TFZDateAcc2.dxBarLargeButton4Click(Sender: TObject);
begin
  if not DatesAcc2Dm.DSet1.IsEmpty then
  begin
    with DatesAcc2Dm do
    try
      WriteTransaction.StartTransaction;
      QClean.SQL.Text:='Delete From z_spisok_for_count_VIEW where ID_SESSION='+IntToStr(PSes_man)+' and ID_MAN='+ varToStr(DSet1['ID_MAN']);
      QClean.ExecQuery;
      WriteTransaction.Commit;
      DSet1.CloseOpen(True);
      DSet2.Close;
      DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACC_PEOPLE_LIST_ACCS_VIEW(?ID_MAN,'
                                                             +IntToStr(DateToKodSetup(Self.DateBeg.date))+','
                                                             +IntToStr(DateToKodSetup(Self.DateEnd.date))+','
                                                             +IntToStr(0)+','
                                                             +IntToStr(3)+') order by KOD_SETUP_2,DATE_ACC descending';
      DSet2.Open;
      DSet3.CloseOpen(True);
      DSet5.CloseOpen(True);
    except
    end
  end;
end;

procedure TFZDateAcc2.dxBarButton4Click(Sender: TObject);
begin
  with DatesAcc2Dm do
  try
    WriteTransaction.StartTransaction;
    QClean.SQL.Text:='Delete From z_spisok_for_count_VIEW where ID_SESSION='+IntToStr(PSes_man);
    QClean.ExecQuery;
    WriteTransaction.Commit;
    DSet1.CloseOpen(True);
    DSet2.Close;
    DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACC_PEOPLE_LIST_ACCS_VIEW(?ID_MAN,'
                                                             +IntToStr(DateToKodSetup(Self.DateBeg.date))+','
                                                             +IntToStr(DateToKodSetup(Self.DateEnd.date))+','
                                                             +IntToStr(0)+','
                                                             +IntToStr(3)+') order by KOD_SETUP_2,DATE_ACC descending';
    DSet2.Open;
    DSet3.CloseOpen(True);
    DSet5.CloseOpen(True);
  except
  end
end;

procedure TFZDateAcc2.dxBarLargeButton2Click(Sender: TObject);
begin
  if not DatesAcc2Dm.DSet1.IsEmpty then
  begin
    DatesAcc2Dm.WriteTransaction.StartTransaction;
    DatesAcc2Dm.SProcDelete.StoredProcName:='Z_DATE_TMP_ACC_VIEW_D';
    DatesAcc2Dm.SProcDelete.ParamByName('id_man').AsInt64:=DatesAcc2Dm.DSet1['id_Man'];
    DatesAcc2Dm.SProcDelete.ParamByName('id_SESSION').AsInt64:=DatesAcc2Dm.PSES_ACC;
    try
      DatesAcc2Dm.SProcDelete.ExecProc;
      DatesAcc2Dm.WriteTransaction.Commit;
    except
      DatesAcc2Dm.WriteTransaction.Rollback;
      ShowMessage('Помилка видалення!');
    end;

    DatesAcc2Dm.SProcRaschet.ParamByName('id_man').AsInt64:=DatesAcc2Dm.DSet1['id_Man'];
    DatesAcc2Dm.SProcRaschet.ParamByName('DATE_BEG').AsDate:=DATEBEG.Date;
    DatesAcc2Dm.SProcRaschet.ParamByName('DATE_END').AsDate:=DATEEND.Date;
    DatesAcc2Dm.WriteTransaction.StartTransaction;
    try
      DatesAcc2Dm.SProcRaschet.ExecProc;
      DatesAcc2Dm.PSES_ACC:=DatesAcc2Dm.SProcRaschet.ParamByName('id_SESSION').AsInt64;
      DatesAcc2Dm.WriteTransaction.Commit;
      DatesAcc2Dm.DSet1.closeOpen(true);
      DatesAcc2Dm.DSet2.Close;
      DatesAcc2Dm.DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACC_PEOPLE_LIST_ACCS_VIEW(?ID_MAN,'
                                                             +IntToStr(DateToKodSetup(Self.DateBeg.date))+','
                                                             +IntToStr(DateToKodSetup(Self.DateEnd.date))+','
                                                             +IntToStr(0)+','
                                                             +IntToStr(3)+','
                                                             +IntToStr(DatesAcc2Dm.PSES_ACC)+') order by KOD_SETUP_2,DATE_ACC descending';
      DatesAcc2Dm.DSet2.Open;
      DatesAcc2Dm.DSet3.CloseOpen(True);
      DatesAcc2Dm.DSet5.CloseOpen(True);
    except
      DatesAcc2Dm.WriteTransaction.Rollback;
      ShowMessage('Помилка формування!');
    end
  end;
  Grid3DBBandedTableView1.ViewData.Expand(true);
end;

procedure TFZDateAcc2.Grid1View1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
with Sender.Controller do
  begin
    if FocusedRecord<>nil then
      begin
        if FocusedRecord.Index = -1 then Exit;
      end
    else exit;

    if (ARecord.Values[3] <> null)
      then
      if  (ARecord.Values[3]=1)
        then
          begin
            AStyle := cxStyle11;
          end
  end;
end;

procedure TFZDateAcc2.dxBarButton5Click(Sender: TObject);
var i :integer;
begin
  if not DatesAcc2Dm.DSet1.IsEmpty then
  begin
    DatesAcc2Dm.DSet1.First;
    //ProgressBar.Properties.Max:=Dm.DSet1.recordCount;
    //ProgressBar.Position:=1;
    DatesAcc2Dm.DSet2.Close;
    DatesAcc2Dm.DSet3.Close;
    DatesAcc2Dm.DSet5.Close;
    Grid1View1.DataController.DataSource:=nil;

    DatesAcc2Dm.WriteTransaction.StartTransaction;
    DatesAcc2Dm.SProcDelete.StoredProcName:='Z_DATE_TMP_ACC_VIEW_D';
    DatesAcc2Dm.SProcDelete.ParamByName('id_man').AsVariant:=NULL;
    DatesAcc2Dm.SProcDelete.ParamByName('id_SESSION').AsInt64:=DatesAcc2Dm.PSES_ACC;

    try
      DatesAcc2Dm.SProcDelete.ExecProc;
      DatesAcc2Dm.WriteTransaction.Commit;
    except
      DatesAcc2Dm.WriteTransaction.Rollback;
      ShowMessage('Помилка видалення!');
    end;
    for i:=1 to DatesAcc2Dm.DSet1.recordCount do
    begin
      DatesAcc2Dm.WriteTransaction.StartTransaction;
      DatesAcc2Dm.SProcRaschet.ParamByName('id_man').AsInt64:=DatesAcc2Dm.DSet1['id_Man'];
      DatesAcc2Dm.SProcRaschet.ParamByName('DATE_BEG').AsDate:=DATEBEG.Date;
      DatesAcc2Dm.SProcRaschet.ParamByName('DATE_END').AsDate:=DATEEND.Date;

      try
        DatesAcc2Dm.SProcRaschet.ExecProc;
        DatesAcc2Dm.WriteTransaction.Commit;
        //ProgressBar.Position:=ProgressBar.Position+1;
        Application.ProcessMessages;
      except
        DatesAcc2Dm.WriteTransaction.Rollback;
        ShowMessage('Помилка розрахунку.'+VarToStr(DatesAcc2Dm.DSet1['FIO']));
      end;
      DatesAcc2Dm.DSet1.next;
    end;
    ShowMessage('Розрахунок закінчено!');
    DatesAcc2Dm.DSet1.closeOpen(true);
    DatesAcc2Dm.DSet2.Close;
    DatesAcc2Dm.DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_ACC_PEOPLE_LIST_ACCS_VIEW(?ID_MAN,'
                                                             +IntToStr(DateToKodSetup(Self.DateBeg.date))+','
                                                             +IntToStr(DateToKodSetup(Self.DateEnd.date))+','
                                                             +IntToStr(0)+','
                                                             +IntToStr(3)+') order by KOD_SETUP_2,DATE_ACC descending';
    DatesAcc2Dm.DSet2.Open;
    DatesAcc2Dm.DSet3.CloseOpen(True);
    DatesAcc2Dm.DSet5.CloseOpen(True);
    Grid1View1.DataController.DataSource:=DatesAcc2Dm.DSource1;
  end;
end;

procedure TFZDateAcc2.DateBegChange(Sender: TObject);
begin
//showmessage('1');
 //  if (DateBeg.Date <DateBegIn) then DateBeg.Date := DateBegIn;
   //if (DateEnd.Date <DateEndIn) then DateEnd.Date := DateEndIn;
end;

procedure TFZDateAcc2.DateBegExit(Sender: TObject);
begin
     if (DateBeg.Date <DateBegIn) then DateBeg.Date := DateBegIn;
end;

procedure TFZDateAcc2.DateBegKeyPress(Sender: TObject; var Key: Char);
begin
        key := chr(0);
end;

procedure TFZDateAcc2.DateEndExit(Sender: TObject);
begin
    if (DateEnd.Date <DateEndIn) then DateEnd.Date := DateEndIn;
end;

end.

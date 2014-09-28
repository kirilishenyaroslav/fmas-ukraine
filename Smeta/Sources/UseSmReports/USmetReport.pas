unit USmetReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, StdCtrls, ComCtrls, ToolWin, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,ibase, ExtCtrls,
  pFibStoredProc, DBCtrls, Buttons, Grids, Resources_unitb, GlobalSpr,
  cxTextEdit, cxContainer, cxDBEdit, cxGridBandedTableView,
  cxGridDBBandedTableView, dxDockControl, dxDockPanel, dxBar, frxClass,
  frxDBSet, cxCheckBox, Placemnt;

resourcestring
  NOTSMETATEXT='Данний об'+''''+'єкт не являється вложенним кошторисом';
  PERIODNOTEQUAL='Період функціонування вложенного кошторису не співпадає';
type
  TfrmSmetaReportStru = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton12: TToolButton;
    CloseButton: TToolButton;
    ToolBar2: TToolBar;
    SmallImages: TImageList;
    WorkPopup: TPopupMenu;
    N6: TMenuItem;
    N11: TMenuItem;
    N14: TMenuItem;
    N9: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    SmetaDataSet: TpFIBDataSet;
    StruDataSet: TpFIBDataSet;
    StruDataSource: TDataSource;
    WriteTransaction: TpFIBTransaction;
    StDoxod: TcxStyle;
    StRasxod: TcxStyle;
    DocsButton: TToolButton;
    N4: TMenuItem;
    DetailStruDataSet: TpFIBDataSet;
    DetailStruDataSource: TDataSource;
    ToolButton1: TToolButton;
    MarkSummStyle: TcxStyle;
    DockSite: TdxDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dxLayoutDockSite2: TdxLayoutDockSite;
    DockPanelTree: TdxDockPanel;
    DockPanelGrid: TdxDockPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel2: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    SpeedButton1: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    Panel1: TPanel;
    Splitter1: TSplitter;
    cxCheckBox1: TcxCheckBox;
    cxGrid3: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedColumn5: TcxGridDBBandedColumn;
    UPR_SALDO: TcxGridDBBandedColumn;
    cxGridDBBandedColumn7: TcxGridDBBandedColumn;
    cxGridDBBandedColumn8: TcxGridDBBandedColumn;
    cxGridLevel1: TcxGridLevel;
    RazdMonthDataSet: TpFIBDataSet;
    RazdMonthDataSource: TDataSource;
    cxStyle1: TcxStyle;
    cxGridDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    ToolButton2: TToolButton;
    PrintPopupMenu: TPopupMenu;
    N10: TMenuItem;
    N12: TMenuItem;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    cxCheckBox4: TcxCheckBox;
    Panel3: TPanel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    ToolButton3: TToolButton;
    FormStorage1: TFormStorage;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid2DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid2DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid2Level1: TcxGridLevel;
    cxGrid4: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBBandedTableView2: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn6: TcxGridDBBandedColumn;
    cxGridDBBandedColumn9: TcxGridDBBandedColumn;
    cxGridDBBandedColumn10: TcxGridDBBandedColumn;
    cxGridDBBandedColumn11: TcxGridDBBandedColumn;
    cxGridLevel2: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure cxGrid2DBTableView1DBColumn4StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGrid2DBBandedTableView1DBBandedColumn2StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGrid2DBBandedTableView1DBBandedColumn3StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGrid2DBBandedTableView1DBBandedColumn5StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxGrid1DBBandedTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGrid1DBBandedTableView1DBBandedColumn5StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGrid1DBBandedTableView1DBBandedColumn7StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGridDBBandedColumn5StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGridDBBandedColumn7StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGrid2DBBandedTableView1DBBandedColumn4StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGrid2DBBandedTableView1DBBandedColumn6StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ToolButton3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
     INFINITY_DATE:TdateTime;
     ActualDate:TDateTime;
     ResultValue:Variant;
     CurFS:TFormStyle;
     CurIdSmeta       : Int64;
     CurIdPlan        : Int64;
     CurSmetaKod      : string;
     CurSmetaGroup    : Integer;
     CurSmetaTitle    : string;
     CurSmetaEnabled  : Boolean;
     PlanDateBeg      : TDateTime;
     PlanDateEnd      : TDateTime;
     PlanIsBlocked    : Boolean;
     bbShowFlag         : Boolean;
     constructor Create(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Id_smeta:Int64;Id_plan:Int64);overload;
  end;

implementation


{$R *.dfm}

{ TfrmSmetaStru }

constructor TfrmSmetaReportStru.Create(AOwner: TComponent;
  DBHandle: TISC_DB_HANDLE; FS: TFormStyle; Book_Date: TDateTime; Id_smeta,
  Id_plan: Int64);
begin
      inherited Create(AOwner);
      CurIdSmeta:=Id_smeta;
      CurIdPlan :=Id_plan;

      RazdMonthDataSet.SelectSQL.Text:=' SELECT * FROM BU_SMET_REPORT_BY_MONTH('+IntToStr(CurIdPlan)+',?ID_PLAN_OBJ)';
      Self.WorkDatabase.Handle:=DBHAndle;
      ActualDate:=Book_Date;
      CurFS:=FS;
      self.FormStyle:=FS;
      self.bbShowFlag:=false;
end;

procedure TfrmSmetaReportStru.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmSmetaReportStru.FormShow(Sender: TObject);
var SmetaInfo,PlanInfo:TpFibDataSet;
    date_str,beg_str,end_str:string;
begin
    dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);
    SmetaInfo:=TpFibDataSet.Create(self);
    SmetaInfo.Database:=WorkDatabase;
    SmetaInfo.Transaction:=ReadTransaction;

    SmetaInfo.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_SMETA_SELECT('+''''+date_str+''''+',-1)'+' WHERE P_ID_SMETA='+IntToStr(CurIdSmeta);
    SmetaInfo.Open;
    if SmetaInfo.RecordCount>0
    then begin
           CurSmetaKod    :=SmetaInfo.FieldByName('P_SMETA_KOD').AsString;
           CurSmetaTitle  :=SmetaInfo.FieldByName('P_SMETA_TITLE').AsString;
           CurSmetaEnabled:=SmetaInfo.FieldByName('P_SMETA_ENABLED').AsBoolean;
           //CurSmetaGroup  :=SmetaInfo.FieldByName('P_ID_GROUP').AsInteger;
    end;

    PlanInfo:=TpFibDataSet.Create(self);
    PlanInfo.Database:=WorkDatabase;
    PlanInfo.Transaction:=ReadTransaction;
    PlanInfo.SQLs.SelectSQL.Text:='SELECT * FROM BU_SMET_PLUS_PERIODS WHERE ID_PLAN='+IntTOStr(CurIdPlan);
    PlanInfo.Open;
    if PlanInfo.RecordCount>0
    then begin
         PlanDateBeg   :=PlanInfo.FieldByName('DATE_BEG').AsDateTime;
         PlanDateEnd   :=PlanInfo.FieldByName('DATE_END').AsDateTime;
         PlanIsBlocked :=PlanInfo.FieldByName('IS_BLOCKED').AsBoolean;
         dateTimetostring(beg_str,'dd.mm.yyyy', PlanDateBeg);
         dateTimetostring(end_str,'dd.mm.yyyy', PlanDateEnd);
    end;

    DockPanelTree.Caption:=CurSmetaKod+'-'+CurSmetaTitle+'" на '+beg_str+'-'+end_str ;

    Caption:='Виконання кошторису "'+CurSmetaKod+'-'+CurSmetaTitle+'" на '+beg_str+'-'+end_str ;
    SmetaInfo.Free;
    PlanInfo.Free;
    DetailStruDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SM_REPORT_DETAIL_SELECT(?ID_PLAN_OBJ'+','+IntToStr(CurIdPlan)+')';
    cxGrid1DBBandedTableView1.BeginUpdate;
    StruDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_REPORT_STRUCTURE_SELECT('+IntToStr(CurIdPlan)+') ORDER BY ID_TYPE_OBJ';
    StruDataSet.Open;
    cxGrid1DBBandedTableView1.EndUpdate;
    cxGrid1DBBandedTableView1.ViewData.Expand(true);
    cxGrid1DBBandedTableView1.DataController.FocusedRowIndex:=0;
    self.bbShowFlag:=true;
end;


procedure TfrmSmetaReportStru.CheckBox1Click(Sender: TObject);
begin
     cxGrid1DBBandedTableView1.OptionsView.GroupByBox:=cxCheckBox4.Checked;
end;

procedure TfrmSmetaReportStru.N9Click(Sender: TObject);
begin
     CloseButton.OnClick(self);
end;

procedure TfrmSmetaReportStru.N2Click(Sender: TObject);
begin
     DocsButton.OnClick(self);
end;

procedure TfrmSmetaReportStru.RefreshButtonClick(Sender: TObject);
var date_str:string;
    id:integer;
begin
    id:=StruDataSet.FieldByName('ID_STRUCTURE').AsInteger;
    dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);
    StruDataSet.Close;
    StruDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_STRUCTURE_SELECT('+IntToStr(CurIdPlan)+','+''''+date_str+''''+',0) ORDER BY ID_TYPE_OBJ';
    StruDataSet.Open;
    cxGrid1DBBandedTableView1.ViewData.Expand(true);
    StruDataSet.Locate('ID_STRUCTURE',id,[]);
end;


procedure TfrmSmetaReportStru.ToolButton1Click(Sender: TObject);
var ID_STRUCTURE,ID_PLAN_OBJ,ID_TYPE_OBJ,id:Integer;
begin
     ID_STRUCTURE:=0;ID_PLAN_OBJ:=0;ID_TYPE_OBJ:=0; id:=0;
     If StruDataSet.RecordCount>0
     then begin
          ID_STRUCTURE:=StruDataSet.FieldByName('ID_STRUCTURE').value;
          ID_PLAN_OBJ :=StruDataSet.FieldByName('ID_PLAN_OBJ').value;
          ID_TYPE_OBJ :=StruDataSet.FieldByName('ID_TYPE_OBJ').value;
     end;

     StruDataSet.CloseOpen(true);
     cxGrid1DBBandedTableView1.ViewData.Expand(true);
     if (ID_STRUCTURE>0)
     then begin
          cxGrid1DBBandedTableView1.DataController.LocateByKey(VarArrayOf([ID_STRUCTURE, ID_PLAN_OBJ, ID_TYPE_OBJ]));
     end;

     if  DetailStruDataSet.RecordCount>0
     then id:=DetailStruDataSet.FieldByName('ID_RAZD_ST').AsInteger;

     DetailStruDataSet.CloseOpen(true);
     cxGrid2DBTableView1.ViewData.Expand(true);
     cxGrid2DBTableView1.DataController.LocateByKey(id);
end;

procedure TfrmSmetaReportStru.CloseButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmSmetaReportStru.cxGrid2DBTableView1DBColumn4StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if ARecord.Values[2]<>0
  then AStyle:=MarkSummStyle
  else AStyle:=back;
end;

procedure TfrmSmetaReportStru.cxGrid2DBBandedTableView1DBBandedColumn2StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[1]<>0)
  then AStyle:=MarkSummStyle
  else AStyle:=back;
end;

procedure TfrmSmetaReportStru.cxGrid2DBBandedTableView1DBBandedColumn3StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[2]<>0)
  then AStyle:=MarkSummStyle
  else AStyle:=back;

end;

procedure TfrmSmetaReportStru.cxGrid2DBBandedTableView1DBBandedColumn5StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[4]<>0)
  then AStyle:=MarkSummStyle
  else AStyle:=back;
end;

procedure TfrmSmetaReportStru.SpeedButton1Click(Sender: TObject);
begin
if (DetailStruDataSet.RecordCount>0)
then begin
          GlobalSpr.GetDocsUnderBudget(self,
                                       WorkDatabase.Handle,
                                       CurIdPlan,
                                       CurIdSmeta,
                                       StruDataSet.FieldByName('ID_PLAN_OBJ').Value,
                                       DetailStruDataSet.FieldByName('ID_RAZD_ST').Value);
end;
end;


procedure TfrmSmetaReportStru.N3Click(Sender: TObject);
begin
if (StruDataSet.RecordCount>0)
then begin
          GlobalSpr.GetDocsUnderBudget(self,
                                       WorkDatabase.Handle,
                                       CurIdPlan,
                                       CurIdSmeta,
                                       StruDataSet.FieldByName('ID_PLAN_OBJ').Value,
                                       0);
end;
end;

procedure TfrmSmetaReportStru.N1Click(Sender: TObject);
begin
if (StruDataSet.RecordCount>0)
then begin
          GlobalSpr.GetDocsUnderBudget(self,
                                       WorkDatabase.Handle,
                                       CurIdPlan,
                                       CurIdSmeta,
                                       0,
                                       0);
end;
end;

procedure TfrmSmetaReportStru.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     if cxCheckBox1.Checked
     then begin
          Panel1.Visible:=true;
          Splitter1.Top:=Panel1.Top+1;
          if (StruDataSet.RecordCount>0)
          then RazdMonthDataSet.CloseOpen(true);
     end
     else begin
          Panel1.Visible:=false;
     end;
end;

procedure TfrmSmetaReportStru.cxGrid1DBBandedTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if (StruDataSet.RecordCount>0) and cxCheckBox1.Checked
  then RazdMonthDataSet.CloseOpen(true);

end;

procedure TfrmSmetaReportStru.cxGrid1DBBandedTableView1DBBandedColumn5StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[4]<0)
  then AStyle:=StDoxod
  else AStyle:=back;
end;

procedure TfrmSmetaReportStru.cxGrid1DBBandedTableView1DBBandedColumn7StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[6]<0)
  then AStyle:=StDoxod
  else AStyle:=back;
end;

procedure TfrmSmetaReportStru.cxGridDBBandedColumn5StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[2]<0)
  then AStyle:=StDoxod
  else AStyle:=back;
end;

procedure TfrmSmetaReportStru.cxGridDBBandedColumn7StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[4]<0)
  then AStyle:=StDoxod
  else AStyle:=back;
end;

procedure TfrmSmetaReportStru.cxGrid2DBBandedTableView1DBBandedColumn4StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[3]<0)
  then AStyle:=StDoxod
  else AStyle:=back;

end;

procedure TfrmSmetaReportStru.cxGrid2DBBandedTableView1DBBandedColumn6StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord.Values[5]<0)
  then AStyle:=StDoxod
  else AStyle:=back;

end;

procedure TfrmSmetaReportStru.ToolButton3Click(Sender: TObject);
begin
     Panel3.Visible:=ToolButton3.Down;
end;

procedure TfrmSmetaReportStru.N6Click(Sender: TObject);
begin
      ToolButton1.OnClick(self);
end;

procedure TfrmSmetaReportStru.N4Click(Sender: TObject);
begin
if (StruDataSet.RecordCount>0)
then begin
    if (StruDataSet.FieldByName('ID_STRUCTURE').Value<0)
    then begin
                GlobalSpr.GetSmResults(Application.MainForm,
                                       WorkDatabase.Handle,
                                       fsMdiChild,
                                       ActualDate,
                                       StrToInt64(StruDataSet.FieldByName('ID_PLAN_OBJ').AsString),
                                       StrToInt64(StruDataSet.FieldByName('ID_PL').AsString));
    end;
end;
end;

end.




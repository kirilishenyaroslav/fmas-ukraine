unit Current_LineView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, cxSplitter, cxLabel, cxContainer,
  cxMaskEdit, cxDBEdit, ExtCtrls, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, Current_Filter, IBase, ZProc, Dates,
  zcxLocateBar, dxBar, dxBarExtItems, ActnList;

type
  TFZLineCurrent = class(TForm)
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
    DSource: TDataSource;
    DBase: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    PanelGroup: TPanel;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1ClMan: TcxGridDBColumn;
    Grid1ClKodSetup: TcxGridDBColumn;
    Grid1ClSmeta: TcxGridDBColumn;
    Grid1ClDepartment: TcxGridDBColumn;
    Grid1ClVo: TcxGridDBColumn;
    Grid1ClVidOpl: TcxGridDBColumn;
    Grid1ClSumma: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    cxSplitter3: TcxSplitter;
    PanelDopData: TPanel;
    EditDepartment: TcxDBMaskEdit;
    EditCategory: TcxDBMaskEdit;
    EditSmeta: TcxDBMaskEdit;
    LabelSmeta: TcxLabel;
    LabelDepartment: TcxLabel;
    LabelCategory: TcxLabel;
    BarManager: TdxBarManager;
    FilterBtn: TdxBarButton;
    ExitBtn: TdxBarButton;
    PanelGridFooter: TPanel;
    LabelPeopleCount: TcxLabel;
    LabelRecordCount: TcxLabel;
    LabelCommonSumma: TcxLabel;
    procedure Grid1ClKodSetupGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure ExitBtnClick(Sender: TObject);
    procedure Grid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FilterBtnClick(Sender: TObject);
    procedure PanelGridFooterResize(Sender: TObject);
  private
    PFilter:string;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;ACurrentFilter:TzCurrentFilter);reintroduce;
  end;

function ViewLineCurrent(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;ACurrentFilter:TzCurrentFilter):variant;
implementation

uses ZWait;

{$R *.dfm}

function ViewLineCurrent(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;ACurrentFilter:TzCurrentFilter):variant;
var ViewForm:TFZLineCurrent;
begin
 ViewForm:=TFZLineCurrent.Create(AOwner,ADB_Handle,ACurrentFilter);
 ViewForm.ShowModal;
 ViewForm.Free;
 Result:=null;
end;

constructor TFZLineCurrent.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;ACurrentFilter:TzCurrentFilter);
var Bar:TZBarLocate;
    Id_man:integer;
    PPeopleCount:integer;
    PRecordCount:Integer;
    PSumma:double;
    wf:TForm;
begin
 inherited Create(AOwner);
//******************************************************************************
 Caption                   := GetConst('LineView',tcButton);
 ExitBtn.Caption           := GetConst('Exit',tcButton);
 FilterBtn.Caption         := GetConst('Filter',tcButton);
//******************************************************************************
 Grid1ClMan.Caption        := GetConst('Man',tcButton);
 Grid1ClKodSetup.Caption   := GetConst('KodSetup',tcLabel);
 Grid1ClDepartment.Caption := GetConst('KodDepartment',tcButton);
 Grid1ClSumma.Caption      := GetConst('Summa',tcButton);
 Grid1ClSmeta.Caption      := GetConst('KodSmeta',tcButton);
 Grid1ClVo.Caption         := GetConst('KodVidopl',tcButton);
 Grid1ClVidOpl.Caption     := GetConst('NameVidopl',tcButton);
//******************************************************************************
 LabelSmeta.Caption        := GetConst('Smeta',tcLabel);
 LabelDepartment.Caption   := GetConst('Department',tcButton);
 LabelCategory.Caption     := GetConst('Category',tcButton);
//******************************************************************************
 cxSplitter3.Color         := Grid1DBTableView1.Styles.Header.Color;
 PanelDopData.Color        := Grid1DBTableView1.Styles.Background.Color;
//******************************************************************************
  wf:=ShowWaitForm(Self);
  DBase.Handle := ADB_Handle;
  DSet.SQLs.SelectSQL.Text := 'select * from Z_CURRENT_SELECT_LINEVIEW('+
                               IfThen(ACurrentFilter.Is_KodSetup,IntToStr(ACurrentFilter.Kod_Setup1)+','+
                                                                IntToStr(ACurrentFilter.Kod_Setup2),'NULL,NULL')+','+
                               IfThen(ACurrentFilter.Is_Man,IntToStr(ACurrentFilter.Id_man),'NULL')+','+
                               IfThen(ACurrentFilter.Is_Department,IntToStr(ACurrentFilter.Id_department),'NULL')+','+
                               IfThen(ACurrentFilter.Is_VidOpl,IntToStr(ACurrentFilter.Id_VidOpl),'NULL')+','+
                               IfThen(ACurrentFilter.Is_Smeta,IntToStr(ACurrentFilter.Id_smeta),'NULL')+','+
                               IfThen(ACurrentFilter.Is_Prikaz,''''+StringPrepareToQueryText(ACurrentFilter.Prikaz)+'''','NULL')+') ORDER BY FIO_TN';
  DSet.Open;
  PPeopleCount:=0;
  PRecordCount:=0;
  PSumma:=0;
  Id_man:=0;
  DSet.First;
  while not DSet.Eof do
   begin
    if ID_man<>DSet['ID_MAN'] then
     begin
      inc(PPeopleCount);
      ID_man:=DSet['ID_MAN'];
     end
    else
     begin
      if PFilter<>'' then PFilter:=PFilter+' or ';
      PFilter:=PFilter+'ID_MAN='+VarToStr(DSet['ID_MAN']);
     end;
    inc(PRecordCount);
    PSumma:=PSumma+DSet['SUMMA'];
    DSet.Next;
   end;
  DSet.First;
  DSet.Filter := PFilter;
  FilterBtn.Enabled := PRecordCount<>PPeopleCount;
  CloseWaitForm(wf);
//******************************************************************************
  LabelPeopleCount.Caption := GetConst('PeopleCount',tcLabel)+': '+IntToStr(PPeopleCount);
  LabelRecordCount.Caption := GetConst('RecordCount',tcLabel)+': '+IntToStr(PRecordCount);
  LabelCommonSumma.Caption := GetConst('Summa',tcButton)+': '+FloatToStrF(PSumma,ffFixed,16,2);
//******************************************************************************
cxSplitter3.CloseSplitter;
Bar:=TZBarLocate.Create(BarManager);
Bar.BorderStyle:=bbsNone;
Bar.DataSet:=DSet;

Bar.AddLocateItem('TN', GetConst('Tn',tcGridColumn),[loCaseInsensitive]);
Bar.AddLocateItem('FIO',GetConst('FIO',tcGridColumn),[loCaseInsensitive,loPartialKey]);
end;

procedure TFZLineCurrent.Grid1ClKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
AText := KodSetupToPeriod(StrToInt(AText),1);
end;

procedure TFZLineCurrent.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZLineCurrent.Grid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
 begin
  EditSmeta.DataBinding.DataSource:=nil;
  EditDepartment.DataBinding.DataSource:=nil;
  EditCategory.DataBinding.DataSource:=nil;
 end
else
 begin
  EditSmeta.DataBinding.DataSource:=DSource;
  EditDepartment.DataBinding.DataSource:=DSource;
  EditCategory.DataBinding.DataSource:=DSource;
 end;
end;

procedure TFZLineCurrent.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if DefaultTransaction.InTransaction then DefaultTransaction.Commit;
end;

procedure TFZLineCurrent.FilterBtnClick(Sender: TObject);
begin
 DSet.Filtered := not DSet.Filtered;
end;

procedure TFZLineCurrent.PanelGridFooterResize(Sender: TObject);
begin
LabelPeopleCount.Width:= PanelGridFooter.Width div 3;
LabelRecordCount.Left := LabelPeopleCount.Width;
LabelRecordCount.Width:= PanelGridFooter.Width div 3;
LabelCommonSumma.Left := LabelPeopleCount.Width+LabelRecordCount.Width;
LabelCommonSumma.Width:= PanelGridFooter.Width-LabelPeopleCount.Width-LabelRecordCount.Width;
end;

end.

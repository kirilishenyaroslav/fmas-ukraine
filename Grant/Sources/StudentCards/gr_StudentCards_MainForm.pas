unit gr_StudentCards_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, ZProc, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, dxBarExtItems, cxGridBandedTableView, cxClasses,
  gr_StudentCards_DM, gr_uCommonConsts, dxStatusBar,
  cxLabel, cxContainer, cxTextEdit, cxDBEdit, ExtCtrls, gr_uCommonProc,
  Dates,gr_uWaitForm, cxCheckBox, StdCtrls, Registry;
type
  TFStudentCards = class(TForm)
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
    Grid: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    GridDBTableView1DBShifr: TcxGridDBColumn;
    GridDBTableView1DBFio: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    GridDBTableView1DBINN: TcxGridDBColumn;
    GridDBTableView1DBDog: TcxGridDBColumn;
    dxStatusBar1: TdxStatusBar;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    AddManBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    LineViewBtn: TdxBarLargeButton;
    MonthesComboBox: TdxBarCombo;
    YearSpinEdit: TdxBarSpinEdit;
    dxBarStatic1: TdxBarStatic;
    dxBarStatic2: TdxBarStatic;
    dxBarStatic3: TdxBarStatic;
    YesUseBtn: TdxBarButton;
    FilterBtn: TdxBarButton;
    dxBarStatic4: TdxBarStatic;
    dxBarStatic5: TdxBarStatic;
    dxBarStatic6: TdxBarStatic;
    UseCotractsStatic: TdxBarStatic;
    NoUseBtn: TdxBarButton;
    CtrlInsertBtn: TdxBarLargeButton;
    dxBarStatic7: TdxBarStatic;
    CtrlUpdateBtn: TdxBarLargeButton;
    CtrlDeleteBtn: TdxBarLargeButton;
    CtrlDetailBtn: TdxBarLargeButton;
    AcctCardBtn: TdxBarLargeButton;
    dxBarStatic8: TdxBarStatic;
    BroadFilterBtn: TdxBarButton;
    BarDockControlFilter: TdxBarDockControl;
    SelectBtn: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    Panel1: TPanel;
    DBEditDep: TcxDBTextEdit;
    LabelDep: TcxLabel;
    Panel2: TPanel;
    LabelSearch: TLabel;
    SearchEdit: TcxTextEdit;
    procedure ExitBtnClick(Sender: TObject);
    procedure GridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure RefreshBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure GridDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure SelectBtnClick(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    DM:TDM;
    PLanguageIndex:Byte;
    PKodSetup: integer;
    PIsContract:boolean;
    PRes:Variant;
    SearchText:string;
    SearchType:boolean;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
    property Res:Variant read PRes;
  end;

implementation

{$R *.dfm}

constructor TFStudentCards.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
var i:byte;
    reg:TRegistry;
    Key:string;
begin
  inherited Create(AOwner);
  PLanguageIndex                := LanguageIndex;
  DM:=TDM.Create(AOwner,Db_Handle);
//******************************************************************************
  Caption:=StudentCards_Caption[PLanguageIndex];
  GridDBTableView1.DataController.DataSource:=DM.DSource1;
//******************************************************************************
  RefreshBtn.Caption:=RefreshBtn_Caption[PLanguageIndex];
  SelectBtn.Caption :=SelectBtn_Caption[PLanguageIndex];
  ExitBtn.Caption   :=ExitBtn_Caption[PLanguageIndex];
//******************************************************************************
  GridDBTableView1DBShifr.Caption:= GridClShifr_Caption[PLanguageIndex];
  GridDBTableView1DBDog.Caption := Foundation_Text[PLanguageIndex];
  GridDBTableView1DBFio.Caption  := GridClFIO_Caption[PLanguageIndex];
  GridDBTableView1DBINN.Caption  := GridClTin_Caption[PLanguageIndex];

  LabelDep.Caption                := LabelDepartment_Caption[PLanguageIndex];
  LabelSearch.Caption             := LabelFio_Caption[PLanguageIndex];

  FilterBtn.Caption             := FilterBtn_Caption[PLanguageIndex];
  MonthesComboBox.Caption       := LabelPeriod_Caption[PLanguageIndex];
  YesUseBtn.Caption             := '     '+Yes_Text[PLanguageIndex]+'     ';
  NoUseBtn.Caption              := '     '+No_text[PLanguageIndex]+'     ';
  UseCotractsStatic.Caption     := LabelShowContracts_Caption[PLanguageIndex]+':';
//******************************************************************************
  MonthesComboBox.Items.Text    := MonthesList_Text[PLanguageIndex];
  PKodSetup := grKodSetup(Db_Handle);

  Key := '\Software\Grant\StudentCards';
  reg := TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;
  if not reg.OpenKey(Key,False) then
    PIsContract := False
  else
  begin
    PIsContract := reg.ReadBool('IsContract');
    YesUseBtn.Down:=PIsContract
  end;
  Reg.Free;

  MonthesComboBox.ItemIndex := YearMonthFromKodSetup(PKodSetup,False)-1;
  YearSpinEdit.Value := YearMonthFromKodSetup(PKodSetup);
//******************************************************************************
  DBEditDep.DataBinding.DataField       := 'DEPORG';
  DBEditDep.DataBinding.DataSource      := DM.DSource1;
//******************************************************************************
  dxStatusBar1.Panels[0].Text:= 'F5-'+RefreshBtn.Caption;
  dxStatusBar1.Panels[1].Text:= 'Enter-'+SelectBtn.Caption;
  dxStatusBar1.Panels[2].Text:= 'Esc-'+ExitBtn.Caption;

  for i:=0 to dxStatusBar1.Panels.Count-1 do
    dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
  RefreshBtn.Click;
end;

procedure TFStudentCards.ExitBtnClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFStudentCards.GridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if AFocusedRecord=nil then
    SelectBtn.Enabled:=false
  else
    SelectBtn.Enabled:=true;
end;

procedure TFStudentCards.RefreshBtnClick(Sender: TObject);
var KodSetup: integer;
    IsContract: boolean;
    wf: TForm;
begin
  KodSetup := PeriodToKodSetup(YearSpinEdit.IntValue,MonthesComboBox.ItemIndex+1);
  IsContract := YesUseBtn.Down;
  with DM do
  begin
    PKodSetup:=KodSetup;
    PIsContract:=IsContract;
    DSet1.Close;
    DSet1.SQLs.SelectSQL.Text:='SELECT * FROM GR_STUDENT_CARDS_S('+IntToStr(KodSetup)+',null,null,'''+IfThen(PIsContract,'T','F')+''') order by FIO';
    wf:=ShowWaitForm(self,wfSelectData);
    DSet1.Open;
    if IsContract=true then
      GridDBTableView1DBDog.Visible:=true;
    CloseWaitForm(wf);
  end;
  GridDBTableView1.DataController.FocusedRowIndex:=0;
end;

procedure TFStudentCards.FormResize(Sender: TObject);
var i:byte;
begin
for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
end;

procedure TFStudentCards.GridDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
{If (Key in ['0'..'9']) then
  begin
   if (GridDBTableView1.OptionsBehavior.IncSearchItem <> GridDBTableView1DBShifr)then
    begin
     GridDBTableView1.Controller.IncSearchingText   := '';
     GridDBTableView1.OptionsBehavior.IncSearchItem := GridDBTableView1DBShifr;
    end
  end
 else
  if (GridDBTableView1.OptionsBehavior.IncSearchItem <> GridDBTableView1DBFIO)then
   begin
    GridDBTableView1.Controller.IncSearchingText   := '';
    GridDBTableView1.OptionsBehavior.IncSearchItem := GridDBTableView1DBFIO;
   end;}
end;

procedure TFStudentCards.SelectBtnClick(Sender: TObject);
begin
  PRes:=VarArrayCreate([0,2], varVariant);
  PRes[0]:=DM.DSet1['ID_MAN'];
  PRes[1]:=DM.DSet1['SHIFR'];
  PRes[2]:=DM.DSet1['FIO'];
  ModalResult:=mrYes;
end;

procedure TFStudentCards.cxTextEdit1PropertiesChange(Sender: TObject);
begin
  with GridDBTableView1.DataController.Filter.Root do
  begin
    Clear;
    SearchText:='%'+StringReplace(AnsiUpperCase(SearchEdit.Text),' ','%',[rfReplaceAll])+'%';
    if SearchEdit.Text <> '' then
    begin
      if(SearchType=true)then
        AddItem(GridDBTableView1DBShifr, foLike, SearchText, SearchEdit.Text)
      else
        AddItem(GridDBTableView1DBFio, foLike, SearchText, SearchEdit.Text)
    end;
    GridDBTableView1.DataController.Filter.Active:=true;
    GridDBTableView1.DataController.FocusedRowIndex:=0;
  end;
end;

procedure TFStudentCards.SearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if(key in ['0'..'9'])then
    SearchType:=true
  else
    SearchType:=false;
end;

procedure TFStudentCards.FormShow(Sender: TObject);
begin
 SearchEdit.SetFocus;
end;

procedure TFStudentCards.FormClose(Sender: TObject;
  var Action: TCloseAction);
var reg: TRegistry;
    Key:string;
begin
  Key := '\Software\Grant\StudentCards';
  reg:=TRegistry.Create;
  try
    reg.RootKey:=HKEY_CURRENT_USER;
    reg.OpenKey(Key,True);
    reg.WriteBool('IsContract',PIsContract);
  finally
    reg.Free;
  end;
end;

end.


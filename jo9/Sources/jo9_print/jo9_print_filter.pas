unit jo9_print_filter;
                                                        
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxRadioGroup, cxContainer,
  cxEdit, cxCheckBox, cxControls, cxGroupBox, DB, FIBDataSet, pFIBDataSet, IBase,
  tagTypes, RxMemDS, frxClass, frxDBSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, pFIBStoredProc, DBTables, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, dxBar, cxGridBandedTableView,
  ComCtrls, cxMemo, ActnList, cxSpinEdit;

type
  Tjo9_print_filter_Form = class(TForm)
    MainPanel: TPanel;
    Panel1: TPanel;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    FontButton: TcxButton;
    PageCheckBox: TcxCheckBox;
    FormatRadioGroup: TcxRadioGroup;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    RStGroupBox: TcxGroupBox;
    St_Label: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    R_Label: TLabel;
    RStCheckBox: TcxCheckBox;
    RStPanel: TPanel;
    RGrid: TcxGrid;
    RTableView: TcxGridTableView;
    idR_Column: TcxGridColumn;
    idSt_Column: TcxGridColumn;
    KodR_Column: TcxGridColumn;
    KodSt_Column: TcxGridColumn;
    NameR_Column: TcxGridColumn;
    NameSt_Column: TcxGridColumn;
    RGridLevel: TcxGridLevel;
    RStDockControl: TdxBarDockControl;
    SGroupBox: TcxGroupBox;
    SCheckBox: TcxCheckBox;
    SPanel: TPanel;
    SBarDockControl: TdxBarDockControl;
    SGrid: TcxGrid;
    STableView: TcxGridTableView;
    idSColumn: TcxGridColumn;
    KodSColumn: TcxGridColumn;
    NameSColumn: TcxGridColumn;
    SGridLevel: TcxGridLevel;
    MainGroupBox: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    FromLabel: TLabel;
    ToLabel: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    KrDbRadioGroup: TcxRadioGroup;
    CurOstRadioGroup: TcxRadioGroup;
    FromYearCombo: TcxComboBox;
    FromMonthCombo: TcxComboBox;
    ToMonthCombo: TcxComboBox;
    ToYearCombo: TcxComboBox;
    CustGroupBox: TcxGroupBox;
    CustCheckBox: TcxCheckBox;
    CustPanel: TPanel;
    CustBarDockControl: TdxBarDockControl;
    CustGrid: TcxGrid;
    CustTableView: TcxGridTableView;
    idCustColumn: TcxGridColumn;
    CustNameColumn: TcxGridColumn;
    CustGridLevel: TcxGridLevel;
    TabSheet2: TTabSheet;
    KEKVGroupBox: TcxGroupBox;
    KEKVCheckBox: TcxCheckBox;
    KEKVPanel: TPanel;
    KEKVDockControl: TdxBarDockControl;
    KEKVGrid: TcxGrid;
    KEKVTableView: TcxGridTableView;
    idKEKV_Column: TcxGridColumn;
    kodKEKV_Column: TcxGridColumn;
    NameKEKV_Column: TcxGridColumn;
    KEKVGridLevel: TcxGridLevel;
    NSchGroupBox: TcxGroupBox;
    NSchCheckBox: TcxCheckBox;
    NSchPanel: TPanel;
    NSchGrid: TcxGrid;
    NSchTableView: TcxGridTableView;
    idNSch_Column: TcxGridColumn;
    CheckNSch_Column: TcxGridColumn;
    NumNSch_Column: TcxGridColumn;
    NameNSch_Column: TcxGridColumn;
    NSchLevel: TcxGridLevel;
    OtherGroupBox: TcxGroupBox;
    MemoRadioGroup: TcxRadioGroup;
    MemoCheckBox: TcxCheckBox;
    JO9GroupBox: TcxGroupBox;
    JO9CheckBox: TcxCheckBox;
    JO9_DB_CheckBox: TcxCheckBox;
    JO9_KR_CheckBox: TcxCheckBox;
    GrGroupBox: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GrFst: TcxComboBox;
    GrSnd: TcxComboBox;
    GrTrd: TcxComboBox;
    GrFth: TcxComboBox;
    MemoFilter: TcxMemo;
    cbGroupByTypeDog: TcxCheckBox;
    CSchGroupBox: TcxGroupBox;
    CSchCheckBox: TcxCheckBox;
    CSchPanel: TPanel;
    CSchGrid: TcxGrid;
    CSchTableView: TcxGridTableView;
    idCSch_Column: TcxGridColumn;
    CheckCSch_Column: TcxGridColumn;
    NumCSch_Column: TcxGridColumn;
    NameCSch_Column: TcxGridColumn;
    CSchGridLevel: TcxGridLevel;
    TabSheet3: TTabSheet;
    cxGroupBox1: TcxGroupBox;
    OstKindRadioGroup: TcxRadioGroup;
    OstDbKrRadioGroup: TcxRadioGroup;
    OstDateGroupBox: TcxGroupBox;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    OstMonthComboBox: TcxComboBox;
    OstYearComboBox: TcxComboBox;
    OstGroupBox: TcxGroupBox;
    OstShowMonthLabel: TLabel;
    ShowSmCheckBox: TcxCheckBox;
    OstSmRadioGroup: TcxRadioGroup;
    OstShowMonthSpinEdit: TcxSpinEdit;
    OstShowMonthCheckBox: TcxCheckBox;
    ShowOnlySelYearCheckBox: TcxCheckBox;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StyleRepository: TcxStyleRepository;
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
    GridTableViewStyleSheet: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheet: TcxGridBandedTableViewStyleSheet;
    BarManager: TdxBarManager;
    AddCust: TdxBarButton;
    DelCust: TdxBarButton;
    AddS: TdxBarButton;
    DelS: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    FontDialog: TFontDialog;
    DataSet: TpFIBDataSet;
    ActionList1: TActionList;
    Action1: TAction;
    TabSheet4: TTabSheet;
    MOGroupBox: TcxGroupBox;
    MOGrid: TcxGrid;
    MOTableView: TcxGridTableView;
    ID_PKV_Column: TcxGridColumn;
    CheckMO_Column: TcxGridColumn;
    MO_CHAR_Column: TcxGridColumn;
    PKV_KOD_Column: TcxGridColumn;
    MOGridLevel: TcxGridLevel;
    ID_TYPE_FINANCE_Column: TcxGridColumn;
    PKV_TITLE_Column: TcxGridColumn;
    TYPE_FINANCE_CODE_Column: TcxGridColumn;
    TYPE_FINANCE_NAME_Column: TcxGridColumn;
    cbCommit: TcxCheckBox;
    cb_svod: TcxCheckBox;
    Ds_Customer_dog: TpFIBDataSet;
    rxMem: TRxMemoryData;
    cxGridDog: TcxGrid;
    cxDogTableView: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    cxGridColumn3: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    cxDogTableViewColumn1: TcxGridColumn;
    cxDogTableViewColumn2: TcxGridColumn;
    cxDogTableViewColumn3: TcxGridColumn;
    procedure CancelButtonClick(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure CustCheckBoxPropertiesChange(Sender: TObject);
    procedure SCheckBoxPropertiesChange(Sender: TObject);
    procedure FontButtonClick(Sender: TObject);
    procedure FromYearComboPropertiesChange(Sender: TObject);
    procedure ToYearComboPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddCustClick(Sender: TObject);
    procedure AddSClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DelSClick(Sender: TObject);
    procedure DelCustClick(Sender: TObject);
    procedure RStCheckBoxPropertiesChange(Sender: TObject);
    procedure RTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Action1Execute(Sender: TObject);
    procedure NSchCheckBoxPropertiesChange(Sender: TObject);
    procedure CSchCheckBoxPropertiesChange(Sender: TObject);
    procedure KEKVCheckBoxPropertiesChange(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure MemoCheckBoxPropertiesChange(Sender: TObject);
    procedure JO9CheckBoxPropertiesChange(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure GrFstPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarButton4Click(Sender: TObject);
    procedure cbRepOutKindKeyPress(Sender: TObject; var Key: Char);
    procedure ShowSmCheckBoxPropertiesChange(Sender: TObject);
    procedure OstShowMonthCheckBoxPropertiesChange(Sender: TObject);
    procedure OstYearComboBoxPropertiesChange(Sender: TObject);
    procedure OstShowMonthSpinEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure FormResize(Sender: TObject);
    procedure PageControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure PageControlChange(Sender: TObject);
    procedure MOTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxNumDogPropertiesChange(Sender: TObject);
    procedure cb_svodPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
   SYS_INFO  : Pjo9_SYS_INFO;
   PrintKind : TJO9_Report_Kind;

   Old_Date_Beg : variant;
   Old_Date_End : variant;

   is_empty:Integer;

   PFilter   : TFilterRecord;
   procedure InitConnection(DBhandle: TISC_DB_HANDLE; RTransaction: TISC_TR_HANDLE);
   function  SaveFilter : boolean;
   function  MakeNoteFilter : TStringArray;
   procedure SelectMO;
  end;

procedure  CreateFilter(AOwner : TComponent; DBhandle: TISC_DB_HANDLE; RTransaction: TISC_TR_HANDLE;
          INFO : Pjo9_SYS_INFO; PrintKind : TJO9_Report_Kind; fs : TFormStyle);

var
  jo9_print_filter_Form : Tjo9_print_filter_Form;

implementation

uses DateUtils, Math, Wait, DogLoaderUnit, GlobalSPR, jo9_Print, tagLibUnit;

{$R *.dfm}

{ Tjo9_print_filter_Form }

procedure Tjo9_print_filter_Form.InitConnection(DBhandle: TISC_DB_HANDLE;
  RTransaction: TISC_TR_HANDLE);
begin
 Database.Handle        := DBhandle;
 ReadTransaction.Handle := RTransaction;

 DataSet.SelectSQL.Text := 'select * from PUB_SYS_DATA';
 DataSet.Open;
 DataSet.Close;
end;

procedure Tjo9_print_filter_Form.CancelButtonClick(Sender: TObject);
begin
 if fsModal in FormState then ModalResult := mrCancel
 else Close;
end;

procedure Tjo9_print_filter_Form.ApplyButtonClick(Sender: TObject);
begin
 if not SaveFilter then Exit;

 DoPrintReportEx(Self, PFilter, Database.Handle, ReadTransaction.Handle, SYS_INFO);
end;

procedure Tjo9_print_filter_Form.CustCheckBoxPropertiesChange(
  Sender: TObject);
begin
 BarManager.BarByName('CustToolBar').Visible := CustCheckBox.Checked;
 CustGrid.Enabled                            := CustCheckBox.Checked;
end;

procedure Tjo9_print_filter_Form.SCheckBoxPropertiesChange(
  Sender: TObject);
begin
 BarManager.BarByName('SToolBar').Visible := SCheckBox.Checked;
 SGrid.Enabled                            := SCheckBox.Checked;
end;

procedure Tjo9_print_filter_Form.FontButtonClick(Sender: TObject);
begin
 if not FontDialog.Execute then Exit;

 PFilter._Font_Name := FontDialog.Font.Name;
 PFilter._Font_Size := FontDialog.Font.Size;
end;

procedure Tjo9_print_filter_Form.FromYearComboPropertiesChange(
  Sender: TObject);
var
 i : integer;
 m : integer;
begin
 FromMonthCombo.Properties.Items.Clear;

 if (StrToInt(FromYearCombo.Text) = SYS_INFO^._Year) and (SYS_INFO^._Month <= 12) then begin
  m := -1;

  if StrToInt(FromYearCombo.Text) = YearOf(SYS_INFO^._Sys_Beg) then begin
   for i := MonthOf(SYS_INFO^._Sys_Beg) to SYS_INFO^._Month + SYS_INFO^._Show_Months do begin
    if i > 12 then Break;

    if i < 10 then FromMonthCombo.Properties.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else FromMonthCombo.Properties.Items.Add(IntToStr(i) + '-' + GetMonthName(i));

    if i = SYS_INFO^._Month then m := FromMonthCombo.Properties.Items.Count - 1;
   end;
  end
  else begin
   for i := 1 to SYS_INFO^._Month + SYS_INFO^._Show_Months do begin
    if i > 12 then Break;

    if i < 10 then FromMonthCombo.Properties.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else FromMonthCombo.Properties.Items.Add(IntToStr(i) + '-' + GetMonthName(i));

    if i = SYS_INFO^._Month then m := FromMonthCombo.Properties.Items.Count - 1;
   end;
  end;

  FromMonthCombo.ItemIndex := m;
 end
 else begin
  if (StrToInt(FromYearCombo.Text) = SYS_INFO^._Year + 1) and (SYS_INFO^._Month + SYS_INFO^._Show_Months > 12) then
   for i := 1 to SYS_INFO^._Month + SYS_INFO^._Show_Months - 12 do
    if i < 10 then FromMonthCombo.Properties.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else FromMonthCombo.Properties.Items.Add(IntToStr(i) + '-' + GetMonthName(i))
  else if StrToInt(FromYearCombo.Text) = YearOf(SYS_INFO^._Sys_Beg) then
   for i := MonthOf(SYS_INFO^._Sys_Beg) to 12 do
    if i < 10 then FromMonthCombo.Properties.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else FromMonthCombo.Properties.Items.Add(IntToStr(i) + '-' + GetMonthName(i))
  else
   for i := 1 to 12 do
    if i < 10 then FromMonthCombo.Properties.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else FromMonthCombo.Properties.Items.Add(IntToStr(i) + '-' + GetMonthName(i));

  FromMonthCombo.ItemIndex := 0;
 end;
end;

procedure Tjo9_print_filter_Form.ToYearComboPropertiesChange(
  Sender: TObject);
var
 i : integer;
 m : integer;
begin
 ToMonthCombo.Properties.Items.Clear;

 if (StrToInt(ToYearCombo.Text) = SYS_INFO^._Year) and (SYS_INFO^._Month <= 12) then begin
  m := -1;

  if StrToInt(ToYearCombo.Text) = YearOf(SYS_INFO^._Sys_Beg) then begin
   for i := MonthOf(SYS_INFO^._Sys_Beg) to SYS_INFO^._Month + SYS_INFO^._Show_Months do begin
    if i > 12 then Break;

    if i < 10 then ToMonthCombo.Properties.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else ToMonthCombo.Properties.Items.Add(IntToStr(i) + '-' + GetMonthName(i));

    if i = SYS_INFO^._Month then m := ToMonthCombo.Properties.Items.Count - 1;
   end;
  end
  else begin
   for i := 1 to SYS_INFO^._Month + SYS_INFO^._Show_Months do begin
    if i > 12 then Break;

    if i < 10 then ToMonthCombo.Properties.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else ToMonthCombo.Properties.Items.Add(IntToStr(i) + '-' + GetMonthName(i));

    if i = SYS_INFO^._Month then m := ToMonthCombo.Properties.Items.Count - 1;
   end;
  end;

  ToMonthCombo.ItemIndex := m;
 end
 else begin
  if (StrToInt(ToYearCombo.Text) = SYS_INFO^._Year + 1) and (SYS_INFO^._Month + SYS_INFO^._Show_Months > 12) then
   for i := 1 to SYS_INFO^._Month + SYS_INFO^._Show_Months - 12 do
    if i < 10 then ToMonthCombo.Properties.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else ToMonthCombo.Properties.Items.Add(IntToStr(i) + '-' + GetMonthName(i))
  else if StrToInt(ToYearCombo.Text) = YearOf(SYS_INFO^._Sys_Beg) then
   for i := MonthOf(SYS_INFO^._Sys_Beg) to 12 do
    if i < 10 then ToMonthCombo.Properties.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else ToMonthCombo.Properties.Items.Add(IntToStr(i) + '-' + GetMonthName(i))
  else
   for i := 1 to 12 do
    if i < 10 then ToMonthCombo.Properties.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else ToMonthCombo.Properties.Items.Add(IntToStr(i) + '-' + GetMonthName(i));

  ToMonthCombo.ItemIndex := 0;
 end;
end;

procedure Tjo9_print_filter_Form.FormShow(Sender: TObject);
var
 i : integer;
begin
FormResize(Sender);

 CustCheckBoxPropertiesChange(Sender);
 SCheckBoxPropertiesChange(Sender);
 RStCheckBoxPropertiesChange(Sender);
 ShowSmCheckBoxPropertiesChange(Sender);
 KEKVCheckBoxPropertiesChange(Sender);
 JO9CheckBoxPropertiesChange(Sender);
 MemoCheckBoxPropertiesChange(Sender);
 OstShowMonthCheckBoxPropertiesChange(Sender);

 DataSet.SelectSQL.Text := 'select * from pub_sys_data';
 DataSet.Open;
 DataSet.Close;

 for i := YearOf(SYS_INFO^._Sys_Beg) to SYS_INFO^._Year + Trunc((SYS_INFO^._Month + SYS_INFO^._Show_Months) / 12) do begin
  FromYearCombo.Properties.Items.Add(IntToStr(i));
  ToYearCombo.Properties.Items.Add(IntToStr(i));

  if i <= SYS_INFO^._Year then OstYearComboBox.Properties.Items.Add(IntToStr(i));

  if i = SYS_INFO^._Year then begin
   FromYearCombo.ItemIndex    := FromYearCombo.Properties.Items.Count - 1;
   ToYearCombo.ItemIndex      := ToYearCombo.Properties.Items.Count - 1;
   OstYearComboBox.ItemIndex  := OstYearComboBox.Properties.Items.Count - 1;
  end;
 end;

 OstShowMonthSpinEdit.Properties.MaxValue := SYS_INFO^._Year;
 OstShowMonthSpinEdit.Value := SYS_INFO^._Year;

 Caption := 'Формування фільтру друку';

 FormatRadioGroup.Visible := False;
 PageControl.Pages[2].TabVisible := False;
 PageControl.Pages[3].TabVisible := False;
 cxGridDog.visible:=False;

 if ((PrintKind = JO9_REPORT_MAIN)or (PrintKind = JO9_AKT_SVERKI)) then begin
  if PrintKind = JO9_AKT_SVERKI then
  begin
  Caption := Caption + ' акта взіємних розрахунків';
  cb_svod.Visible:=True;
  cb_svod.Checked:=True;
  PFilter._PrintSvodTable:=True;
  PFilter._PaperFormat := pfA4;
  FormatRadioGroup.Enabled:=False;
  FormatRadioGroup.ItemIndex := 1;
  cbGroupByTypeDog.Enabled:=False;
  cxGridDog.visible:=True;
  end
  else
  begin
  Caption := Caption + ' журнала ордера';
  cb_svod.Visible:=False;
  cb_svod.Checked:=False;
  PFilter._PrintSvodTable:=False;
  FormatRadioGroup.Enabled:=True;
  FormatRadioGroup.ItemIndex := 0;
  cbGroupByTypeDog.Enabled:=True;

  end;
  FormatRadioGroup.Visible:=True;

  KrDbRadioGroup.Enabled     := False;
  KrDbRadioGroup.ItemIndex   := -1;
  CurOstRadioGroup.Enabled   := False;
  CurOstRadioGroup.ItemIndex := -1;

  FromLabel.Visible    := True;
  ToLabel.Visible      := True;
  ToYearCombo.Visible  := True;
  ToMonthCombo.Visible := True;
  Label6.Visible       := True;
  Label7.Visible       := True;

  CustCheckBox.Enabled := True;
  SCheckBox.Enabled    := True;
  RStCheckBox.Enabled  := True;

  MemoCheckBox.Enabled := False;

   GrGroupBox.Visible   := False;

  cbGroupByTypeDog.Visible := True;

  PageControl.Pages[1].TabVisible := True;
 end
 else if ((PrintKind = JO9_REPORT_MAIN_MO)or(PrintKind = JO9_REPORT_MAIN_MO_2011)or(PrintKind = JO9_REPORT_MAIN_MO_BASE_2011)) then begin

  Caption := Caption + ' меморіального ордера';

  KrDbRadioGroup.Enabled     := False;
  KrDbRadioGroup.ItemIndex   := -1;
  CurOstRadioGroup.Enabled   := False;
  CurOstRadioGroup.ItemIndex := -1;

  FromLabel.Visible    := True;
  ToLabel.Visible      := True;
  ToYearCombo.Visible  := True;
  ToMonthCombo.Visible := True;
  Label6.Visible       := True;
  Label7.Visible       := True;

  CustCheckBox.Enabled := True;
  SCheckBox.Enabled    := True;
  RStCheckBox.Enabled  := True;

  MemoCheckBox.Enabled := False;

  FormatRadioGroup.Visible   := True;
  FormatRadioGroup.ItemIndex := 0;

  GrGroupBox.Visible   := False;

  cbGroupByTypeDog.Visible := True;

  PageControl.Pages[1].TabVisible := True;
  PageControl.Pages[3].TabVisible := True;
 end
 else if (PrintKind = JO9_REPORT_SCH)    or (PrintKind = JO9_REPORT_SCH_CUR)
      or (PrintKind = JO9_REPORT_SCH_MO) or (PrintKind = JO9_REPORT_SCH_CUR_MO)
 then begin
  if (PrintKind = JO9_REPORT_SCH_MO) or (PrintKind = JO9_REPORT_SCH_CUR_MO) then begin
   Caption := Caption + ' МО: ';
   PageControl.Pages[3].TabVisible := True;
  end;

  if PrintKind = JO9_REPORT_SCH then begin
   Caption := Caption + ' аналітичної відомості руху коштів по рахунках';
   KrDbRadioGroup.Enabled   := False;
   KrDbRadioGroup.ItemIndex := -1;
   cbGroupByTypeDog.Visible := True;
  end
  else begin
   Caption := Caption + ' розшифровки рахунків';
   KrDbRadioGroup.Enabled   := True;
   KrDbRadioGroup.ItemIndex := 0;
   cbGroupByTypeDog.Visible := False;
  end;

  CurOstRadioGroup.Enabled   := False;
  CurOstRadioGroup.ItemIndex := -1;

  MemoCheckBox.Enabled := False;
  JO9CheckBox.Enabled  := False;

  GrGroupBox.Visible   := False;

  PageControl.Pages[1].TabVisible := True;
 end
 else if (PrintKind = JO9_REPORT_REG) or (PrintKind = JO9_REPORT_REG_MO) or (PrintKind = JO9_REPORT_REG_EX) then begin
  if (PrintKind = JO9_REPORT_REG_MO) then begin
   Caption := Caption + ' МО: ';
   PageControl.Pages[3].TabVisible := True;
  end;

  if PrintKind = JO9_REPORT_REG_EX then
   Caption := Caption + ' Реєстр документів з групуванням'
  else
  begin
   Caption := Caption + ' Реєстр документів';
   cxGridDog.Visible:=True;
  end;

  KrDbRadioGroup.Enabled     := True;
  KrDbRadioGroup.ItemIndex   := 0;
  CurOstRadioGroup.Enabled   := PrintKind <> JO9_REPORT_REG_EX;
  CurOstRadioGroup.ItemIndex := 0;

  FromLabel.Visible    := True;
  ToLabel.Visible      := True;
  ToYearCombo.Visible  := True;
  ToMonthCombo.Visible := True;
  Label6.Visible       := True;
  Label7.Visible       := True;

  CustCheckBox.Enabled := True;
  SCheckBox.Enabled    := True;
  RStCheckBox.Enabled  := True;

  MemoCheckBox.Enabled     := True;
  JO9CheckBox.Enabled      := False;
  cbGroupByTypeDog.Visible := False;

  FormatRadioGroup.Visible   := True;
  FormatRadioGroup.ItemIndex := 0;

  GrGroupBox.Visible   := False;

  if PrintKind = JO9_REPORT_REG_EX then begin
   cbGroupByTypeDog.Visible := True;
   cbGroupByTypeDog.Properties.Caption := 'Групувати по кошторису';
   FormatRadioGroup.ItemIndex := 1;
   FormatRadioGroup.Enabled   := False;
  end;

  PageControl.Pages[1].TabVisible := True;
 end
 else if (PrintKind = JO9_REPORT_SCH_GRP) or (PrintKind = JO9_REPORT_SCH_GRP_MO) then begin
  if (PrintKind = JO9_REPORT_SCH_GRP_MO) then begin
   Caption := Caption + ' МО: ';
   PageControl.Pages[3].TabVisible := True;
  end;

  Caption := Caption + ' Розшифровка рахунків по статтям витрат';

  KrDbRadioGroup.Enabled     := False;
  KrDbRadioGroup.ItemIndex   := -1;
  CurOstRadioGroup.Enabled   := False;
  CurOstRadioGroup.ItemIndex := -1;

  FromLabel.Visible    := True;
  ToLabel.Visible      := True;
  ToYearCombo.Visible  := True;
  ToMonthCombo.Visible := True;
  Label6.Visible       := True;
  Label7.Visible       := True;

  MemoCheckBox.Enabled := False;
  JO9CheckBox.Enabled  := False;

  GrGroupBox.Visible       := True;
  cbGroupByTypeDog.Visible := False;

  GrFst.ItemIndex := 0;
  GrSnd.ItemIndex := 1;
  GrTrd.ItemIndex := 2;
  GrFth.ItemIndex := 3;

  PageControl.Pages[1].TabVisible := True;
 end
 else if PrintKind = JO9_REPORT_OST then begin
  Caption := Caption + ' заборгованості контрагентів у розрізі років';

  PageControl.Pages[0].TabVisible := False;
  PageControl.Pages[1].TabVisible := False;
  PageControl.Pages[2].TabVisible := True;
 end;

 ApplyButton.SetFocus;
end;

procedure Tjo9_print_filter_Form.AddCustClick(Sender: TObject);
var
 id : variant;
 i  : integer;
// i, o : TSpravParams;
begin

{ i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase']     := Integer(Database.Handle);
 i['FormStyle']    := fsNormal;
 i['bMultiSelect'] := true;
 i['id_session']   := -1;
 i['SelectMode']   := selCustomer;
 i['show_all']     := 1;
 LoadSprav('Customer\CustPackage.bpl', Self, i, o);

 if o['ModalResult'] = mrOk then begin
  id_Customer := o['ID_CUSTOMER'];

  if  not VarIsNull(o['ID_RATE_ACCOUNT']) then
   id_Rate_Acc := o['ID_RATE_ACCOUNT']
  else id_Rate_Acc := -1;

   if  not VarIsNull(o['RATE_ACCOUNT']) then
    Rate_Acc.Text := o['RATE_ACCOUNT']
   else Rate_Acc.Text := '';

   if  not VarIsNull(o['MFO']) then
    MFO.Text := o['MFO']
   else MFO.Text := '';

   if  not VarIsNull(o['NAME_BANK']) then
    Name_Bank.Text := o['NAME_BANK']
   else Name_Bank.Text  := '';

   NameCust.Text   := o['NAME_CUSTOMER'];
   Kod_EDRPOU.Text := o['KOD_EDRPOU'];
 end;

 i.Free;
 o.Free; }











 id := ShowCustomers(Self, Database.Handle, fsNormal, Now, csmCustomers, -1, -1, True);

 if VarArrayDimCount(id) <= 0 then Exit;
 if id[0] = NULL then Exit;

 with CustTableView.DataController do begin
  RecordCount := 0;

  for i := 0 to VarArrayHighBound(id, 1) do begin
   if VarIsNull(id[i]) then Continue;

   DataSet.SelectSQL.Text := 'select NAME_CUSTOMER from PUB_SP_CUSTOMER where ID_CUSTOMER=' + IntToStr(id[i]);
   DataSet.Open;

   if VarIsNull(DataSet['NAME_CUSTOMER']) then begin
    DataSet.Close;
    Continue;
   end;

   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 0] := id[i];
   Values[RecordCount - 1, 1] := DataSet['NAME_CUSTOMER'];

   DataSet.Close;
  end;
 end;

 CustGrid.SetFocus;
end;

procedure Tjo9_print_filter_Form.AddSClick(Sender: TObject);
var
 id          : variant;
 Actual_Date : TDate;
 i           : integer;
 Month       : string;
begin
 if (FromYearCombo.Text = '') or (FromMonthCombo.ItemIndex < 0) then begin
  ShowMessage('Оберіть період фільтру!');
  Exit;
 end;

 Month := Copy(FromMonthCombo.Text, 1, 2);
 Actual_Date := EncodeDate(StrToInt(FromYearCombo.Text), StrToInt(Month), 1);

 id := GlobalSPR.GetSmets(self, Database.Handle, Actual_Date, psmSmetWithoutPeriod);

 if VarArrayDimCount(id) <= 0 then Exit;
 if id[0] = NULL then Exit;

 with STableView.DataController do begin
  for i := 0 to RecordCount - 1 do
   if Values[i, 0] = id[0] then begin
    FocusedRecordIndex := i;
    Exit;
   end;

  RecordCount := RecordCount + 1;

  Values[RecordCount - 1, 0] := id[0];
  Values[RecordCount - 1, 1] := id[3];
  Values[RecordCount - 1, 2] := id[2];

  FocusedRecordIndex := RecordCount - 1;
 end;

 SGrid.SetFocus;
end;

procedure Tjo9_print_filter_Form.FormCreate(Sender: TObject);
begin
 idCustColumn.DataBinding.ValueTypeClass   := TcxVariantValueType;
 CustNameColumn.DataBinding.ValueTypeClass := TcxVariantValueType;

 idSColumn.DataBinding.ValueTypeClass   := TcxVariantValueType;
 KodSColumn.DataBinding.ValueTypeClass  := TcxVariantValueType;
 NameSColumn.DataBinding.ValueTypeClass := TcxVariantValueType;

 idR_Column.DataBinding.ValueTypeClass      := TcxVariantValueType;
 idSt_Column.DataBinding.ValueTypeClass     := TcxVariantValueType;
 KodR_Column.DataBinding.ValueTypeClass     := TcxVariantValueType;
 KodSt_Column.DataBinding.ValueTypeClass    := TcxVariantValueType;
 NameR_Column.DataBinding.ValueTypeClass    := TcxVariantValueType;
 NameSt_Column.DataBinding.ValueTypeClass   := TcxVariantValueType;

 idNSch_Column.DataBinding.ValueTypeClass    := TcxIntegerValueType;
 CheckNSch_Column.DataBinding.ValueTypeClass := TcxIntegerValueType;
 NumNSch_Column.DataBinding.ValueTypeClass   := TcxStringValueType;
 NameNSch_Column.DataBinding.ValueTypeClass  := TcxStringValueType;

 idCSch_Column.DataBinding.ValueTypeClass    := TcxIntegerValueType;
 CheckCSch_Column.DataBinding.ValueTypeClass := TcxIntegerValueType;
 NumCSch_Column.DataBinding.ValueTypeClass   := TcxStringValueType;
 NameCSch_Column.DataBinding.ValueTypeClass  := TcxStringValueType;

 idKEKV_Column.DataBinding.ValueTypeClass    := TcxIntegerValueType;
 kodKEKV_Column.DataBinding.ValueTypeClass   := TcxIntegerValueType;
 NameKEKV_Column.DataBinding.ValueTypeClass  := TcxStringValueType;

 cxDogTableView.Items[0].DataBinding.ValueTypeClass := TcxFloatValueType;
 cxDogTableView.Items[1].DataBinding.ValueTypeClass := TcxIntegerValueType;
 cxDogTableView.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 cxDogTableView.Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
 cxDogTableView.Items[4].DataBinding.ValueTypeClass := TcxStringValueType;
 cxDogTableView.Items[5].DataBinding.ValueTypeClass := TcxFloatValueType;

 CheckMO_Column.DataBinding.ValueTypeClass           := TcxIntegerValueType;
 MO_CHAR_Column.DataBinding.ValueTypeClass           := TcxStringValueType;
 PKV_KOD_Column.DataBinding.ValueTypeClass           := TcxStringValueType;
 ID_PKV_Column.DataBinding.ValueTypeClass            := TcxIntegerValueType;
 ID_TYPE_FINANCE_Column.DataBinding.ValueTypeClass   := TcxIntegerValueType;
 PKV_TITLE_Column.DataBinding.ValueTypeClass         := TcxStringValueType;
 TYPE_FINANCE_CODE_Column.DataBinding.ValueTypeClass := TcxIntegerValueType;
 TYPE_FINANCE_NAME_Column.DataBinding.ValueTypeClass := TcxStringValueType;

 R_Label.Caption  := '';
 St_Label.Caption := '';

 cbCommit.Visible := ADMIN_MODE;

 PageControl.ActivePageIndex := 0;    
 //sendMessage(Self.Handle, wm_size, SIZE_MAXIMIZED,0);
 // WindowState:=wsMinimized;
end;

procedure Tjo9_print_filter_Form.DelSClick(Sender: TObject);
var
 k : integer;
begin
 with STableView.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

  DeleteRecord(k);
 end;

 SGrid.SetFocus;
end;

procedure Tjo9_print_filter_Form.DelCustClick(Sender: TObject);
var
 k : integer;
begin
 with CustTableView.DataController do begin
  k := FocusedRecordIndex;

  if k < 0 then Exit;

  DeleteRecord(k);
 end;

 CustGrid.SetFocus;
end;

procedure Tjo9_print_filter_Form.dxBarButton4Click(Sender: TObject);
var
 k : integer;
begin
 with RTableView.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

  DeleteRecord(k);
 end;

 RGrid.SetFocus;
end;

procedure CreateFilter(AOwner: TComponent; DBhandle: TISC_DB_HANDLE; RTransaction: TISC_TR_HANDLE;
  INFO: Pjo9_SYS_INFO; PrintKind: TJO9_Report_Kind; fs : TFormStyle);
var
 F : Tjo9_print_filter_Form;
begin
 F := Tjo9_print_filter_Form.Create(AOwner);
 F.SYS_INFO := INFO;

 F.InitConnection(DBHandle, RTransaction);
 F.PrintKind  := PrintKind;
 F.FormStyle  := fs;

 GetFormParams(F);

 if fs = fsNormal then f.ShowModal
 else F.Show;
end;

procedure Tjo9_print_filter_Form.RStCheckBoxPropertiesChange(
  Sender: TObject);
begin
 if not RStCheckBox.Checked then begin
  BarManager.BarByName('RStToolBar').Visible := False;
  RGrid.Enabled := False;
  Exit;
 end;

 if (FromYearCombo.ItemIndex < 0) or (ToYearCombo.ItemIndex < 0)
 or (FromMonthCombo.Text = '')    or (ToMonthCombo.Text = '') then begin
  ShowMessage('Оберіть період фільтру!');
  Exit;
 end;

 BarManager.BarByName('RStToolBar').Visible := True;
 RGrid.Enabled := True;

 RGrid.SetFocus;
end;

procedure Tjo9_print_filter_Form.RTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
 k : integer;
begin
 R_Label.Caption    := '';
 St_Label.Caption   := '';

 k := RTableView.DataController.FocusedRecordIndex;
 if k >= 0 then begin
  with RTableView.DataController do begin
   if not VarIsNull(Values[k, 4]) then R_Label.Caption  := Values[k, 4];
   if not VarIsNull(Values[k, 5]) then St_Label.Caption := Values[k, 5];
  end;
 end;

 R_Label.Hint  := R_Label.Caption;
 St_Label.Hint := St_Label.Caption;
end;

procedure Tjo9_print_filter_Form.Action1Execute(Sender: TObject);
begin
 ApplyButtonClick(Sender);
end;

procedure Tjo9_print_filter_Form.NSchCheckBoxPropertiesChange(
  Sender: TObject);
begin
 NSchGrid.Enabled := NSchCheckBox.Checked;

 if not NSchCheckBox.Checked then Exit;

{ if (FromYearCombo.ItemIndex < 0) or (ToYearCombo.ItemIndex < 0)
 or (FromMonthCombo.Text = '')    or (ToMonthCombo.Text = '') then begin
  ShowMessage('Оберіть період фільтру!');
  Exit;
 end;}

 NSchTableView.DataController.RecordCount := 0;

 DataSet.SelectSQL.Text := 'select * from JO9_FILTER_SEL_SCH('
 + IntToStr(SYS_INFO^._id_Reg_Uch) + ','
 + QuotedStr(DateToStr(SYS_INFO^._Period_Beg)) + ')';

 DataSet.Open;

 while not DataSet.Eof do begin
  with NSchTableView.DataController do begin
   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 0] := DataSet.FieldByName('ID_SCH').AsInteger;
   Values[RecordCount - 1, 1] := 0;
   Values[RecordCount - 1, 2] := DataSet.FieldByName('NUM_SCH').AsString;
   Values[RecordCount - 1, 3] := DataSet.FieldByName('NAME_SCH').AsString;
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 NSchGrid.SetFocus;
end;

procedure Tjo9_print_filter_Form.CSchCheckBoxPropertiesChange(
  Sender: TObject);
begin
 CSchGrid.Enabled := CSchCheckBox.Checked;

 if not CSchCheckBox.Checked then Exit;

{ if (FromYearCombo.ItemIndex < 0) or (ToYearCombo.ItemIndex < 0)
 or (FromMonthCombo.Text = '')    or (ToMonthCombo.Text = '') then begin
  ShowMessage('Оберіть період фільтру!');
  Exit;
 end;}

 CSchTableView.DataController.RecordCount := 0;

 DataSet.SelectSQL.Text := 'select * from JO9_FILTER_SEL_SCH_COR('
 + IntToStr(SYS_INFO^._id_Reg_Uch) + ','
 + QuotedStr(DateToStr(SYS_INFO^._Period_Beg)) + ')';

 DataSet.Open;

 CSchTableView.BeginUpdate;

 while not DataSet.Eof do begin
  with CSchTableView.DataController do begin
   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 0] := DataSet.FieldByName('ID_SCH').AsInteger;
   Values[RecordCount - 1, 1] := 0;
   Values[RecordCount - 1, 2] := DataSet.FieldByName('NUM_SCH').AsString;
   Values[RecordCount - 1, 3] := DataSet.FieldByName('NAME_SCH').AsString;
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 CSchTableView.EndUpdate;

 CSchGrid.SetFocus;
end;

procedure Tjo9_print_filter_Form.KEKVCheckBoxPropertiesChange(
  Sender: TObject);
begin
 BarManager.BarByName('KEKVToolBar').Visible := KEKVCheckBox.Checked;
 KEKVGrid.Enabled                            := KEKVCheckBox.Checked;
end;

procedure Tjo9_print_filter_Form.dxBarButton1Click(Sender: TObject);
var
 id          : variant;
 Actual_Date : TDate;
 i           : integer;
 Month       : string;
begin
 if (FromYearCombo.Text = '') or (FromMonthCombo.ItemIndex < 0) then begin
  ShowMessage('Оберіть період фільтру!');
  Exit;
 end;

 Month := Copy(FromMonthCombo.Text, 1, 2);
 Actual_Date := EncodeDate(StrToInt(FromYearCombo.Text), StrToInt(Month), 1);

 id := GlobalSPR.GetKEKVSpr(self, Database.Handle, FSNormal, Actual_Date, DEFAULT_ROOT_ID);

 if VarArrayDimCount(id) = 0 then Exit;
 if id[0][0] = NULL then Exit;

 with KEKVTableView.DataController do begin
  for i := 0 to RecordCount - 1 do
   if Values[i, 0] = id[0][0] then begin
    FocusedRecordIndex := i;
    Exit;
   end;

  RecordCount := RecordCount + 1;

  Values[RecordCount - 1, 0] := id[0][0];
  Values[RecordCount - 1, 2] := id[0][1];
  Values[RecordCount - 1, 1] := id[0][2];

  FocusedRecordIndex := RecordCount - 1;
 end;

 KEKVGrid.SetFocus;
end;

procedure Tjo9_print_filter_Form.dxBarButton2Click(Sender: TObject);
var
 k : integer;
begin
 with KEKVTableView.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

  DeleteRecord(k);
 end;

 KEKVGrid.SetFocus;
end;

procedure Tjo9_print_filter_Form.MemoCheckBoxPropertiesChange(
  Sender: TObject);
begin
 MemoFilter.Enabled     := MemoCheckBox.Checked;
 MemoRadioGroup.Enabled := MemoCheckBox.Checked;

 if MemoCheckBox.Checked then MemoFilter.SetFocus;
end;

procedure Tjo9_print_filter_Form.JO9CheckBoxPropertiesChange(
  Sender: TObject);
begin
 JO9_DB_CheckBox.Enabled := JO9CheckBox.Checked;
 JO9_KR_CheckBox.Enabled := JO9CheckBox.Checked;
end;

procedure Tjo9_print_filter_Form.dxBarButton3Click(Sender: TObject);
var
 id          : variant;
 Actual_Date : TDate;
 i           : integer;
 link_to     : integer;
 Month       : string;
begin
 if (FromYearCombo.Text = '') or (FromMonthCombo.ItemIndex < 0) then begin
  ShowMessage('Оберіть період фільтру!');
  Exit;
 end;

 Month := Copy(FromMonthCombo.Text, 1, 2);
 Actual_Date := EncodeDate(StrToInt(FromYearCombo.Text), StrToInt(Month), 1);

 id := GlobalSPR.GetRazdStSpr(self, Database.Handle, fsNormal, Actual_Date, -1, allData, cmSt);

 if id = NULL then Exit;

 with RTableView.DataController do begin
  for i := 0 to RecordCount - 1 do
   if Values[i, 0] = id then begin
    FocusedRecordIndex := i;
    Exit;
   end;

  RecordCount := RecordCount + 1;

  Values[RecordCount - 1, 1] := id;

  DataSet.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE, LINKTO from PUB_SPR_RAZD_ST_INFO('
  + IntToStr(id) + ')';
  DataSet.Open;

  if DataSet.RecordCount > 0 then begin
   Values[RecordCount - 1, 3] := DataSet.FieldByName('RAZD_ST_NUM').AsString;
   Values[RecordCount - 1, 5] := DataSet.FieldByName('RAZD_ST_TITLE').AsString;

   link_to := DataSet.FieldByName('LINKTO').AsInteger;
  end
  else begin
   DataSet.Close;
   Exit;
  end;

  DataSet.Close;

  DataSet.SelectSQL.Text := 'select RAZD_ST_NUM, RAZD_ST_TITLE, LINKTO from PUB_SPR_RAZD_ST_INFO('
  + IntToStr(link_to) + ')';

  DataSet.Open;

  if DataSet.RecordCount > 0 then begin
   Values[RecordCount - 1, 0] := link_to;
   Values[RecordCount - 1, 2] := DataSet.FieldByName('RAZD_ST_NUM').AsString;
   Values[RecordCount - 1, 4] := DataSet.FieldByName('RAZD_ST_TITLE').AsString;
  end;

  DataSet.Close;

  FocusedRecordIndex := RecordCount - 1;
 end;

 RGrid.SetFocus;
end;

procedure Tjo9_print_filter_Form.GrFstPropertiesChange(Sender: TObject);
begin
 if Length(PFilter._Gr) = 0 then Exit;

 if (Sender = GrFst) then begin
  if GrSnd.ItemIndex = GrFst.ItemIndex then GrSnd.ItemIndex      := PFilter._Gr[1]
  else if GrTrd.ItemIndex = GrFst.ItemIndex then GrTrd.ItemIndex := PFilter._Gr[1]
  else if GrFth.ItemIndex = GrFst.ItemIndex then GrFth.ItemIndex := PFilter._Gr[1];

  PFilter._Gr[1] := GrFst.ItemIndex;
 end
 else if Sender = GrSnd then begin
  if GrFst.ItemIndex = GrSnd.ItemIndex then GrFst.ItemIndex      := PFilter._Gr[2]
  else if GrTrd.ItemIndex = GrSnd.ItemIndex then GrTrd.ItemIndex := PFilter._Gr[2]
  else if GrFth.ItemIndex = GrSnd.ItemIndex then GrFth.ItemIndex := PFilter._Gr[2];

  PFilter._Gr[2] := GrSnd.ItemIndex;
 end
 else if Sender = GrTrd then begin
  if GrFst.ItemIndex = GrTrd.ItemIndex then GrFst.ItemIndex      := PFilter._Gr[3]
  else if GrSnd.ItemIndex = GrTrd.ItemIndex then GrSnd.ItemIndex := PFilter._Gr[3]
  else if GrFth.ItemIndex = GrTrd.ItemIndex then GrFth.ItemIndex := PFilter._Gr[3];

  PFilter._Gr[3] := GrTrd.ItemIndex;
 end
 else if Sender = GrFth then begin
  if GrFst.ItemIndex = GrFth.ItemIndex then GrFst.ItemIndex      := PFilter._Gr[4]
  else if GrSnd.ItemIndex = GrFth.ItemIndex then GrSnd.ItemIndex := PFilter._Gr[4]
  else if GrTrd.ItemIndex = GrFth.ItemIndex then GrTrd.ItemIndex := PFilter._Gr[4];

  PFilter._Gr[4] := GrFth.ItemIndex;
 end;
end;

function Tjo9_print_filter_Form.SaveFilter : boolean;
var
 Date_Beg : TDate;
 Date_End : TDate;
 i        : integer;
 Flag     : boolean;

 FromMonth : string;
 TOMonth   : string;
begin
 Result := False;

 PFilter._PrintKind := PrintKind;

 if (FromYearCombo.ItemIndex < 0) or (FromMonthCombo.ItemIndex < 0)
 or (ToYearCombo.ItemIndex < 0)   or (ToMonthCombo.ItemIndex < 0) then begin
  ShowMessage('Уведіть коректно дати початку та закінчення періоду!');
  PageControl.ActivePageIndex := 0;
  Exit;
 end;

 FromMonth := Copy(FromMonthCombo.Text, 1, 2);
 ToMonth   := Copy(ToMonthCombo.Text,   1, 2);

 Date_Beg := StartOfAMonth(StrToInt(FromYearCombo.Text), StrToInt(FromMonth));
 Date_End := EndOfAMonth(StrToInt(ToYearCombo.Text), StrToInt(ToMonth));

 if (Date_End < Date_Beg) and (PrintKind <> JO9_REPORT_SCH){ and (PrintKind <> JO9_REPORT_SCH_CUR)} then begin
  ShowMessage('Дата початку періоду повинна бути не більшою дати його закінчення!');
  PageControl.ActivePageIndex := 0;
  Exit;
 end;

 // Фильтр на мемориальные ордера

 if PageControl.Pages[3].TabVisible then begin
  PFilter._MO_Sel := nil;

  with MOTableView.DataController do begin
   for i := 0 to RecordCount - 1 do if Values[i, 2] = 1 then begin
    SetLength(PFilter._MO_Sel, Length(PFilter._MO_Sel) + 1);
    with PFilter._MO_Sel[Length(PFilter._MO_Sel) - 1] do begin
     _id_PKV       := Values[i, 0];
     _id_Type_Fin  := Values[i, 1];
     _MO_Char      := Values[i, 3];
     _kod_PKV      := Values[i, 4];
     _kod_Type_Fin := Values[i, 6];
    end;
   end;
  end;

{  if PageControl.ActivePageIndex = 3 then
   if MOTableView.DataController.RecordCount = 0 then
   begin
    ShowMessage('Не має меморіальних ордерів на вибір. Роздрукований ордер буде порожнім!');
   end
   else
   begin   }
   is_empty:=0;
   if Length(PFilter._MO_Sel) = 0 then begin
   if PageControl.ActivePageIndex = 3 then
   if MOTableView.DataController.RecordCount = 0 then
   begin
      ShowMessage('Не має меморіальних ордерів на вибір. Роздрукований ордер буде порожнім!');
      is_empty:=1;
   end
   else
   begin
   ShowMessage('Ви не обрали жодного меморіaльного ордеру для друку!' + #13
   + #13 + 'Перейдіть на вкладку "Меморільний ордер"!');

    PageControl.ActivePageIndex := 3;
    PageControlChange(Self);
    Exit;
    end
    else
    begin
   ShowMessage('Ви не обрали жодного меморіaльного ордеру для друку!' + #13
   + #13 + 'Перейдіть на вкладку "Меморільний ордер"!');

    PageControl.ActivePageIndex := 3;
    PageControlChange(Self);
    Exit;
    end
  end;
//  end;
 end;

 PFilter._Date_Beg := Date_Beg;
 PFilter._Date_End := Date_End;

 PFilter._PrintOnNewPage := PageCheckBox.Checked;
 PFilter._PrintCurDoc    := (CurOstRadioGroup.ItemIndex = 0);
 PFilter._GroupByTypeDog := cbGroupByTypeDog.Checked;

 PFilter._is_Kredit := KrDbRadioGroup.ItemIndex = 1;

 if FormatRadioGroup.ItemIndex = 0 then PFilter._PaperFormat := pfA3
 else if FormatRadioGroup.ItemIndex = 1 then PFilter._PaperFormat := pfA4
 else PFilter._PaperFormat := pfDef;
 if PrintKind = JO9_AKT_SVERKI then PFilter._PaperFormat := pfA4;

 // Фильтр на контрагента
 PFilter._Customers := nil;

 if CustCheckBox.Checked then with CustTableView.DataController do begin
  for i := 0 to RecordCount - 1 do begin
   SetLength(PFilter._Customers, Length(PFilter._Customers) + 1);

   PFilter._Customers[Length(PFilter._Customers) - 1]._id   := Values[i, 0];
   PFilter._Customers[Length(PFilter._Customers) - 1]._Name := Values[i, 1];
  end;
 end;

 // Фильтр на Смету

 PFilter._Smets := nil;

 if SCheckBox.Checked then with STableView.DataController do begin
  if RecordCount = 0 then begin
   ShowMessage('Ви обрали можливість фільтрувати по кошторису, але не обрали жодного!');
   PageControl.ActivePageIndex := 0;
   Exit;
  end;

  for i := 0 to RecordCount - 1 do begin
   SetLength(PFilter._Smets, Length(PFilter._Smets) + 1);

   PFilter._Smets[Length(PFilter._Smets) - 1]._id   := Values[i, 0];
   PFilter._Smets[Length(PFilter._Smets) - 1]._kod  := Values[i, 1];
   PFilter._Smets[Length(PFilter._Smets) - 1]._name := Values[i, 2];
  end;
 end;

 // Фильтр на Раздел/Статью

 PFilter._RazdSt := nil;

 if RStCheckBox.Checked then with RTableView.DataController do begin
  if RecordCount = 0 then begin
   ShowMessage('Ви обрали можливість фільтрувати по розділу/статті, але не обрали жодного!');
   PageControl.ActivePageIndex := 0;
   Exit;
  end;

  for i := 0 to RecordCount - 1 do begin
   SetLength(PFilter._RazdSt, Length(PFilter._RazdSt) + 1);

   PFilter._RazdSt[Length(PFilter._RazdSt) - 1]._id_R  := Values[i, 0];
   PFilter._RazdSt[Length(PFilter._RazdSt) - 1]._id_St := Values[i, 1];
  end;
 end;

 // Фильтр на КЕКВ

 PFilter._Kekv := nil;

 if KEKVCheckBox.Checked then with KEKVTableView.DataController do begin
  if RecordCount = 0 then begin
   ShowMessage('Ви обрали можливість фільтрувати по КЕКВу, але не обрали жодного!');
   PageControl.ActivePageIndex := 1;
   Exit;
  end;

  for i := 0 to RecordCount - 1 do begin
   SetLength(PFilter._KEKV, Length(PFilter._KEKV) + 1);

   PFilter._KEKV[Length(PFilter._KEKV) - 1]._id   := Values[i, 0];
   PFilter._KEKV[Length(PFilter._KEKV) - 1]._kod  := Values[i, 1];
   PFilter._KEKV[Length(PFilter._KEKV) - 1]._name := Values[i, 2];
  end;
 end;

 // Фильтр на родные счета

 PFilter._NSch := nil;

 if NSchCheckBox.Checked then with NSchTableView.DataController do begin
  Flag := False;

  for i := 0 to RecordCount - 1 do if Values[i, 1] = 1 then begin
   Flag := True;
   Break;
  end;

  if not Flag then begin
   ShowMessage('Ви обрали можливість фільтрувати по рахункам системи, але не обрали жодного!');
   PageControl.ActivePageIndex := 1;
   Exit;
  end;

  for i := 0 to RecordCount - 1 do begin
   if VarIsNull(Values[i, 1]) then Continue;
   if Values[i, 1] = 0 then Continue;

   SetLength(PFilter._NSch, Length(PFilter._NSch) + 1);

   PFilter._NSch[Length(PFilter._NSch) - 1]._id_Sch   := Values[i, 0];
   PFilter._NSch[Length(PFilter._NSch) - 1]._Num_Sch  := Values[i, 2];
   PFilter._NSch[Length(PFilter._NSch) - 1]._Name_Sch := Values[i, 3];
  end;
 end;

 // Фильтр на корреспондирующие счета

 PFilter._CSch := nil;

 if CSchCheckBox.Checked then with CSchTableView.DataController do begin
  Flag := False;

  for i := 0 to RecordCount - 1 do if Values[i, 1] = 1 then begin
   Flag := True;
   Break;
  end;

  if not Flag then begin
   ShowMessage('Ви обрали можливість фільтрувати по кореспондуючим рахункам, але не обрали жодного!');
   PageControl.ActivePageIndex := 1;
   Exit;
  end;

  for i := 0 to RecordCount - 1 do begin
   if VarIsNull(Values[i, 1]) then Continue;
   if Values[i, 1] = 0 then Continue;

   SetLength(PFilter._CSch, Length(PFilter._CSch) + 1);

   PFilter._CSch[Length(PFilter._CSch) - 1]._id_Sch   := Values[i, 0];
   PFilter._CSch[Length(PFilter._CSch) - 1]._Num_Sch  := Values[i, 2];
   PFilter._CSch[Length(PFilter._CSch) - 1]._Name_Sch := Values[i, 3];
  end;
 end;

 // Фильтр на оcнование

 if MemoCheckBox.Checked then begin
  if MemoFilter.Text = '' then
   if MessageDlg('Увага!', 'Ви обрали можливість фільтрувати по підставі, але не увели текст фільтру!'
   + #13 + #13 + 'Ви дійсно бажаєте продовжити?', mtConfirmation, [mbYes, mbNo]) <> mrYes then begin
    PageControl.ActivePageIndex := 1;
    Exit;
   end;

  PFilter._DoNote  := True;
  PFilter._Note    := MakeNoteFilter;
  PFilter._Note_Or := MemoRadioGroup.ItemIndex = 1;
 end
 else PFilter._DoNote := False;

 // Фильтр на Дебеторов/Кредиторов

 if JO9CheckBox.Checked then begin
  if not (JO9_DB_CheckBox.Checked or JO9_KR_CheckBox.Checked) then begin
   ShowMessage('Ви обрали можливість фільтрувати по Дебеторам/Кредиторам, але не обрали жодного!');
   PageControl.ActivePageIndex := 1;
   Exit;
  end;

  PFilter._Db_Cust := JO9_DB_CheckBox.Checked;
  PFilter._Kr_Cust := JO9_KR_CheckBox.Checked;
 end
 else begin
  PFilter._Db_Cust := False;
  PFilter._Kr_Cust := False;
 end;

 // Фильтр для отчета по задолженности контрагентов в разрезе лет

 if PrintKind = JO9_REPORT_OST then begin
  PFilter._OstYear  := StrToInt(OstYearComboBox.Text);
  PFilter._OstMonth := StrToInt(Copy(OstMonthComboBox.Text, 1, 2));

  if OstShowMonthCheckBox.Checked then PFilter._YearByMonths := OstShowMonthSpinEdit.Value
  else PFilter._YearByMonths := -1;

  if ShowSmCheckBox.Checked then begin
   PFilter._ShowSRStKEKV := True;
   PFilter._GroupBySch   := OstSmRadioGroup.ItemIndex = 0;
  end
  else PFilter._ShowSRStKEKV := False;

  if OstKindRadioGroup.ItemIndex = 0 then PFilter._DateKind := odkAppear
  else PFilter._DateKind := odkMove;

  PFilter._is_Kredit   := OstDbKrRadioGroup.ItemIndex = 1;
  PFilter._ShowSelYear := ShowOnlySelYearCheckBox.Checked;
 end;

 // фильтр на рег.номера договоров для акта сверки
 if PrintKind =  JO9_AKT_SVERKI then
 begin
 PFilter._Dogs := nil;

 with cxDogTableView.DataController do begin
  for i := 0 to RecordCount - 1 do begin
    if Values[i,1]=1 then
    begin
    SetLength(PFilter._Dogs, Length(PFilter._Dogs) + 1);
    PFilter._Dogs[Length(PFilter._Dogs) - 1]._id   := Values[i, 0];
    end
  end;
  for i := 0 to RecordCount - 1 do begin
    if ((Values[i,1]=1) and (Values[i, 5]<>Values[i, 0])) then
    begin
    SetLength(PFilter._Dogs, Length(PFilter._Dogs) + 1);
    PFilter._Dogs[Length(PFilter._Dogs) - 1]._id   := Values[i, 5];
    end
  end;
 end;
 end;

 //Закомитить траназакцию, которой читаю, чтобы смотреть данные в темповых таблицах
 PFilter._CommitTrans := cbCommit.Checked;

 Result := True;
end;

procedure Tjo9_print_filter_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if not (fsModal in FormState) then SetFormParams(Self);

 Action := caFree;
end;

function Tjo9_print_filter_Form.MakeNoteFilter: TStringArray;
var
 s   : string;
 p   : integer;
begin
 s   := MemoFilter.Text;

 Result := nil;

 while s <> '' do begin
  s := Trim(s);

  p := Pos(' ', s);

  if p > 0 then begin
   SetLength(Result, Length(Result) + 1);
   Result[Length(Result) - 1] := Copy(s, 1, p - 1);

   s := Copy(s, p + 1, Length(s) - p);
  end
  else begin
   SetLength(Result, Length(Result) + 1);
   Result[Length(Result) - 1] := s;

   Break;
  end;
 end;
end;

procedure Tjo9_print_filter_Form.cbRepOutKindKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  ApplyButton.SetFocus;
 end;
end;

procedure Tjo9_print_filter_Form.ShowSmCheckBoxPropertiesChange(
  Sender: TObject);
begin
 OstSmRadioGroup.Enabled := ShowSmCheckBox.Checked;

 if ShowSmCheckBox.Checked then OstSmRadioGroup.SetFocus;
end;

procedure Tjo9_print_filter_Form.OstShowMonthCheckBoxPropertiesChange(
  Sender: TObject);
begin
 OstShowMonthLabel.Enabled       := OstShowMonthCheckBox.Checked;
 OstShowMonthSpinEdit.Enabled    := OstShowMonthCheckBox.Checked;
 ShowOnlySelYearCheckBox.Enabled := OstShowMonthCheckBox.Checked;
 ShowOnlySelYearCheckBox.Checked := OstShowMonthCheckBox.Checked;

 if OstShowMonthCheckBox.Checked then OstShowMonthSpinEdit.SetFocus;
end;

procedure Tjo9_print_filter_Form.OstYearComboBoxPropertiesChange(
  Sender: TObject);
var
 i : integer;
 m : integer;
begin
 OstMonthComboBox.Properties.Items.Clear;

 if (StrToInt(OstYearComboBox.Text) = SYS_INFO^._Year) and (SYS_INFO^._Month <= 12) then begin
  m := -1;

  if StrToInt(FromYearCombo.Text) = YearOf(SYS_INFO^._Sys_Beg) then begin
   for i := MonthOf(SYS_INFO^._Sys_Beg) to SYS_INFO^._Month do begin
    if i > 12 then Break;

    if i < 10 then OstMonthComboBox.Properties.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else OstMonthComboBox.Properties.Items.Add(IntToStr(i) + '-' + GetMonthName(i));

    if i = SYS_INFO^._Month then m := OstMonthComboBox.Properties.Items.Count - 1;
   end;
  end
  else begin
   for i := 1 to SYS_INFO^._Month do begin
    if i > 12 then Break;

    if i < 10 then OstMonthComboBox.Properties.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else OstMonthComboBox.Properties.Items.Add(IntToStr(i) + '-' + GetMonthName(i));

    if i = SYS_INFO^._Month then m := OstMonthComboBox.Properties.Items.Count - 1;
   end;
  end;

  OstMonthComboBox.ItemIndex := m;
 end
 else begin
  if (StrToInt(OstYearComboBox.Text) = SYS_INFO^._Year + 1) and (SYS_INFO^._Month > 12) then
   for i := 1 to SYS_INFO^._Month - 12 do
    if i < 10 then OstMonthComboBox.Properties.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else OstMonthComboBox.Properties.Items.Add(IntToStr(i) + '-' + GetMonthName(i))
  else if StrToInt(OstYearComboBox.Text) = YearOf(SYS_INFO^._Sys_Beg) then
   for i := MonthOf(SYS_INFO^._Sys_Beg) to 12 do
    if i < 10 then OstMonthComboBox.Properties.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else OstMonthComboBox.Properties.Items.Add(IntToStr(i) + '-' + GetMonthName(i))
  else
   for i := 1 to 12 do
    if i < 10 then OstMonthComboBox.Properties.Items.Add('0' + IntToStr(i) + '-' + GetMonthName(i))
    else OstMonthComboBox.Properties.Items.Add(IntToStr(i) + '-' + GetMonthName(i));

  OstMonthComboBox.ItemIndex := 0;
 end;
end;

procedure Tjo9_print_filter_Form.OstShowMonthSpinEditPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
 if DisplayValue < OstShowMonthSpinEdit.Properties.MinValue then DisplayValue := OstShowMonthSpinEdit.Properties.MinValue
 else if DisplayValue > OstShowMonthSpinEdit.Properties.MaxValue then DisplayValue := OstShowMonthSpinEdit.Properties.MaxValue;

 Error := False;
end;

procedure Tjo9_print_filter_Form.FormResize(Sender: TObject);
begin
 if Width<708 then Width:=708;
 if Height<499 then Height:=499;
 //Position:=poOwnerFormCenter;
 MainPanel.Left := (Width - MainPanel.Width - 7) div 2;
 MainPanel.Top  := (Height - MainPanel.Height - 32) div 2;  //38
end;

procedure Tjo9_print_filter_Form.SelectMO;
var
 Date_Beg : tdate;
 Date_End : tdate;

 FromMonth : string;
 ToMonth   : string;
begin
 DataSet.Close;

 MOTableView.DataController.RecordCount := 0;

 FromMonth := Copy(FromMonthCombo.Text, 1, 2);
 ToMonth   := Copy(ToMonthCombo.Text,   1, 2);

 Date_Beg := StartOfAMonth(StrToInt(FromYearCombo.Text), StrToInt(FromMonth));
 Date_End := EndOfAMonth(StrToInt(ToYearCombo.Text), StrToInt(ToMonth));

 DataSet.SelectSQL.Text := 'select * from MBOOK_MO_GET_REG_UCH_EX2('
 + QuotedStr(DateToStr(Date_Beg)) + ',' + QuotedStr(DateToStr(Date_End))
 + ',' + IntToStr(SYS_INFO^._id_Reg_Uch) + ')';
 DataSet.Open;

 while not DataSet.Eof do begin
  with MOTableView.DataController do begin
   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 0] := DataSet['ID_PKV'];
   Values[RecordCount - 1, 1] := DataSet['ID_TYPE_FINANCE'];
   Values[RecordCount - 1, 2] := 1;
   Values[RecordCount - 1, 3] := DataSet['MO_CHAR'];
   Values[RecordCount - 1, 4] := DataSet['PKV_KOD'];
   Values[RecordCount - 1, 5] := DataSet['PKV_TITLE'];
   Values[RecordCount - 1, 6] := DataSet['TYPE_FINANCE_CODE'];
   Values[RecordCount - 1, 7] := DataSet['TYPE_FINANCE_NAME'];
  end;

  DataSet.Next;
 end;

 DataSet.Close;
end;

procedure Tjo9_print_filter_Form.PageControlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 if (FromYearCombo.ItemIndex < 0) or (FromMonthCombo.ItemIndex < 0)
 or (ToYearCombo.ItemIndex < 0)   or (ToMonthCombo.ItemIndex < 0) then begin
  AllowChange := False;

  ShowMessage('Уведіть коректно дати початку та закінчення періоду!');
  Exit;
 end;

 AllowChange := True;
end;

procedure Tjo9_print_filter_Form.PageControlChange(Sender: TObject);
var
 wf        : TForm;
 FromMonth : string;
 ToMonth   : string;

 Date_Beg : TDate;
 Date_End : TDate;
 str_id_customer: string;
 i,k:Integer;
begin
 FromMonth := Copy(FromMonthCombo.Text, 1, 2);
 ToMonth   := Copy(ToMonthCombo.Text,   1, 2);

 Date_Beg := StartOfAMonth(StrToInt(FromYearCombo.Text), StrToInt(FromMonth));
 Date_End := EndOfAMonth(StrToInt(ToYearCombo.Text), StrToInt(ToMonth));
  //Mardar 30.05.13
 if (PageControl.ActivePageIndex = 1) and (cxGridDog.Visible=True) then
 begin

   str_id_customer:='';
   for i:=0 to CustTableView.DataController.RecordCount-1 do
    if i=0 then str_id_customer:= IntToStr(CustTableView.DataController.Values[i, 0])
    else str_id_customer:=str_id_customer+','+IntToStr(CustTableView.DataController.Values[i, 0]);
   if  str_id_customer<>'' then
   begin
   wf := ShowWaitForm(Self);
   Ds_Customer_dog.close;
   Ds_Customer_dog.SelectSQL.Clear;
   Ds_Customer_dog.SelectSQL.Add('select distinct a.id_dog, a.kod_dog, a.regest_num, a.n_dog, a.d_dog from dog_dt_document a');
   Ds_Customer_dog.SelectSQL.Add('         inner join JO9_DT_OST_SMET S on ((a.id_dog=s.id_dog)or (a.kod_dog=s.id_dog))');
   Ds_Customer_dog.SelectSQL.Add('         inner join JO9_DT_OST_DOC D on d.id_ost_doc=s.id_ost_doc');
   Ds_Customer_dog.SelectSQL.Add('         where a.id_customer in ('+str_id_customer+')');
   Ds_Customer_dog.SelectSQL.Add('           and d.date_reg = :date_beg');
   Ds_Customer_dog.SelectSQL.Add('           and D.KOD_SYS = :id_reg');
   Ds_Customer_dog.SelectSQL.Add('union');
   Ds_Customer_dog.SelectSQL.Add('select distinct a.id_dog, a.kod_dog, a.regest_num, a.n_dog, a.d_dog from dog_dt_document a');
   Ds_Customer_dog.SelectSQL.Add('         inner join pub_dt_all_prov P on ((a.id_dog=p.db_id_dog) or (a.id_dog=p.kr_id_dog)or (a.kod_dog=p.db_id_dog) or (a.kod_dog=p.kr_id_dog) )');
   Ds_Customer_dog.SelectSQL.Add('         inner join pub_sp_main_oper o on p.id_oper=o.id_oper');
   Ds_Customer_dog.SelectSQL.Add('         where a.id_customer in('+str_id_customer+')');
   Ds_Customer_dog.SelectSQL.Add('           and p.date_reg between :date_beg and :date_end');
   Ds_Customer_dog.SelectSQL.Add('           and o.kr_id_mo=:id_reg');
   Ds_Customer_dog.SelectSQL.Add('           and :date_beg between o.date_beg and o.date_end');
   Ds_Customer_dog.Prepare;
   Ds_Customer_dog.ParamByName('date_beg').AsDate:=Date_Beg;
   Ds_Customer_dog.ParamByName('date_end').AsDate:=Date_End;
   Ds_Customer_dog.ParamByName('id_reg').AsInteger:=SYS_INFO^._id_Reg_Uch;
   Ds_Customer_dog.CloseOpen(False);
   Ds_Customer_dog.FetchAll;
   Ds_Customer_dog.First;

  cxDogTableView.DataController.RecordCount:=  0;
   k:=0;

  while not Ds_Customer_dog.Eof do
  begin
     cxDogTableView.DataController.RecordCount:= cxDogTableView.DataController.RecordCount+1;
     //showmessage(VarToStr(Ds_Customer_dog.Fieldbyname('id_dog').Value));
     cxDogTableView.DataController.Values[cxDogTableView.DataController.RecordCount-1, 0] :=Ds_Customer_dog.Fieldbyname('id_dog').Value;
     cxDogTableView.DataController.Values[cxDogTableView.DataController.RecordCount-1, 1] := 1;
     cxDogTableView.DataController.Values[cxDogTableView.DataController.RecordCount-1, 2] := Ds_Customer_dog.Fieldbyname('regest_num').AsString;
     cxDogTableView.DataController.Values[cxDogTableView.DataController.RecordCount-1, 3] := Ds_Customer_dog.Fieldbyname('n_dog').AsString;
     cxDogTableView.DataController.Values[cxDogTableView.DataController.RecordCount-1, 4] := Ds_Customer_dog.Fieldbyname('d_dog').AsString;
     cxDogTableView.DataController.Values[cxDogTableView.DataController.RecordCount-1, 5] := Ds_Customer_dog.Fieldbyname('kod_dog').Value;

   Ds_Customer_dog.Next;
   Inc(k);
  end;



 cxGridDog.SetFocus;
 CloseWaitForm(wf);
 end;

 end;
 //
 if PageControl.ActivePageIndex <> 3 then Exit;

 MOGroupBox.Caption := SYS_INFO^._Sys_Caption;



 if (Date_Beg = Old_Date_Beg) and (Date_End = Old_Date_End) then Exit;

 Old_Date_Beg := Date_Beg;
 Old_Date_End := Date_End;

 wf := ShowWaitForm(Self);
 SelectMO;
 CloseWaitForm(wf);
end;

procedure Tjo9_print_filter_Form.MOTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then begin
  ID_PKV_Column.Visible          := not ID_PKV_Column.Visible;
  ID_TYPE_FINANCE_Column.Visible := not ID_TYPE_FINANCE_Column.Visible;
 end;
end;

procedure Tjo9_print_filter_Form.cxNumDogPropertiesChange(Sender: TObject);
begin
//PFilter._PrintNumDog:=cxNumDog.Checked;
end;

procedure Tjo9_print_filter_Form.cb_svodPropertiesChange(Sender: TObject);
begin
PFilter._PrintSvodTable:=cb_svod.Checked;
end;

end.
